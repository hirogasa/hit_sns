require 'spec_helper'

describe "UserPages" do
	describe "edit" do
		let(:user){FactoryGirl.create(:user)}
		before { visit edit_user_path(user) }

		context "page" do
			it "should have content(Update your profile)" do
				expect(page).to have_content("Update your profile")
			end
			it "should have title(Edit user)" do
				expect(page).to have_title("Edit user")
			end
			it "should have link(change)" do
				expect(page).to have_link('change',href:'http://gravatar.com/emails')
			end

			context "with invalid information" do
				before { click_button "Save changes"}
				it "should have content(error)" do
					expect(page).to have_content('error')
				end
			end
		end
	end
end
