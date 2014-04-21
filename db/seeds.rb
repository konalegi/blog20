# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.delete_all
User.delete_all
Comment.delete_all

danil = User.create name: 'Danil', surname: 'Nurgaliev', password: '123123', password_confirmation: '123123', email: 'danil@e.com'
danil.add_role :user

albina = User.create name: 'Albina', surname: 'Minullina', password: '123123', password_confirmation: '123123', email: 'albina@e.com'
albina.add_role :user

root = User.create name: 'root', surname: 'root', password: '123123', password_confirmation: '123123', email: 'root@e.com'
root.add_role :admin

10.times do
  post = Post.create full_text: Faker::Lorem.paragraphs(10).join,
    preview: Faker::Lorem.paragraphs.join,title: Faker::Lorem.sentence, user_id: danil.id

  5.times do
    Comment.create user_id: albina.id, post_id: post.id, text: Faker::Lorem.paragraphs.join
  end
end