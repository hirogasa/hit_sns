namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do

		users = User.all(limit: 6)
		10.times do
			name = Faker::Lorem.sentence(5)
			users.each { |user| user.courses.create!(course: course)}
		end
	end
end
