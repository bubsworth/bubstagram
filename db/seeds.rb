# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Post.delete_all

puts "\n== Creating users =="

user_1 = User.create!(
  username: "steve_man",
  email: "steve@example.com",
  password: "secret123",
)

puts "\n== Creating posts =="

post_1 = Post.create!(
  caption: "Missing the beach!",
  user_id: user_1
)

post_2 = Post.create!(
  caption: "Grabbing a coffee with the gang",
  user_id: user_1
)

puts "\n== Handling active images =="

def path_for_image(filename)
  "app/assets/images/#{filename}"
end

# ActiveStorage attachments
post_1.image.attach(io: File.open(path_for_image("beach.png")), filename: "beach.png")
post_1.save!
post_2.image.attach(io: File.open(path_for_image("coffee.png")), filename: "coffee.png")
post_2.save!

