# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.all.destroy_all
User.create(name: "松村", email: "hoge@hoge", nickname:"マツ",password:"gorugon",user_image:"default_user.jpg" )
User.create(name: "三瓶", email: "gorugon@com", nickname: "エラ",password:"gorugon",user_image:"gorira.jpg")
User.create(name: "菅井", email: "sugai@kurikuri", nickname: "シチサン",password:"gorugon",user_image:"karafuru.jpg")
User.create(name: "チャン", email: "tyan@hudousan", nickname: "ハイテク",password:"gorugon",user_image:"tyatora.jpg")
User.create(name: "リュウジ", email: "ryuzi@ryuuzi", nickname: "営業",password:"gorugon",user_image:"yagi.jpg")
User.create(name: "主人", email: "a@a", nickname: "master",password:"gorugon",user_image:"tyatora.jpg ")