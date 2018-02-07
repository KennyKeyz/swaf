class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  before_action :authenticate_user!


  
  rescue_from CanCan::AccessDenied do |exception|  
    redirect_to "/", :alert => exception.message 
  end


	
def after_sign_in_path_for(resource)
    themed_pages_landing_path
end


 





  
end
