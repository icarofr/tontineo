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

FIRST_NAMES = ["Carlos", "Daniel", "Eduardo", "Fernando", "Gustavo", "Heitor", "Isabela", "João", "Lucas", "Miguel",
               "Pedro", "Rafael", "Sidney", "Thiago", "Vitor", "William", "Joana", "Maria", "Ana", "Beatriz", "Bianca"]
LAST_NAMES = ["Hart", "Starr", "Cash", "Baker", "Garcia", "Nguyen", "Lee", "Adams", "Gonzalez", "Perez", "Williams",
              "Lewis", "Walker", "Hall", "Young", "King", "Scott", "Green", "Adams", "Baker", "Gonzalez", "Nguyen"]
TONTINE_STATUS = ["pending", "active", "done"]
MEMBER_STATUS = ["pending", "accepted", "declined"]
COMPANY_NAMES = ["Wright & Co. Law Offices", "Art Vandelay Import/Export Industries", "Hamlin Hamlin McGill"]

user_counter = 1
start_month = Date.today - rand(1..365)
payment_day = start_month + 30

(1..10).each do |i|
  start_month = Date.today - rand(1..365)
  payment_day = start_month + 30
  user = User.create(
    email: "email#{i}@tontineo.com",
    password: "password#{i}",
    company: COMPANY_NAMES.sample,
    first_name: FIRST_NAMES.sample,
    last_name: LAST_NAMES.sample
  )

  tontine = Tontine.create(
    name: "Tontine #{i}",
    user:,
    contribution: rand(1..5) * 100,
    start_month:,
    payment_day:,
    participants: 5,
    status: i == 1 ? "done" : TONTINE_STATUS.sample
  )

  Member.create(
    tontine:,
    user:,
    position: 1,
    status: "accepted"
  )

  user_counter = i + 1
end

Tontine.all.each_with_index do |tontine, tontine_index|
  (2..tontine.participants).each do |i|
    user = User.create!(
      email: "email#{user_counter}@tontineo.com",
      password: "password#{user_counter}",
      company: COMPANY_NAMES.sample,
      first_name: FIRST_NAMES.sample,
      last_name: LAST_NAMES.sample
    )

    Member.create(
      tontine:,
      user:,
      status: tontine_index.zero? ? "accepted" : MEMBER_STATUS.sample,
      position: i
    )

    user_counter += 1
  end
end