class CalcularReputacaoJob < ApplicationJob
  queue_as :default

  def perform(*args)
    users = User.where(:nil)

    users.each do |user|
    	events = user.events
    	
    end
  end
end
