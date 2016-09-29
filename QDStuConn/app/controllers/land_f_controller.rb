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
		@user = UniUser.find_by_id session[:loginedUser]["id"]
		if @user == nil || @user[:user_class] != "Admin"
			redirect_to :controller=>'land_f',:action=>'index'
		end
		@obj = LfObject.new
	end

	def claim
		@user = UniUser.find_by_id session[:loginedUser]["id"]
		@lf_obj = LfObject.find_by_id(params[:obj])

		if !@user.nil? && @lf_obj[:claim].nil?
			@lf_obj[:claim] = @user
			@lf_obj.save
		end

		redirect_to :controller=>'land_f',:action=>'index'
	end

	def delete
		if params[:obj]
			@lfobj = LfObject.find_by_id(params[:obj])
			if @lfobj
				@lfobj.delete
				redirect_to :controller=>'land_f',:action=>'index'
			end
		end
	end

	def new
		@user = UniUser.find_by_id session[:loginedUser]["id"]
		if @user != nil && @user[:user_class] == "Admin"
			@obj = LfObject.new()
			@obj[:description] = params[:land_f][:description]
			@obj[:title] = params[:land_f][:title]
			if params[:land_f][:image]
				if filename = uploadFile(params[:land_f][:image])
					@file = filename + Time.now.to_i.to_s
					File.rename("public/images/#{filename}", "public/images/#{@file}")
				end
				@obj[:image] = @file
			else
				@obj[:image] = ""
			end
			@obj.save
			redirect_to :controller=>'land_f',:action=>'index'
		else
			redirect_to :controller=>'land_f',:action=>'index'
		end
	end

end
