class SessionsController < ApplicationController

	def create
		user = User.find_by(email: session_params[:email])

		if (user && user.authenticate(session_params[:password]))
			session[:user_id] = user.id
			redirect_to "/events"
		else
			flash[:errors] = ["Invalid User Creditials"]
			redirect_to :back
		end
	end

	def destroy
		reset_session
		redirect_to :root
	end

	private
	def session_params
		params.require(:sessions).permit(:email, :password)
	end
	
end
