class BlogsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response
  
    def index
      render json: Blog.all
    end
  
    def show
      blog = Blog.find_by!(id: params[:id])
      render json: blog, status: :ok
    end
  
    def update
      blog = Blog.find_by!(id: params[:id])
      blog.update(description: params[:description])
      render json: blog, status: :accepted
    end
  
    def create
      blog = Blog.create(blog_params.merge(id: nil))
      render json: blog, status: :created
    end
  
    def destroy
      blog = Blog.find_by(id: params[:id])
      blog.destroy
      head :no_content
    end
  
    private
  
    def not_found_response
      render json: { error: "Blog not found" }, status: :not_found
    end
  
    def unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
  
    def blog_params
      params.permit(:id, :title, :description)
    end
  end
  