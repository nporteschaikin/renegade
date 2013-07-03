# Create first user
user = User.create(username: "npc", password: "test000", password_confirmation: "test000", email: "noah@porteschaikin.com", name: "Noah Portes Chaikin")

# Create first two rooms
user.rooms.create([{name: "Technology", slug: "tech"}, {name: "Sports", slug: "sports"}])

# Create first space
user.spaces.create(name: "Noah's Favorites", slug: "noahsfavorites")
