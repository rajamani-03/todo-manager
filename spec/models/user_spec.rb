require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'validation tests' do
    it 'ensure name presence' do
      user = User.new(email: "raja@gmail.com", password: "raja@123").save
      expect(user).to eq(false)
    end
    it 'ensure email presence' do
      user = User.new(name: "Raja", password: "raja@123").save
      expect(user).to eq(false)
    end 
    it 'ensure password presence' do
      user = User.new(name: "Raja", email: "raja@gmail.com").save
      expect(user).to eq(false)
    end
    it 'user should save successfully' do
      user = User.new(name: "Raja", email: "raja@gmail.com", password: "raja@123").save
      expect(user).to eq(true)
    end

  end
  context 'scope tests' do
  end
end
