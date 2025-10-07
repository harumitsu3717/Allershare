# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seedの実行を開始" 

kitsunesuky = User.find_or_create_by!(email: "kitsune@example.com") do |user|
  user.name = "きつねすきー"
  user.password = "password"
end

hiyokokanteishi = User.find_or_create_by!(email: "hiyoko@example.com") do |user|
  user.name = "ひよこ鑑定士"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/piyo.jpg"), filename:"piyo.jpg")
end

mikesan = User.find_or_create_by!(email: "mike@example.com") do |user|
  user.name = "三毛さん"
  user.password = "password"
  user.profile = "3歳の三毛猫と暮らしてます。卵NG"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/mikeneko.jpg"), filename:"mikeneko.jpg")
end

administrator = Admin.find_or_create_by!(email: "admin@example.com") do |admin|
  admin.password = "password"
  admin.password_confirmation = "password"
end

puts "seedの実行が完了しました"