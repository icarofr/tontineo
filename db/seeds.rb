# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

FIRST_NAMES = ["Carlos", "Daniel", "Eduardo", "Fernando", "Gustavo", "Heitor", "Isabela", "João", "Lucas", "Miguel", "Pedro", "Rafael", "Sidney", "Thiago", "Vitor", "William", "Joana", "Maria", "Ana", "Beatriz", "Bianca"]
LAST_NAMES = ["Hart", "Starr", "Cash", "Baker", "Garcia", "Nguyen", "Lee", "Adams", "Gonzalez", "Perez", "Williams", "Lewis", "Walker", "Hall", "Young", "King", "Scott", "Green", "Adams", "Baker", "Gonzalez", "Nguyen"]
user_counter = 0
member_index = 1

(1..50).each do |i|
    User.create(
        email: "email#{i}@tontineo.com", 
        password: "password#{i}", 
        first_name: FIRST_NAMES.sample, 
        last_name: LAST_NAMES.sample)
end

(1..10).each do |i|
    start_month = Date.today-rand(1..365)
    payment_day = start_month+30
    tontine_id = Tontine.maximum(:id).to_i.next
    members = []

    (1..10).each do |j|
        user = User.all[user_counter]
        if user.nil? 
             user_counter = 1
             user = User.all[user_counter]
        else
            user_counter += 1
        end
        members.push(Member.new(user_id: user.id, tontine_id: tontine_id, position: j, status: "active"))
    end

    Tontine.create(id: tontine_id,
        name: "Tontine #{i}", 
        user_id: members.sample.user_id,
        contribution: rand(1..10)*100, 
        start_month: start_month,
        payment_day: payment_day,
        participants: 10, 
        status: "active"
    )

    members.each do |member|
        member.id = member_index
        member.tontine_id = tontine_id
        member_index += 1
        member.save
    end
end