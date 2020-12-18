# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Create a main sample user.
User.create!(fullname: "Tham",
	email: "nttham98@gmail.com",
	admin: true,
	password: "123456",
	password_confirmation: "123456")


# Generate a bunch of additional users.
10.times do |n|
	name = Faker::Name.name
	email = "example-#{n+1}@railstutorial.org"
	password = "password"
	User.create!(fullname: name,
		email: email,
		password: password,
		password_confirmation: password)
end

# Generate a bunch of additional categories.
10.times do |n|
	name = Faker::Name.name
	Category.create!(name: name)
end

30.times do |n|
	name = Faker::Name.name
	SubCategory.create!(name: name,
		category_id: 1
		)
end

30.times do |n|
	name = Faker::Name.name
	sub_category_id = n+1
	Subject.create!(name: name,
		time: 10,
		description: "The SAT (/ˌɛsˌeɪˈtiː/ ess-ay-TEE) is a standardized 
					test widely used for college admissions in the United 
					States. Since it was debuted by the College Board in 
					1926, its name and scoring have changed several times; 
					originally called the Scholastic Aptitude Test, it was 
					later called the Scholastic Assessment Test, then the 
					SAT I: Reasoning Test, then the SAT Reasoning Test, then 
					simply the SAT.",
		auto_check: true,
		public: 0,
		sub_category_id: sub_category_id,
		user_id: 1
		)
end

10.times do |n|
	content = "cau hoi mau-#{n+1}"
	Question.create!(
		content: content,
		subject_id: 1
		)
end

10.times do |n|
	question_id = n+1
	content = "cau tra loi mau-#{n+1}"
	Answer.create!(
		content: content,
		question_id: question_id,
		true: true
		)
end

10.times do |n|
	question_id = n+1
	content = "cau tra loi mau-#{n+1}"
	Answer.create!(
		content: content,
		question_id: question_id
		)
end
