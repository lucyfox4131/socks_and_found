require "rails_helper"

RSpec.describe Category, type: :model do
  context "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
  end
end
