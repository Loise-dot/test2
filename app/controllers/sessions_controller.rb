class SessionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response
  
    def new
      render "sessions/new"
    end
  
    def create
      user = User.find_by(username: params[:username])
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_url, notice: 'Logged in!'
      else
        flash.now[:alert] = 'Invalid username or password'
        render :new
      end
    end
  
    def destroy
      session.delete :user_id
      redirect_to root_url, notice: 'Logged out!'
    end
  
    private
  
    def not_found_response
      render json: { error: 'User not found' }, status: :not_found
    end
  
    def unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
  