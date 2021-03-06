class SessionsController < ApplicationController
  
  def new
  end

  def create
  	 user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
 	log_in user
    redirect_to create
	else flash[:danger] = 'Invalid email/password combination'
    render 'new'
  	end
	end

  def destroy
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
