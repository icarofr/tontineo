# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Member.destroy_all
Message.destroy_all
Tontine.destroy_all
User.destroy_all
SwapRequest.destroy_all

users = []

gorgui = User.create!(first_name: "Gorgui", last_name: "faye", company: "Le Wagon", email: "gorgui@lewagon.com", password: "gorgui123")
file =URI.open("https://kitt.lewagon.com/placeholder/users/gorg27")
gorgui.photo.attach(io: file, filename: "user.png", content_type: "image/png")
puts "create user 1"
users << gorgui


samy = User.create!(first_name: "samy", last_name: "Mokrane", company: "Le Wagon", email: "samy@lewagon.com", password: "samy123")
file = URI.open("https://kitt.lewagon.com/placeholder/users/SamyMo")
user.photo.attach(io: file, filename: "user.png", content_type: "image/png")
puts "create user 2"
users << samy

jean = User.create!(first_name: "jean-rodriguez", last_name: "kinouani", company: "Le Wagon", email: "jrkinouani@lewagon.com", password: "kinouani")
file =URI.open("https://kitt.lewagon.com/placeholder/users/jrkinouani")
jean.photo.attach(io: file, filename: "user.png", content_type: "image/png")
puts "create user 3"
users << jean

sebastien = User.create!(first_name: "sebastien", last_name: "saunier", company: "Le Wagon", email: "sebastien@lewagon.com", password: "messi123")
file =URI.open("https://kitt.lewagon.com/placeholder/users/ssaunier")
lionel.photo.attach(io: file, filename: "user.png", content_type: "image/png")
puts "create user 4"
users << sebastien


thomas = User.create!(first_name: "thomas", last_name: "desmoulins", company: "Le Wagon", email: "thomas@lewagon.com", password: "maradona")
file = URI.open("https://kitt.lewagon.com/placeholder/users/tdesmoul")
diego.photo.attach(io: file, filename: "user.png", content_type: "image/png")
puts "create user 5"
users << thomas

start_month = Date.today.beginning_of_month - 3.month
payment_day = start_month + 30

tontine = Tontine.create!(name: "Voyage", contribution: 300, start_month: start_month, payment_day: payment_day, participants: 5, status: "active", user: jean)
users.each do |user|
  Member.create(tontine: tontine, user: user, position: tontine.members.count + 1, status: 'confirmed')
end

puts "tontines"

# FIRST_NAMES = ["Carlos", "Daniel", "Eduardo", "Fernando", "Gustavo", "Heitor", "Isabela", "João", "Lucas", "Miguel",
#                "Pedro", "Rafael", "Sidney", "Thiago", "Vitor", "William", "Joana", "Maria", "Ana", "Beatriz", "Bianca",
#                "Camila", "Carolina", "Catarina", "Clara", "Eduarda", "Gabriela", "Isabel", "Isadora", "Júlia", "Lara"]
# LAST_NAMES = ["Hart", "Starr", "Cash", "Baker", "Garcia", "Nguyen", "Lee", "Adams", "Gonzalez", "Perez", "Williams",
#               "Lewis", "Walker", "Hall", "Young", "King", "Scott", "Green", "Adams", "Baker", "Gonzalez", "Nguyen",
#               "Perez", "Williams", "Lewis", "Walker", "Hall", "Young", "King", "Scott", "Green", "Adams", "Baker"]
# TONTINE_STATUS = ["pending", "active", "done"]
# MEMBER_STATUS = ["pending", "accepted", "declined"]
# COMPANY_NAMES = ["Wright & Co. Law Offices", "Art Vandelay Import/Export Industries", "Hamlin Hamlin McGill"]

# user_counter = 1

# (1..10).each do |i|
#   start_month = Date.today - rand(1..365)
#   payment_day = start_month + 30
#   user = User.create(
#     email: "email#{i}@tontineo.com",
#     password: "password#{i}",
#     company: COMPANY_NAMES.sample,
#     first_name: FIRST_NAMES.sample,
#     last_name: LAST_NAMES.sample
#   )

#   tontine = Tontine.create(
#     name: "Tontine #{i}",
#     user:,
#     contribution: rand(1..5) * 100,
#     start_month:,
#     payment_day:,
#     participants: 5,
#     status: i == 1 ? "done" : TONTINE_STATUS.sample
#   )

#   Member.create(
#     tontine:,
#     user:,
#     position: 1,
#     status: "accepted"
#   )

#   user_counter = i + 1
# end

# Tontine.all.each_with_index do |tontine, tontine_index|
#   (2..tontine.participants).each do |i|
#     user = User.create!(
#       email: "email#{user_counter}@tontineo.com",
#       password: "password#{user_counter}",
#       company: COMPANY_NAMES.sample,
#       first_name: FIRST_NAMES.sample,
#       last_name: LAST_NAMES.sample
#     )

#     Member.create(
#       tontine:,
#       user:,
#       status: tontine_index.zero? ? "accepted" : MEMBER_STATUS.sample,
#       position: i
#     )

#     user_counter += 1
#   end
# end
