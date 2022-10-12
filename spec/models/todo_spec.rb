require 'rails_helper'

RSpec.describe Todo, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'validation tests' do
    it 'ensure user_id presence' do
      todo = Todo.new(task: "test the code", due_date: "2022-10-12", is_done: false).save
      expect(todo).to eq(false)
    end
    it 'ensure task presence' do
      todo = Todo.new(user_id: 16, due_date: "2022-10-12", is_done: false).save
      expect(todo).to eq(false)
    end 
    it 'ensure due date presence' do
      todo = Todo.new(user_id: 16, task: "test the code", is_done: false).save
      expect(todo).to eq(false)
    end
    it 'todo should save successfully' do
      todo = Todo.new(user_id: 16, task: "test the code", due_date: "2022-10-12", is_done: 0).save
      expect(todo).to eq(true)
    end
    context 'scope tests' do
      let (:params) { {user_id:16, task: "test the code"} }
      before(:each) do
        # comes under done tasks count: 1
        Todo.new(params.merge(due_date: "2022-06-02", is_done: true)).save
        # comes under overdue tasks count: 1
        Todo.new(params.merge(due_date: "2022-07-11", is_done: false)).save
        # comes under overdue tasks count: 2
        Todo.new(params.merge(due_date: "2022-08-12", is_done: false)).save
        # comes under done tasks count: 2
        Todo.new(params.merge(due_date: "2022-10-12", is_done: true)).save
        # comes under due today tasks count: 1
        Todo.new(params.merge(due_date: "2022-10-12", is_done: false)).save
        # comes under due later tasks count: 1
        Todo.new(params.merge(due_date: "2022-12-15", is_done: false)).save
        # already in table over_due: 1, due_today: 1, due_later: 1, is_done: 1
      end
      it 'shoud return overdue tasks' do
        expect(Todo.overdue.size).to eq(3)
      end
      it 'shoud return due today tasks' do
        expect(Todo.due_today.size).to eq(2)
      end
      it 'shoud return due later tasks' do
        expect(Todo.due_later.size).to eq(2)
      end
      it 'shoud return done tasks' do
        expect(Todo.task_done.size).to eq(3)
      end
    end
  end
end
