class Todo < ApplicationRecord
    
    belongs_to :user

    validates :user_id, presence: true
    validates :task, presence: true
    validates :due_date, presence: true
 
    def self.about_me
        return "Iam Todo Manager"
    end

    def self.overdue
        all.where("due_date < ? AND is_done = false", Date.today)
    end
    def self.due_today
        all.where("due_date = ? AND is_done = false", Date.today)
    end
    def self.due_later
        all.where("due_date > ? AND is_done = false", Date.today)
    end
    def self.task_done
        all.where("is_done = true")
    end
    def self.user(user_id)
        all.where("user_id = ?", user_id)
    end
end