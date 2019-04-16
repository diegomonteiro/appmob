class Event < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :event_responses
  has_many :votes

  enum type: [:hole, :reclamation , :trash , :dissaster , :assault ]
  enum status: [:pendent , :working , :solved ]

  scope :by_user, ->(user_id) { where("user_id = ?", user_id ) }

  def self.calc_reputation_user(user_id)
  	events = Event.by_user(user_id)
  	user = User.find(user_id)
  	count_up_votes =  events.select("sum(votes_up) as total").group(:user_id).total.to_i
  	count_down_votes = events.select("sum(votes_down) as total").group(:user_id).total.to_i

  	unless user.blank?
  		date_diff = ((Time.current - user.created_at)/1.day).round
  	end

  	return ((count_up_votes * 5)+(count_down_votes * 2)+(date_diff * 3))/100
  end

  

end
