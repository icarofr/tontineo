# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Member.destroy_all
Tontine.destroy_all
User.destroy_all
SwapRequest.destroy_all

FIRST_NAMES = ["Carlos", "Daniel", "Eduardo", "Fernando", "Gustavo", "Heitor", "Isabela", "João", "Lucas", "Miguel", "Pedro", "Rafael", "Sidney", "Thiago", "Vitor", "William", "Joana", "Maria", "Ana", "Beatriz", "Bianca"]
LAST_NAMES = ["Hart", "Starr", "Cash", "Baker", "Garcia", "Nguyen", "Lee", "Adams", "Gonzalez", "Perez", "Williams", "Lewis", "Walker", "Hall", "Young", "King", "Scott", "Green", "Adams", "Baker", "Gonzalez", "Nguyen"]
STATUS = ["pending", "active", "done"]
COMPANY_NAMES = ["Wright & Co. Law Offices", "Art Vandelay Import/Export Industries", "Hamlin Hamlin McGill"]

user_counter = 0
member_index = 1
start_month = Date.today-rand(1..365)
payment_day = start_month+30


(1..50).each do |i|
    User.create(
        email: "email#{i}@tontineo.com",
        password: "password#{i}",
        first_name: FIRST_NAMES.sample,
        last_name: LAST_NAMES.sample,
        company: COMPANY_NAMES.sample)
end

(1..10).each do |i|
    start_month = Date.today-rand(1..365)
    payment_day = start_month+30

    Tontine.create(
        name: "Tontine #{i}",
        contribution: rand(1..5)*100,
        start_month: start_month,
        payment_day: payment_day,
        participants: rand(2..10),
        user: User.all.sample,
        status: STATUS.sample)
end