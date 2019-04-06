class ApplicationController < ActionController::Base
	protect_from_forgery prepend: true
	before_action :configure_devise_params, if: :devise_controller?
	before_action :authenticate_user!
	before_action :set_paper_trail_whodunnit

	def user_for_paper_trail
    	user_signed_in? ? current_user.id : 'Public user'  # or whatever
  	end

  	protected
	  def configure_devise_params
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :email, :password, :password_confirmation])
	    
	end
end
