
describe User do
	before { @user = User.new(name:"taro",email:"example@hoge.com",password: "foobar",password_confirmation:"foobar") }
	it "is valid with a name and email" do
		expect(@user).to be_valid
	end
	it "is invalid without a name" do
		@user.name = nil
		expect(@user).to be_invalid
	end
	it "is invalid without a email" do
		@user.email = nil
		expect(@user).to be_invalid
	end
	it "is invalid with a duplicate name" do
		@user.save!
		user2 = User.new(name:"taro",email:"ecample@hoge.com")
		expect(user2).to have(1).errors_on(:name)
	end
	it "is invalid when name is too long" do
		@user.name = "a"*51
		expect(@user).to have(1).errors_on(:name)
	end
	it "is invalid when name is too short" do
		@user.name = "a"
		expect(@user).to have(1).errors_on(:name)
	end
	it "is invalid when email format is invalid"do
		adresses = %w[user@foo,com user_at_foo.org example.user@foo]
		adresses.each do |invalid_adress|
			@user.email = invalid_adress
			expect(@user).not_to be_valid
		end
	end
	it "is invalid when password_digest is not contained" do
 		expect(@user).to respond_to(:password_digest)
	end
	describe "when password is not present " do 
		before do
			@user = User.new(name:"Example User" , email: "user@ecample.com",password:"",password_confirmation:"")
		end
	it { should_not be_valid }
	end
end

