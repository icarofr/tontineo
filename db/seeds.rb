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

gorgui = User.create!(first_name: "Gorgui", last_name: "FAYE", company: "Le Wagon", email: "gorgui@lewagon.com", password: "gorgui123")
file =URI.open("https://kitt.lewagon.com/placeholder/users/gorg27")
gorgui.photo.attach(io: file, filename: "user.png", content_type: "image/png")
puts "create user 1"
users << gorgui


samy = User.create!(first_name: "Samy", last_name: "MOKRANE", company: "Le Wagon", email: "samy@lewagon.com", password: "samy123")
file = URI.open("https://kitt.lewagon.com/placeholder/users/SamyMo")
samy.photo.attach(io: file, filename: "user.png", content_type: "image/png")
puts "create user 2"
users << samy

jean = User.create!(first_name: "Jean-rodriguez", last_name: "kINOUANI", company: "Le Wagon", email: "jrkinouani@lewagon.com", password: "kinouani")
file =URI.open("https://kitt.lewagon.com/placeholder/users/jrkinouani")
jean.photo.attach(io: file, filename: "user.png", content_type: "image/png")
puts "create user 3"
users << jean

sebastien = User.create!(first_name: "Sebastien", last_name: "SAUNIER", company: "Le Wagon", email: "sebastien@lewagon.com", password: "sebastien123")
file =URI.open("https://kitt.lewagon.com/placeholder/users/ssaunier")
sebastien.photo.attach(io: file, filename: "user.png", content_type: "image/png")
puts "create user 4"
users << sebastien


thomas = User.create!(first_name: "Thomas", last_name: "Desmoulins", company: "Le Wagon", email: "thomas@lewagon.com", password: "thomas123")
file = URI.open("https://kitt.lewagon.com/placeholder/users/tdesmoul")
thomas.photo.attach(io: file, filename: "user.png", content_type: "image/png")
puts "create user 5"
users << thomas

jesica = User.create!(first_name: "jesica", last_name: "kincaid", company: "Le Wagon", email: "jesica@lewagon.com", password: "jesica123")
file = URI.open("https://kitt.lewagon.com/placeholder/users/jjkincaid")
jesica.photo.attach(io: file, filename: "user.png", content_type: "image/png")
puts "create user 6"

marion = User.create!(first_name: "marion", last_name: "Robert", company: "Le Wagon", email: "marion@lewagon.com", password: "marion123")
file = URI.open("https://kitt.lewagon.com/placeholder/users/marionrobert")
marion.photo.attach(io: file, filename: "user.png", content_type: "image/png")
puts "create user 7"

clemence = User.create!(first_name: "clemence", last_name: "Clemence", company: "Le Wagon", email: "clemence@lewagon.com", password: "clemence123")
file = URI.open("https://kitt.lewagon.com/placeholder/users/clemencp01")
clemence.photo.attach(io: file, filename: "user.png", content_type: "image/png")
puts "create user 8"


start_month = Date.today.beginning_of_month - 3.month
payment_day = start_month + 30

tontine = Tontine.create!(name: "Voiture", contribution: 300, start_month: start_month, payment_day: 25, participants: 5, status: "active", user: jean)
users.each do |user|
  Member.create(tontine: tontine, user: user, position: tontine.members.count + 1, status: 'confirmed')
end

puts "tontines"

Message.create(tontine: tontine, user: jean, body: "Salut les gars!!")
Message.create(tontine: tontine, user: thomas, body: "Salut ")
Message.create(tontine: tontine, user: jean, body: "J'ai une petite demande à vous faire")
Message.create(tontine: tontine, user: samy, body: "On t'écoute... ")
Message.create(tontine: tontine, user: jean, body: "J'ai des dépenses imprévus et j'aimerais changer l'ordre avec toi
  Gorgui si ça ne te dérange pas ce mois ci ? ")
Message.create(tontine: tontine, user: gorgui, body: "Salut, tu dis 'Allez Paris !!!' et c'est ok ")
Message.create(tontine: tontine, user: jean, body: "En bon supporter de l'OM, IMPOSSIBLE !!! ")
Message.create(tontine: tontine, user: sebastien, body: "Donc tu dis juste 'Verratti top 5 meilleur milieu de terrain d'Europe... ")
Message.create(tontine: tontine, user: jean, body: "Jamais de la vie je préfère m'endetter")
Message.create(tontine: tontine, user: gorgui, body: "On y arriverra pas les gars, j'accepte le changement,
   c'est bien parce que je t'aime bien lol ")
Message.create(tontine: tontine, user: jean, body: "Cool merci ")
Message.create(tontine: tontine, user: sebastien, body: "Vous avez vu PSG-Juve ")
Message.create(tontine: tontine, user: samy, body: "Ne m'en parles pas, j'ai eu le bug avec mycanal")



# Message.create(tontine: tontine, user: jean, body: "Salut les gars!!")
# Message.create(tontine: tontine, user: sebastien, body: "Salut ")
# Message.create(tontine: tontine, user: samy, body: "Salut ")
# Message.create(tontine: tontine, user: jean, body: "Désolé de demander mais est ce que je pourrais changer l'ordre avec
#    toi Thomas le mois prochain ? j'ai un imprévu ")
# Message.create(tontine: tontine, user: thomas, body: "Ok pas de problème je peux attendre le mois d'après ")
# Message.create(tontine: tontine, user: sebastien, body: "Merci bien ")




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
