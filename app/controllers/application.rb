# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout proc{ |c| c.request.xhr? ? false : "application" }
  include AuthenticatedSystem
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '204c0b34957bf747051e2edf611d0645'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  before_filter :load_sections
  
  def load_sections
    @site_sections = SiteSection.find(:all, :order => :position)
  end
  
  def authorized?(action = action_name, resource = nil)
    if params[:admin]
      logged_in? and params[:admin] != "false"
    else
      logged_in?
    end
  end
end
