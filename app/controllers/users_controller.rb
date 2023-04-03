class UsersController < ApplicationController
    
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response
    wrap_parameters format: []
    def create 
        user = User.create!(user_params)
            render json: user, status: :created
    end

    def show

        user = User.find_by(id: session[:user_id])
        if user
            render json: user
        else
            render json: {error: "Not authorized"}, status: :unauthorized
        end
    end

    

    

    private
    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end

    
    def unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
