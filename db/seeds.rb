ben = User.create(username: "ben", password: "ben", email: "ben@ben.com")
alice = User.create(username: "alice", password: "alice", email: "alice@alice.com")

xbox_one = Console.create(name: "Xbox One", company: "Microsoft", user_id: 1)
nintendo_switch = Console.create(name: "Nintendo Switch", company: "Nintendo", user_id: 2)

halo = Game.create(name: "Halo", esrb_rating: "M", console_id: 1)
fifa_17 = Game.create(name: "Fifa 17", esrb_rating: "E", console_id: 1)
splatoon_2 = Game.create(name: "Splatoon 2", esrb_rating: "E", console_id: 2)
mario_kart = Game.create(name: "Mario Kart", esrb_rating: "E", console_id: 2)
