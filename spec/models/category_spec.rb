require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
  end

  context "category not valid without validations" do
    category = Category.new(title: "")
    it "is not valid" do
      expect(category).to_not be_valid
    end
  end

  context "category not valid if not unique" do
    category = Category.create(title: "test")
    category2 = Style.new(name: category.title)
    it "is not valid" do
      expect(category2).to_not be_valid
    end
  end
end
