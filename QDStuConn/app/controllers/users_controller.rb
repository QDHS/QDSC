class UsersController < ApplicationController
  def login
  end

  def register
    @user = UniUser.new
  end

  def passwd

  end

  def initialize
    super
  end

  def new
    params.permit!
    params[:uni_user][:email] = params[:uni_user][:email].downcase
    @user = UniUser.find_by_email(params[:uni_user][:email])
    if @user != nil
      redirect_to :controller=>'portal',:action=>'index',:motd=>"This account has already been registered"
    else
      @pab = params[:uni_user]
      if @pab[:email] != "" && @pab[:name] != ""
        @pab[:password] = rand(999999)
        @user = UniUser.new(params[:uni_user])
        if @user.save
          NotifierMailer.welcome(@pab).deliver_now
          redirect_to :controller=>'portal',:action=>'index',:motd=>"Please check your registration email"
        else
          redirect_to :controller=>'users',:action=>'register'
        end
      else
        redirect_to :controller=>'users',:action=>'register'
      end
    end
  end

  def checklogin
    params[:user][:email] = params[:user][:email].downcase
    @user = UniUser.find_by_email(params[:user][:email])
    if @user != nil
      if params[:commit] == "Login"
        if @user[:password] == params[:user][:password]
          session['loginedUser'] = @user
          redirect_to :controller=>'portal',:action=>'index'
        else
          session['loginedUser'] = nil
        	redirect_to :controller=>'users',:action=>'login',:motd=>'Wrong password or email'
        end
      elsif params[:commit] == "Send Dynamic Password"
        pass = rand(999999)
        @user.password = pass
        @user.save
        NotifierMailer.pass(@user).deliver_now
        redirect_to :controller=>'users',:action=>'login',:motd=>'Password sent to email'
      else
        redirect_to :controller=>'users',:action=>'login',:motd=>'Something happened'
      end
    else
    	session['loginedUser'] = nil
    	redirect_to :controller=>'users',:action=>'login',:motd=>'Wrong password or email'
    end
  end

  def logout
    session[:loginedUser] = nil
    redirect_to :controller=>'portal',:action=>'index'
  end
end
