class LandFController < ApplicationController

	def index
		if session[:loginedUser]
			@user = UniUser.find_by_email session[:loginedUser]["email"]
		end
		@objects = LfObject.all
		for k in @objects
			if !File.exist?("./public/images/#{k[:image]}")
				k[:image] = ""
			end
		end
	end

	def assert_user(user)
		return true
	end

	def new_obj
		@user = UniUser.find_by_email session[:loginedUser]["email"]
		if @user != nil && @user[:user_class] == "Admin"
			@obj = LfObject.new
		else
			redirect_to :controller=>'land_f',:action=>'index'
		end
	end

	def delete
		@lfobj = LfObject.find_by(params[:obj])
		if @lfobj
			@lfobj.delete
			redirect_to :controller=>'land_f',:action=>'index'
		end
	end

	def new
		@user = UniUser.find_by_email session[:loginedUser]["email"]
		if @user != nil && @user[:user_class] == "Admin"
			@obj = LfObject.new()
			@obj[:description] = params[:land_f][:description]
			@obj[:title] = params[:land_f][:title]
			if filename = uploadFile(params[:land_f][:image])
				@file = filename + Time.now.to_i.to_s
				File.rename("public/images/#{filename}", "public/images/#{@file}")
			end
			@obj[:image] = @file
			@obj.save
			redirect_to :controller=>'land_f',:action=>'index'
		else
			redirect_to :controller=>'land_f',:action=>'index'
		end
	end

end
