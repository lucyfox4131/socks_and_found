require 'rails_helper'

RSpec.describe Sock, type: :model do
  context "validations, presence" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:foot)}
    it { should validate_presence_of(:price)}
    it { should validate_presence_of(:style_id)}
    it { should validate_presence_of(:category_id)}
    it { should validate_presence_of(:size_id)}

  end

  context "validations, uniqueness" do
    it { should validate_uniqueness_of(:name) }
  end
end
