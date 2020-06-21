users = [
    {username: "User1", email: "email@email.com", password: "password"},
    {username: "User2", email: "email2@email2.com", password: "password"}
]
users.each do |user|
    User.create(user)
end
collections = [
        {name: "Halo", console: "Xbox", genre: "FPS", user_id: "1"},
        {name: "SWTOR", console: "PC",  genre: "RPG", user_id: "2"}
    ]
    collections.each do |entry|
       Collections.create(entry)
end 
