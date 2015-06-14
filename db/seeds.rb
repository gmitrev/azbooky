# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create(email: 'gvmitrev@gmail.com', password: "12345678", avatar: 'gvmitrev.jpg')
u2 = User.create(email: 'gmitrev@hotmail.com', password: "12345678", avatar: 'gmitrev.png')

# Add a bunch of authors
orwell = Author.create(name: 'George Orwell', nationality: 'gbr', born: Date.parse('25 June 1903'), died: Date.parse('21 January 1950'))
huxley = Author.create(name: 'Aldous Huxley', nationality: 'gbr', born: Date.parse('26 July 1894'), died: Date.parse('26 July 1894'))
dostoevsky = Author.create(name: 'Fyodor Dostoyevsky', nationality: 'rus', born: Date.parse('11 November 1821'), died: Date.parse('9 February 1881'))
nabokov = Author.create(name: 'Vladimir Nabokov', nationality: 'rus', born: Date.parse('22 April 1899'), died: Date.parse('2 July 1977'))
mccarthy = Author.create(name: 'Cormac McCarthy', nationality: 'usa', born: Date.parse('July 20, 1933'))
keyes = Author.create(name: 'Daniel Keyes', nationality: 'usa', born: Date.parse('August 9, 1927'), died: Date.parse('June 15, 2014'))
martin = Author.create(name: 'George R. R. Martin', nationality: 'usa', born: Date.parse('September 20, 1948'))
wallace = Author.create(name: 'David Foster Wallace', nationality: 'usa', born: Date.parse('February 21, 1962'), died: Date.parse('September 12, 2008'))
zafon = Author.create(name: 'Carlos Ruiz Zafón', nationality: 'esp', born: Date.parse('25 September 1964'))
bulgakov = Author.create(name: 'Mikhail Bulgakov', nationality: 'rus', born: Date.parse('15 May 1891'), died: Date.parse('March 10, 1940'))
weir = Author.create(name: 'Andy Weir', nationality: 'usa', born: Date.parse('June 16 1972'))
murakami = Author.create(name: 'Haruki Murakami', nationality: 'jpn', born: Date.parse('January 12, 1949'))
mitchell = Author.create(name: 'David Mitchell', nationality: 'gbr', born: Date.parse('12 January 1969'))
remarque = Author.create(name: 'Erich Maria Remarque', nationality: 'deu', born: Date.parse('22 June 1898'), died: Date.parse('25 September 1970'))
bacigalupi = Author.create(name: 'Paolo Bacigalupi', nationality: 'usa', born: Date.parse('August 6, 1972'))
rothfuss = Author.create(name: 'Patrick Rothfuss', nationality: 'usa', born: Date.parse('June 6, 1973'))
heller = Author.create(name: ' Joseph Heller ', nationality: 'deu', born: Date.parse('May 1, 1923'), died: Date.parse('December 12, 1999'))

# Add books
n = Book.create(title: '1984', description: "While 1984 has come and gone, Orwell's narrative is more timely than ever. 1984 presents a \"negative utopia\", that is at once a startling and haunting vision of the world — so powerful that it's completely convincing from start to finish. No one can deny the power of this novel, its hold on the imaginations of entire generations of readers, or the resiliency of its admonitions — a legacy that seems to grow, not lessen, with the passage of time.", isbn: '0451524934', lang: 'eng', page_count: 326, published_in: 1949, published_by: 'Signet')
n.authors << orwell

