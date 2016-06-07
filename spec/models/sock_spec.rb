require 'rails_helper'

RSpec.describe Sock, type: :model do
  context "validations, presence" do
    it { should validate_presence_of(:name) }


  end
  context "validations, uniqueness" do
    it { should validate_uniqueness_of(:name) }
  end
end
