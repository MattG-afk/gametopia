users = [
    {username: "user1", email: "email@email.com", password: "password"},
    {username: "user2", email: "email2@email2.com", password: "password"}
]
users.each do |user|
    User.create(user)
end
collections = [
        {name: "halo", console: "xbox", genre: "fps", user_id: "1"},
        {name: "swtor", console: "pc",  genre: "rpg", user_id: "2"}
    ]
    collections.each do |entry|
       Collection.create(entry)
end 
