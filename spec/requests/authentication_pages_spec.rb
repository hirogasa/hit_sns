#coding:utf-8
require 'spec_helper'

describe "AuthenticationPages" do

	describe "signin page" do
		before { visit signin_path }
		
		it "should have content('Sign in') " do
			expect(page).to have_content('Sign in')
		end
		
		it "should have title('Sign in') " do
			expect(page).to have_title('Sign in')
		end

		context "with invalid information" do
			before { click_button "Sign in" }
			
			it "should have title 'Sign in'" do
				expect(page).to have_title('Sign in')
			end
			it "should have selector (alert)" do
				expect(page).to have_selector('div.alert.alert-error',text:'誤りがあります') 
			end
			context "after visiting another page" do
				before { click_link "Home" }
				it " should NOT have selector(alert) "do
					expect(page).not_to have_selector('div.alert.alert-error')
				end
			end
		end

		context "with valid information" do
			let(:user){ FactoryGirl.create(:user) }
			before do
				fill_in "Email",		with: user.email.downcase
				fill_in "Password", with: user.password
				click_button "Sign in"
			end
			
			it "should have title user.name" do
				expect(page).to have_title(user.name) 
			end
			it "should have link to Profile" do
				expect(page).to have_link('Profile', href: user_path(user)) 
			end
			it "should have link to Signout" do
				expect(page).to have_link('Sign out', href: signout_path) 
			end
			it "should not have link to Sign in" do
				expect(page).not_to have_link('Sign in', href: signin_path) 
			end
			context "followed by signout" do
				before { click_link "Sign out" }
				it "should have_link('Sign in')"do
					expect(page).to have_link('Sign in', href:signin_path)
				end
			end
		end
		context "with valid information" do
			let(:user) { FactoryGril.create(:user) }
			before { sign_in user}

			it "should have title (user.name)" do
				expect(page).to have_title(user.name) 
			end
			it "should have link to Profile" do
				expect(page).to have_link('Profile', href:user_path(user)) 
			end
			it "should have link to Settings" do
				expect(page).to have_link('Settings', href: edit_user_path(user)) 
			end
			it "should have link to Signout" do
				expect(page).to have_link('Sign out', href: signout_path) 
			end
			it "should have link to Signin" do
				expect(page).to have_link('Sign in', href: signin_path) 
			end
		end
  end
end









