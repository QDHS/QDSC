class PortalController < ApplicationController
  def index
    @user = session[:loginedUser]
  end
end
