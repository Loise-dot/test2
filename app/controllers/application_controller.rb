class ApplicationController < ActionController::API
    include ActionController::Cookies
    # protect_from_forgery with: :null_session
    def blog
        blog ||= Blog.find_by(id: session[:blogs_id])
     end
end