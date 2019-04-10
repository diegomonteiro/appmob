class HomeController < ApplicationController
	def index
		@events = Event.where(nil)

		@count_holes = 10
		@count_reclamation = 4
		@count_trash = 5
		@count_desaster = 4
		@count_assault = 10
		@count_solveds = 6
	end
end