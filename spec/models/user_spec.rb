require 'rails_helper'
RSpec.describe User, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:password) }
  end

  context "user not valid without validations" do
    user = User.new(name: "", username: "test", password: "test")
    it "is not valid" do
      expect(user).to_not be_valid
    end
  end

  context "user not valid if username not unique" do
    user = User.create(name: "test", username: "test", password: "test")
    user2 = User.new(name: "test2", username: "test", password: "test")
    it "is not valid" do
      expect(user2).to_not be_valid
    end
  end
end
