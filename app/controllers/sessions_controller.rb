class SessionsController < ApplicationController
	def new

	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)

		if user && user.authenticate(params[:session][:password])
			#Sign the user in
			sign_in user
			redirect_to user
		else
			#create an error message
			flash.now[:error] = 'Invalid email/password conbination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
