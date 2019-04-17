class Event < ApplicationRecord

  belongs_to :city
  belongs_to :user
  has_many :event_responses
  has_many :votes

  enum type: [:hole, :reclamation , :trash , :dissaster , :assault ]
  enum status: [:pendent , :working , :solved ]

  mount_uploaders :event_files, EventFileUploader

  has_paper_trail

  scope :by_user, ->(user_id) { where("user_id = ?", user_id ) }

  def self.calc_reputation_users
    users = User.where(nil)

    users.each do |user|

    	events = Event.by_user(user_id)
    	user = User.find(user_id)
    	
      unless events.ids.blank?
        votes = Vote.where("event_id IN (?)", events.ids).group(:liked).count
      else
        votes = {:false => 0, :true => 0}
      end

      unless votes.blank?
        count_down = (votes[false].nil?) ? 0 : votes[false]
        count_up   = (votes[true].nil?) ? 0 : votes[true]  

        total_votes = count_up+count_down

        if total_votes > 0
          per_up = (count_up * 100 )/(total_votes)
          per_down = (count_up * 100 )/(total_votes)
        else
          per_up = 0
          per_down = 0
        end

        diff_days = TimeDifference.between(user.created_at, Time.zone.now).in_days

        ret = ((per_up * 5) + (per_down * 2) + (diff_days * 3))/100

        rep = (ret.nil?) ? 0 : (ret > 10) ? 10 : ret

        user.reputation = rep.to_f
        user.save
      end
    end

    

  end

  

end
