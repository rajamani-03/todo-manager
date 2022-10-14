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

        # find the todo with the id which corresponds to the the logged in user
        # todo = Todo.where(user_id: current_user.user_id).find(id)
        todo = Todo.user(current_user.user_id).find(id)
        

        # if the task is done now and it has repeat after value greator than 0 then update the due date
        if todo.is_done == false and todo.repeat_after > 0
            todo.due_date = (Date.today + todo.repeat_after)
        else
            is_done = (is_done=="done") ?  true : false
            todo.is_done = is_done
        end

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