brave = Book.create(title: 'Brave New World', description: "Far in the future, the World Controllers have created the ideal society. Through clever use of genetic engineering, brainwashing and recreational sex and drugs, all its members are happy consumers. Bernard Marx seems alone harbouring an ill-defined longing to break free. A visit to one of the few remaining Savage Reservations, where the old, imperfect life still continues, may be the cure for his
  distress...

  Huxley's ingenious fantasy of the future sheds a blazing light on the present and is considered to be his most enduring masterpiece.", isbn: '0060929871', lang: 'eng', page_count: 268, published_in: 1931, published_by: 'Harper Perennial')
brave.authors << huxley

catch22 = Book.create(title: 'Catch-22', description: "At the heart of Catch-22 resides the incomparable, malingering bombardier, Yossarian, a hero endlessly inventive in his schemes to save his skin from the horrible chances of war.

  His problem is Colonel Cathcart, who keeps raising the number of missions the men must fly to complete their service. Yet if Yossarian makes any attempts to excuse himself from the perilous missions that he's committed to flying, he's trapped by the Great Loyalty Oath Crusade, the bureaucratic rule from which the book takes its title: a man is considered insane if he willingly continues to fly dangerous combat missions, but if he makes the necessary formal request to be relieved of such missions, the very act of making the request proves that he's sane and therefore ineligible to be relieved.", isbn: '9780684833392', lang: 'eng', page_count: 453, published_in: 1961, published_by: 'Simon & Schuster')
catch22.authors << heller

crime = Book.create(title: 'Crime and Punishment', description: "Through the story of the brilliant but conflicted young Raskolnikov and the murder he commits, Fyodor Dostoevsky explores the theme of redemption through suffering. Crime and Punishment put Dostoevsky at the forefront of Russian writers when it appeared in 1866 and is now one of the most famous and influential novels in world literature.

  The poverty-stricken Raskolnikov, a talented student, devises a theory about extraordinary men being above the law, since in their brilliance they think “new thoughts” and so contribute to society. He then sets out to prove his theory by murdering a vile, cynical old pawnbroker and her sister. The act brings Raskolnikov into contact with his own buried conscience and with two characters — the deeply religious Sonia, who has endured great suffering, and Porfiry, the intelligent and discerning official who is charged with investigating the murder — both of whom compel Raskolnikov to feel the split in his nature. Dostoevsky provides readers with a suspenseful, penetrating psychological analysis that goes beyond the crime — which in the course of the novel demands drastic punishment — to reveal something about the human condition: The more we intellectualize, the more imprisoned we become.", isbn: '0143058142', lang: 'eng', page_count: 545, published_in: 1866, published_by: 'Penguin')
crime.authors << dostoevsky

animal = Book.create(title: 'Animal Farm', description: " Tired of their servitude to man, a group of farm animals revolt and establish their own society, only to be betrayed into worse servitude by their leaders, the pigs, whose slogan becomes: 'All animals are equal, but some animals are more equal than others.' This 1945 satire addresses the socialist/communist philosophy of Stalin in the Soviet Union. ", isbn: '0452284244', lang: 'eng', page_count: 152, published_in: 1945, published_by: 'Plume')
animal.authors << orwell

lolita = Book.create(title: 'Lolita', description: "Humbert Humbert - scholar, aesthete and romantic - has fallen completely and utterly in love with Lolita Haze, his landlady's gum-snapping, silky skinned twelve-year-old daughter. Reluctantly agreeing to marry Mrs Haze just to be close to Lolita, Humbert suffers greatly in the pursuit of romance; but when Lo herself starts looking for attention elsewhere, he will carry her off on a desperate cross-country misadventure, all in the name of Love. Hilarious, flamboyant, heart-breaking and full of ingenious word play, Lolita is an immaculate, unforgettable masterpiece of obsession, delusion and lust.", isbn: '0679723161', lang: 'eng', page_count: 317, published_in: 1955, published_by: 'Penguin')
lolita.authors << nabokov

road = Book.create(title: 'The Road', description: "A searing, post apocalyptic novel destined to become Cormac McCarthy’s masterpiece.

  A father and his son walk alone through burned America. Nothing moves in the ravaged landscape save the ash on the wind. It is cold enough to crack stones, and when the snow falls it is gray. The sky is dark. Their destination is the coast, although they don’t know what, if anything, awaits them there. They have nothing; just a pistol to defend themselves against the lawless bands that stalk the road, the clothes they are wearing, a cart of scavenged food—and each other.", isbn: '0307265439', lang: 'eng', page_count: 241, published_in: 2006, published_by: 'Knopf')
road.authors << mccarthy

algernon = Book.create(title: 'Flowers for Algernon', description: "Flowers for Algernon is the beloved, classic story of a mentally disabled man whose experimental quest for intelligence mirrors that of Algernon, an extraordinary lab mouse. In poignant diary entries, Charlie tells how a brain operation increases his IQ and changes his life. As the experimental procedure takes effect, Charlie's intelligence expands until it surpasses that of the doctors who engineered his metamorphosis. The experiment seems to be a scientific breakthrough of paramount importance--until Algernon begins his sudden, unexpected deterioration. Will the same happen to Charlie?", isbn: '0435123432', lang: 'eng', page_count: 218, published_in: 1959, published_by: 'Heinemann')
algernon.authors << keyes

karamazov = Book.create(title: 'The Brothers Karamazov', description: "The Brothers Karamazov is a passionate philosophical novel set in 19th century Russia, that enters deeply into the ethical debates of God, free will, and morality. It is a spiritual drama of moral struggles concerning faith, doubt, and reason, set against a modernizing Russia. ", isbn: '0374528373', lang: 'eng', page_count: 796, published_in: 1880, published_by: 'Farrar, Straus and Giroux')
karamazov.authors << dostoevsky

thrones = Book.create(title: 'A Game of Thrones', description: "Summers span decades. Winter can last a lifetime. And the struggle for the Iron Throne has begun.

  As Warden of the north, Lord Eddard Stark counts it a curse when King Robert bestows on him the office of the Hand. His honour weighs him down at court where a true man does what he will, not what he must … and a dead enemy is a thing of beauty.

  The old gods have no power in the south, Stark’s family is split and there is treachery at court. Worse, the vengeance-mad heir of the deposed Dragon King has grown to maturity in exile in the Free Cities. He claims the Iron Throne.", isbn: '0553588486', lang: 'eng', page_count: 835, published_in: 1996, published_by: 'Bantam Spectra')
thrones.authors << martin

infinite = Book.create(title: 'Infinite Jest', description: "A gargantuan, mind-altering comedy about the Pursuit of Happiness in America.

  Set in an addicts' halfway house and a tennis academy, and featuring the most endearingly screwed-up family to come along in recent fiction, Infinite Jest explores essential questions about what entertainment is and why it has come to so dominate our lives; about how our desire for entertainment affects our need to connect with other people; and about what the pleasures we choose say about who we are.

  Equal parts philosophical quest and screwball comedy, Infinite Jest bends every rule of fiction without sacrificing for a moment its own entertainment value. It is an exuberant, uniquely American exploration of the passions that make us human—and one of those rare books that renew the idea of what a novel can do.", isbn: '9780316921176', lang: 'eng', page_count: 1088, published_in: 1995, published_by: 'Back Ray Books')
infinite.authors << wallace

shadow = Book.create(title: 'The Shadow of the Wind', description: "Barcelona, 1945: A city slowly heals in the aftermath of the Spanish Civil War, and Daniel, an antiquarian book dealer’s son who mourns the loss of his mother, finds solace in a mysterious book entitled The Shadow of the Wind, by one Julián Carax. But when he sets out to find the author’s other works, he makes a shocking discovery: someone has been systematically destroying every copy of every book Carax has written. In fact, Daniel may have the last of Carax’s books in existence. Soon Daniel’s seemingly innocent quest opens a door into one of Barcelona’s darkest secrets--an epic story of murder, madness, and doomed love.", isbn: '9780143034902', lang: 'eng', page_count: 487, published_in: 2001, published_by: 'Penguin Books')
shadow.authors << zafon

master = Book.create(title: 'The Master and Margarita', description: "Mikhail Bulgakov's devastating satire of Soviet life was written during the darkest period of Stalin's regime. Combining two distinct yet interwoven parts—one set in ancient Jerusalem, one in contemporary Moscow—the novel veers from moods of wild theatricality with violent storms, vampire attacks, and a Satanic ball; to such somber scenes as the meeting of Pilate and Yeshua, and the murder of Judas in the moonlit garden of Gethsemane; to the substanceless, circus-like reality of Moscow. Its central characters, Woland (Satan) and his retinue—including the vodka-drinking black cat, Behemoth; the poet, Ivan Homeless; Pontius Pilate; and a writer known only as The Master, and his passionate companion, Margarita—exist in a world that blends fantasy and chilling realism, an artful collage of grotesqueries, dark comedy, and timeless ethical questions.

  Though completed in 1940, \"The Master and Margarita\" wasn't published in Moscow until 1966, when the first part appeared in the magazine \"Moskva.\" It was an immediate and enduring success: audiences responded with great enthusiasm to its expression of artistic and spiritual freedom.", isbn: '9780143034902', lang: 'eng', page_count: 360, published_in: 1966, published_by: 'Vintage')
master.authors << bulgakov

martian = Book.create(title: 'The Martian', description: "Six days ago, astronaut Mark Watney became one of the first people to walk on Mars. Now, he's sure he'll be the first person to die there. After a dust storm nearly kills him & forces his crew to evacuate while thinking him dead, Mark finds himself stranded & completely alone with no way to even signal Earth that he’s alive—& even if he could get word out, his supplies would be gone long before a rescue could arrive. Chances are, though, he won't have time to starve to death. The damaged machinery, unforgiving environment or plain-old \"human error\" are much more likely to kill him first. But Mark isn't ready to give up yet. Drawing on his ingenuity, his engineering skills—& a relentless, dogged refusal to quit—he steadfastly confronts one seemingly insurmountable obstacle after the next. Will his resourcefulness be enough to overcome the impossible odds against him?", isbn: '0804139024', lang: 'eng', page_count: 384, published_in: 2012, published_by: 'Crown')
martian.authors << weir

kafka = Book.create(title: 'Kafka on the Shore', description: "Kafka on the Shore, a tour de force of metaphysical reality, is powered by two remarkable characters: a teenage boy, Kafka Tamura, who runs away from home either to escape a gruesome oedipal prophecy or to search for his long-missing mother and sister; and an aging simpleton called Nakata, who never recovered from a wartime affliction and now is drawn toward Kafka for reasons that, like the most basic activities of daily life, he cannot fathom. Their odyssey, as mysterious to them as it is to us, is enriched throughout by vivid accomplices and mesmerizing events. Cats and people carry on conversations, a ghostlike pimp employs a Hegel-quoting prostitute, a forest harbors soldiers apparently unaged since World War II, and rainstorms of fish (and worse) fall from the sky. There is a brutal murder, with the identity of both victim and perpetrator a riddle - yet this, along with everything else, is eventually answered, just as the entwined destinies of Kafka and Nakata are gradually revealed, with one escaping his fate entirely and the other given a fresh start on his own.", isbn: '1400079276', lang: 'eng', page_count: 480, published_in: 2002, published_by: 'Vintage')
kafka.authors << murakami

norwegian = Book.create(title: 'Norwegian Wood', description: "Toru, a quiet and preternaturally serious young college student in Tokyo, is devoted to Naoko, a beautiful and introspective young woman, but their mutual passion is marked by the tragic death of their best friend years before.  Toru begins to adapt to campus life and the loneliness and isolation he faces there, but Naoko finds the pressures and responsibilities of life unbearable.  As she retreats further into her own world, Toru finds himself reaching out to others and drawn to a fiercely independent and sexually liberated young woman.

  A poignant story of one college student's romantic coming-of-age, Norwegian Wood takes us to that distant place of a young man's first, hopeless, and heroic love.", isbn: '0375704027', lang: 'eng', page_count: 296, published_in: 1987, published_by: 'Vintage')
norwegian.authors << murakami

autumns = Book.create(title: 'The Thousand Autumns of Jacob de Zoet', description: "In 1799, Jacob de Zoet disembarks on the tiny island of Dejima, the Dutch East India Company’s remotest trading post in a Japan otherwise closed to the outside world. A junior clerk, his task is to uncover evidence of the previous Chief Resident’s corruption.

  Cold-shouldered by his compatriots, Jacob earns the trust of a local interpreter and, more dangerously, becomes intrigued by a rare woman—a midwife permitted to study on Dejima under the company physician. He cannot foresee how disastrously each will be betrayed by someone they trust, nor how intertwined and far-reaching the consequences.

  Duplicity and integrity, love and lust, guilt and faith, cold murder and strange immortality stalk the stage in this enthralling novel, which brings to vivid life the ordinary—and extraordinary—people caught up in a tectonic shift between East and West.", isbn: '1400065453', lang: 'eng', page_count: 479, published_in: 2010, published_by: 'Random house')
autumns.authors << mitchell

quiet = Book.create(title: 'All Quiet on the Western Front', description: "This is the testament of Paul Bäumer, who enlists with his classmates in the German army of World War I. These young men become enthusiastic soldiers, but their world of duty, culture, and progress breaks into pieces under the first bombardment in the trenches.

  Through years of vivid horror, Paul holds fast to a single vow: to fight against the hatred that meaninglessly pits young men of the same generation but different uniforms against one another... if only he can come out of the war alive.", isbn: '0449213943', lang: 'eng', page_count: 296, published_in: 1928, published_by: 'Ballantine')
quiet.authors << remarque

wind = Book.create(title: 'The Name of the Wind', description: "Told in Kvothe's own voice, this is the tale of the magically gifted young man who grows to be the most notorious wizard his world has ever seen. The intimate narrative of his childhood in a troupe of traveling players, his years spent as a near-feral orphan in a crime-ridden city, his daringly brazen yet successful bid to enter a legendary school of magic, and his life as a fugitive after the murder of a king form a gripping coming-of-age story unrivaled in recent literature. A high-action story written with a poet's hand, The Name of the Wind is a masterpiece that will transport readers into the body and mind of a wizard.", isbn: '9780756404079', lang: 'eng', page_count: 662, published_in: 2007, published_by: 'Penguin')
wind.authors << rothfuss

pump = Book.create(title: 'Pump Six and Other Stories', description: "Paolo Bacigalupi's debut collection demonstrates the power and reach of the science fiction short story. Social criticism, political parable, and environmental advocacy lie at the center of Paolo's work. Each of the stories herein is at once a warning, and a celebration of the tragic comedy of the human experience.
  The eleven stories in Pump Six represent the best Paolo's work, including the Hugo nominee \"Yellow Card Man,\" the nebula and Hugo nominated story \"The People of Sand and Slag,\" and the Sturgeon Award-winning story \"The Calorie Man.\"", isbn: '159780133X', lang: 'eng', page_count: 239, published_in: 2008, published_by: 'Night Shade Books')
pump.authors << bacigalupi


Friendship.create(friendable: u1 , friend: u2, pending: false)
20.times do |i|
  User.create(email: Faker::Internet.free_email, password: "12345678", avatar: "#{i+1}.jpg")
end

User.all.each do |u|
  num = Random.rand(1..10)

  candidates = (User.all - u.friends - [u]).shuffle.take(num)
  candidates.each do |c|
    Friendship.create(friendable: u, friend: c, pending: false)
  end

  books_num = Random.rand(0..20)

  books = Book.all.shuffle.take(books_num)
  other_books = (Book.all - books).shuffle

  other_books.take(3).each do |book|
    shelf = u.shelves.where(name: 'to-read').first
    Relationship.create(user: u, book: book, shelf: shelf)
  end

  books.each do |book|
    shelf = u.shelves.sample
    feeling = ['liked', 'disliked'].sample
    Relationship.create(user: u, book: book, shelf: shelf, feeling: feeling, favourite: (Random.rand > 0.5), review: Faker::Lorem.paragraphs(Random.rand(1..4), true).join("\n"))
  end

end
