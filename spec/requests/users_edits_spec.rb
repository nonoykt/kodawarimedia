require 'rails_helper'

RSpec.describe "UsersEdits", type: :request do

  let(:user) { create(:user) }
  let(:other_user) { FactoryBot.create(:other_user) }

  def patch_invalid_information
    patch user_path(user), params: {
      user: {
        name: "",
        email: "foo@invalid",
        password: "foo",
        password_confirmation: "bar"
      }
    }
  end

  describe "GET /users/:id/edit" do
    context "invalid" do
      it "is invalid because of having not log in" do
        get edit_user_path(user)
        expect(request.fullpath).to eq '/login'
      end

      it "is invalid because of having log in as wrong user" do
        log_in_as(other_user)
        get edit_user_path(user)
        expect(request.fullpath).to eq '/'
      end

      it "is invalid edit information" do
        log_in_as(user)
        expect(is_logged_in?).to be_truthy
        get edit_user_path(user)
        expect(request.fullpath).to eq '/uses/1/edit'
        patch_invalid_information
        expect(flash[:danger]).to be_truthy
        expect(request.fullpath).to eq '/users/1/edit'
      end

      it "does not redirect update because of having log in as wrong user" do
        log_in_as(other_user)
        get edit_user_path(user)
        patch_valid_information
        expect(response).to redirect_to '/'
        expect(request.fullpath).to eq '/'
      end
    end

    context "valid" do
      it "is valid edit information" do
        log_in_as(user)
        expect(is_logged_in?).to be_truthy
        get edit_user_path(user)
        expect(request.fullpath).to eq '/uses/1/edit'
        patch_valid_information
        expect(flash[:success]).to be_truthy
        expect(response).to redirect_to '/users/1'
        expect(request.fullpath).to eq '/users/1'
      end

      it "goes to previous link because they had logged in as right user" do
        get edit_user_path(user)
        expect(request.fullpath).to eq '/login'
        log_in_as(user)
        expect(request.fullpath).to eq '/users/1/edit'
      end
    end
  end
end
