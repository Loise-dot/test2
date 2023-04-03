class SessionsController < ActionController::Base
  skip_before_action :verify_authenticity_token
  # protect_from_forgery with: :null_session
  def create
    user = User.find_by(username: params[:username])
    if user
      if user&.authenticate(params[:password])
          session[:user_id] = user.id
          render json: user, status: :ok
      else
          render json: {errors: 'Invalid Password or Username'}, status: :unauthorized
      end
    end
  end
  

  
  def destroy
    if session[:user_id]
        session.delete :user_id
        head :no_content
    end
   
  end
end


