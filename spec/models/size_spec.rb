require 'rails_helper'

RSpec.describe Size, type: :model do
  context "validations" do
    it { should validate_presence_of(:value) }
    it { should validate_uniqueness_of(:value) }
  end

  context "size not valid without validations" do
    size = Size.new(value: "")
    it "is not valid" do
      expect(size).to_not be_valid
    end
  end

  context "size not valid if not unique" do
    size = Size.create(value: "test")
    size2 = Size.new(value: size.value)
    it "is not valid" do
      expect(size2).to_not be_valid
    end
  end
end
