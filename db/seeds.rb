# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Like.delete_all
Collect.delete_all
Comment.delete_all
Post.delete_all
User.delete_all

puts "\n== Creating users =="

user_1 = User.create!(
  username: "steve_man",
  email: "steve@example.com",
  password: "secret123",
  password_confirmation: "secret123",
  bio: "My names steve, thats about it",
  pronouns: "he/him",
  name: "Steve Jobs"
)

user_2 = User.create!(
  username: "bobbybobs",
  email: "bob@example.com",
  password: "secret123",
  password_confirmation: "secret123",
  bio: "Here to post pictures of my travels!",
  pronouns: "they/she",
  name: "Roberta Smith"
)

user_3 = User.create!(
  username: "maximilian93",
  email: "max@example.com",
  password: "secret123",
  password_confirmation: "secret123",
  bio: "28 year old art and graphic desginer",
  pronouns: "he/him",
  name: "Max Miller"
)

puts "\n== Creating posts =="

post_1 = Post.create!(
  caption: "Missing the beach!",
  user: user_1
)

post_2 = Post.create!(
  caption: "Finally got my computer set up ready",
  user: user_3
)

post_3 = Post.create!(
  caption: "Berlin",
  user: user_2
)

post_4 = Post.create!(
  caption: "Paris",
  user: user_2
)

post_5 = Post.create!(
  caption: "My cat is the best",
  user: user_1
)

post_6 = Post.create!(
  caption: "Starting some new designs today",
  user: user_3
)

post_7 = Post.create!(
  caption: "Milan",
  user: user_2
)

puts "\n== Handling active images =="

def path_for_image(filename)
  "app/assets/images/#{filename}"
end

# ActiveStorage attachments
post_1.image.attach(io: File.open(path_for_image("posts/beach.png")), filename: "beach.png")
post_1.save!
post_2.image.attach(io: File.open(path_for_image("posts/computer.png")), filename: "computer.png")
post_2.save!
post_3.image.attach(io: File.open(path_for_image("posts/berlin.png")), filename: "avocado.png")
post_3.save!
post_4.image.attach(io: File.open(path_for_image("posts/paris.png")), filename: "avocado.png")
post_4.save!
post_5.image.attach(io: File.open(path_for_image("posts/cat.png")), filename: "cat.png")
post_5.save!
post_6.image.attach(io: File.open(path_for_image("posts/drawing.png")), filename: "drawing.png")
post_6.save!
post_7.image.attach(io: File.open(path_for_image("posts/milan.png")), filename: "milan.png")
post_7.save!

user_1.image.attach(io: File.open(path_for_image("users/steve-jobs.webp")), filename: "steve-jobs.webp")
user_1.save!
user_2.image.attach(io: File.open(path_for_image("users/bobby.webp")), filename: "bobby.webp")
user_2.save!
user_3.image.attach(io: File.open(path_for_image("users/max.webp")), filename: "max.webp")
user_3.save!

puts "\n== Creating comments =="

comment_1 = Comment.create!(
  comment: "Looks amazing!",
  post: post_4,
  user: user_1
)

comment_2 = Comment.create!(
  comment: "Thank you!",
  post: post_4,
  user: user_2
)

comment_3 = Comment.create!(
  comment: "So cute",
  post: post_5,
  user: user_3
)

comment_4 = Comment.create!(
  comment: "Can't wait to see the finished thing!",
  post: post_6,
  user: user_2
)

comment_4 = Comment.create!(
  comment: "Such a beautiful city",
  post: post_7,
  user: user_1
)

puts "\n== Creating likes =="

like_1 = Like.create!(
  post: post_6,
  user: user_1
)

like_2 = Like.create!(
  post: post_5,
  user: user_3
)

like_3 = Like.create!(
  post: post_5,
  user: user_2
)

like_4 = Like.create!(
  post: post_3,
  user: user_2
)

like_5 = Like.create!(
  post: post_7,
  user: user_1
)

like_6 = Like.create!(
  post: post_7,
  user: user_3
)

puts "\n== Creating collects =="

collect_1 = Collect.create!(
  saved: true,
  post: post_6,
  user: user_1
)

collect_2 = Collect.create!(
  saved: true,
  post: post_5,
  user: user_3
)

collect_3 = Collect.create!(
  saved: true,
  post: post_5,
  user: user_2
)

collect_4 = Collect.create!(
  saved: true,
  post: post_3,
  user: user_2
)

collect_5 = Collect.create!(
  saved: true,
  post: post_7,
  user: user_1
)