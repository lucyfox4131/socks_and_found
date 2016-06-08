require "rails_helper"

RSpec.describe Size, type: :model do
  context "validations" do
    it { should validate_presence_of(:value) }
    it { should validate_uniqueness_of(:value) }
  end
end
