class ApplicationController < ActionController::Base
	
	include CanCan::ControllerAdditions

	protect_from_forgery prepend: true
	before_action :configure_devise_params, if: :devise_controller?
	
	before_action :set_paper_trail_whodunnit

	rescue_from CanCan::AccessDenied do |exception|
	    #redirect_to root_url, notice: ['alert', exception.inspect]
	    #render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
	    msg = "Acesso não autorizado a esta página, verifique suas credenciais."
	    respond_to do |format|
	      format.json { head :forbidden, content_type: 'text/html' }
	      format.html { redirect_to root_url, notice: ['danger', msg.html_safe] }
	      format.js   { head :forbidden, content_type: 'text/html' }
	    end
	end

	rescue_from ActiveRecord::RecordNotFound do
	   render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => true
	end

	after_action :mark_activity  

	def user_for_paper_trail
    	user_signed_in? ? current_user.id : 'Public user'  # or whatever
  	end

  	

  	protected
	  def configure_devise_params
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :email, :password, :password_confirmation])
	  end

	  def mark_activity
	    current_user.try :touch
	  end
end
