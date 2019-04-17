class Event < ApplicationRecord

  belongs_to :city
  belongs_to :user
  has_many :event_responses
  has_many :votes

  enum type: [:hole, :reclamation , :trash , :dissaster , :assault ]
  enum status: [:pendent , :working , :solved ]

  mount_uploaders :event_files, EventFileUploader

  scope :by_user, ->(user_id) { where("user_id = ?", user_id ) }

  def self.calc_reputation_user(user_id)
  	events = Event.by_user(user_id)
  	user = User.find(user_id)
  	
    votes = Vote.where("event_id IN (?)", events.ids).group(:liked).count

    unless votes.blank?
      count_down = votes[false]
      count_up   = votes[true]  

      total_votes = count_up+count_down

      per_up = (count_up * 100 )/(total_votes)
      per_down = (count_up * 100 )/(total_votes)
      diff_days = TimeDifference.between(user.created_at, Time.zone.now).in_days

      ((per_up * 5) + (per_down * 2) + (diff_days * 3))/100
    end

    

  end

  

end
