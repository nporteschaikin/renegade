user = User.create(username: "npc", password: "test000", password_confirmation: "test000", email: "noah@porteschaikin.com", name: "Noah Portes Chaikin")
user.rooms.create([{name: "Technology", slug: "tech"}, {name: "Sports", slug: "sports"}, {name: "Politics", slug: "pol"}, {name: "Gossip", slug: "gossip"}])
user.spaces.create(name: "Noah's Favorites", slug: "noahsfavorites")
# Items::Link.create(url: "http://www.huffingtonpost.com/2013/07/04/ruth-bader-ginsburg-retirement_n_3545678.html", room: Room.find_by_slug("pol"), message: "140 characters fit here.", user: user)
# Items::Link.create(url: "http://www.politico.com/story/2013/07/edward-snowden-nsa-93742.html?hp=t1", room: Room.find_by_slug("pol"), message: "140 characters fit here.", user: user)
# Items::Link.create(url: "http://www.dailykos.com/story/2013/07/05/1221372/-Abbreviated-pundit-roundup-As-one-democracy-celebrates-its-Independence-Day-another-is-in-turmoil", room: Room.find_by_slug("pol"), message: "140 characters fit here.", user: user)
# Items::Link.create(url: "http://thinkprogress.org/justice/2013/07/04/2258221/epic-nsa-scotus/", room: Room.find_by_slug("pol"), message: "140 characters fit here.", user: user)
# Items::Link.create(url: "http://techcrunch.com/2013/07/05/oliver-samwer-marco-boerries-and-sonali-de-rycker-join-techcrunch-disrupt-europe/", room: Room.find_by_slug("tech"), message: "140 characters fit here.", user: user)
# Items::Link.create(url: "http://gigaom.com/2013/07/05/graphene-may-give-us-cooler-longer-lasting-computers/", room: Room.find_by_slug("tech"), message: "140 characters fit here.", user: user)
# Items::Link.create(url: "http://www.macrumors.com/2013/07/03/apple-continues-rolling-out-iwork-for-icloud-beta-invites/", room: Room.find_by_slug("tech"), message: "140 characters fit here.", user: user)
# Items::Link.create(url: "http://arstechnica.com/science/2013/07/how-nasa-steers-the-international-space-station-around-space-junk/", room: Room.find_by_slug("tech"), message: "140 characters fit here.", user: user)
# Items::Link.create(url: "http://gizmodo.com/were-hiring-a-deal-master-561565878", room: Room.find_by_slug("tech"), message: "140 characters fit here.", user: user)
# Items::Link.create(url: "http://jezebel.com/these-emmy-awards-lawn-signs-in-la-are-weird-605933054", room: Room.find_by_slug("gossip"), message: "140 characters fit here.", user: user)
# Items::Link.create(url: "http://espn.go.com/los-angeles/nba/story/_/id/9451262/los-angeles-lakers-bracing-worst-dwight-howard-sources-say", room: Room.find_by_slug("sports"), message: "140 characters fit here.", user: user)
# Items::Link.create(url: "http://profootballtalk.nbcsports.com/2013/07/05/native-american-author-calls-goodell-cowardly-on-redskins-issue/", room: Room.find_by_slug("sports"), message: "140 characters fit here.", user: user)
# Items::Link.create(url: "http://www.grantland.com/blog/the-triangle/post/_/id/67678/the-rise-and-fall-of-the-milwaukee-brewers", room: Room.find_by_slug("sports"), message: "140 characters fit here.", user: user)