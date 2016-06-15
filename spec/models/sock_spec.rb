require 'rails_helper'

RSpec.describe Sock, type: :model do
  context "validations, presence" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:foot) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:style_id) }
    it { should validate_presence_of(:category_id) }
    it { should validate_presence_of(:size_id) }
  end

  context "validations, uniqueness" do
    it { should validate_uniqueness_of(:name) }
  end

  scenario "status returns available when not retired" do
    sock = create(:sock)
    expect(sock.status).to eq("#{sock.name} is currently available for purchase")
  end

  scenario "status returns retired when retired" do
    sock = Sock.new(name: "test", style_id: 1, foot: "left", category_id: 1, size_id: 1, price: 5.00, retired: true)
    expect(sock.status).to eq("#{sock.name.capitalize} is retired")
  end
end
