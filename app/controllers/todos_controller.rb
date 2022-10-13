class TodosController < ApplicationController
    def index
        render "index", locals: {current_user: current_user}
        # render plain: Todos.all
    end

    def create
        task_name = params[:task_name]
        due_date = DateTime.parse(params[:due_date])
        new_todo = Todo.create!(
            user_id: current_user.user_id, 
            task: task_name,
            due_date: due_date,
            is_done: false,
            priority: params[:priority],
            repeat_after: params[:repeat_after]!= nil ? params[:repeat_after] : 0 )
        redirect_to todos_path
        # response_text = "Ne w Todo created with ID: #{new_todo.id}"
        # render plain: "response_text"
    end

    def update
        id = params[:todo_id]
        is_done = params[:is_done]
        # todo = Todo.where(user_id: current_user.user_id).find(id)
        todo = Todo.user(current_user.user_id).find(id)
        is_done = (is_done=="done") ?  true : false
        todo.is_done = is_done
        todo.save!
        redirect_to todos_path
    end
    
    def destroy
        id = params[:todo_id]
        todo = Todo.user(current_user.user_id).find(id)
        todo.destroy
        redirect_to todos_path 
    end
end