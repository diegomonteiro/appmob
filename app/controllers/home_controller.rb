class HomeController < ApplicationController
	def index
		@events = Event.where(nil)

		@count_holes = @events.where(event_type: Event.types[:hole]).count
		@count_reclamation = @events.where(event_type: Event.types[:reclamation]).count
		@count_trash = @events.where(event_type: Event.types[:trash]).count
		@count_desaster = @events.where(event_type: Event.types[:dissaster]).count
		@count_assault = @events.where(event_type: Event.types[:assault]).count
		@count_solveds = @events.where(event_status: Event.statuses[:solved]).count
	end
end