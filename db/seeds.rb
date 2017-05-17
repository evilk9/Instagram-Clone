# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.new(
	:email => "admin@admin.com",
	:password => "adminadmin",
	:password_confirmation => "adminadmin",
	:name => "Test Account",
	:description => "This is the Test Account for Instaclone, A site I created in the hopes of learning Ruby on Rails",
	:image => File.open("public/images/2.jpg"))

user.save!

emailPrefix = "@email.com"

count = 10

names = ["Aamir",
"Aaron",
"Abbey",
"Abbie",
"Abbot",
"Abbott",
"Abby",
"Abdel",
"Abdul",
"Abdulkarim",
"Abdullah",
"Abe",
"Abel",
"Abelard",
"Abner",
"Abraham",
"Abram",
"Ace",
"Adair",
"Adam",
"Adams",
"Addie",
"Adger",
"Aditya",
"Adlai",
"Adnan",
"Adolf",
"Adolfo",
"Adolph",
"Barnett",
"Barney",
"Barnie",
"Barny",
"Baron",
"Barr",
"Barret",
"Barrett",
"Barri",
"Barrie",
"Barris",
"Barron",
"Barry",
"Bart",
"Bartel"]

imageCount = 14
pictureToHave = 10

description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis condiemntum leo et enim laesuada vulputate. Fusce in tincidnt nisl."
for i in 0..count
	user = User.new(
		:email => rand(count*count*count).to_s + emailPrefix,
		:password => "testerAccount",
		:password_confirmation => "testerAccount",
		:name => names.sample + names.sample,
		:description => description,
		:image => File.open("public/images/" + rand(imageCount).to_s + ".jpg")
		)

	user.save!

	for i in 0..rand(pictureToHave)
		picture = Picture.new(
			:description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis condiemntum leo et enim laesuada vulputate.",
			:image => File.open("public/images/" + rand(imageCount).to_s + ".jpg"),
			:user_id => user.id)
		picture.created_at = (rand*15).days.ago
		picture.save!
	end		
end


allUsers = User.all

for i in 0..10
	userA = allUsers.sample
	userB = allUsers.sample

	userA.follow(userB)

end