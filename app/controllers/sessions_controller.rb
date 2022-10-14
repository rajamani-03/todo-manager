class SessionsController < ApplicationController
    skip_before_action :ensure_user_logged_in 

    def new   
        if current_user
            redirect_to todos_path
        else
            render "new", locals: {password_status: "enter password"}
        end
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:current_user_id] = user.user_id
            redirect_to todos_path
        else
            render "new", locals: {password_status: "incorrect password"}
       end 
    end

    def destroy
        session[:current_user_id] = nil
        @current_user = nil
        redirect_to "/"
    end
end