class PortalController < ApplicationController
  def index
    @lf = Applications.new("land_f","index","/assets/lf.jpg","Lost&Found",nil)
    @applications = Array.new
    @applications[0] = @lf

    @user = session[:loginedUser]
  end
end
