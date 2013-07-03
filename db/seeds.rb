user = User.create(username: "npc", password: "test000", password_confirmation: "test000", email: "noah@porteschaikin.com", name: "Noah Portes Chaikin")
user.rooms.create([{name: "Technology", slug: "tech"}, {name: "Sports", slug: "sports"}, {name: "Politics", slug: "politik"}])
user.spaces.create(name: "Noah's Favorites", slug: "noahsfavorites")
