require 'rails_helper'

RSpec.describe Micropost, type: :model do

  let(:user) { create(:user) }
  let(:micropost) { user.microposts.build(content: "Lorem ipsum", user_id: user.id) }

  describe "Micropost" do
    it "should be valid" do
      expect(micropost).to be_valid
    end

    it "should not be valid" do
      micropost.update_attributes(content: "  ", picture: nil, user_id: user.id)
      expect(micropost).to be_valid
      micropost.update_attributes(content: " ", picture: nil, user_id: user.id)
      expect(micropost).to be_invalid
    end

    it "should be most recent first" do
      create(:microposts, :micropost_1, created_at: 10.minutes.ago)
      create(:microposts, :micropost_2, created_at: 30.minutes.ago)
      create(:microposts, :micropost_3, created_at: 2.hours.ago)
      create(:microposts, :micropost_4, created_at: Time.zone.now)
      expect(Micropost.first).to eq micropost_4
    end
  end

  describe "user_id" do
    it "should not be present" do
      micropost.user_id = nil
      expect(micropost).to be_invalid
    end
  end

  describe "content" do
    it "should not be at most 200 characters" do
      micropost.content = "a" * 200
      expect(micropost).to be_valid
      micropost.content = "a" * 201
      expect(micropost).to be_invalid
    end
  end
end
