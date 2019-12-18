# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.all.destroy_all
Post.create(title: "初めての投稿", content: "初めてでドキドキ", user_id:1 )
Post.create(title: "sass", content: "使いこなせばとても便利", user_id: 1)
Post.create(title: "vim", content: "使いこなすと玄人感が出る", user_id: 1)