class UsersController < ApplicationController
    skip_before_action :ensure_user_logged_in

    def index
        render "index"
    end

    def new
        if current_user
            redirect_to todos_path
        else
            render "new"
        end
    end
    
    def create
         user = User.create!(
            name: params[:name],
            email: params[:email],
            password: params[:password]
         )
         session[:current_user_id] = user.user_id
         redirect_to todos_path
    end
end  