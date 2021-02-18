User.destroy_all
Artist.destroy_all
Genre.destroy_all
Song.destroy_all
Favorite.destroy_all
User.reset_pk_sequence
Artist.reset_pk_sequence
Genre.reset_pk_sequence
Song.reset_pk_sequence
Favorite.reset_pk_sequence

#users
bleak = User.create(name: "codingcat", password: "cat")
jamie = User.create(name: "ninjacat", password: "911")

#artists
taylor = Artist.create(name: "Taylor Swift")
red_hot = Artist.create(name: "Red Hot Chili Peppers")
daft = Artist.create(name: "Daft Punk")
yaeji = Artist.create(name: "Yaeji")
loffler = Artist.create(name: "Christian Löffler")
gold_fir = Artist.create(name: "Gold Fir")
eli_and_fur = Artist.create(name: "Eli & Fur")
shygirl = Artist.create(name: "Shygirl")
robin_s = Artist.create(name: "Robin S.")
rina = Artist.create(name: "Rina Sawayama")
rac = Artist.create(name: "RAC")
strongboi = Artist.create(name: "Strongboi")
cautious = Artist.create(name: "Cautious Clay")
mor = Artist.create(name: "MorMor")
fx = Artist.create(name: "f(x)")
charli = Artist.create(name: "Charli XCX")
gaga = Artist.create(name: "Lady Gaga")
fallout = Artist.create(name: "Fall Out Boy")
frank = Artist.create(name: "Frank Ocean")
vince = Artist.create(name: "Vince Staples")
breaking = Artist.create(name: "Breaking Benjamin")

#genres

country = Genre.create(name: "Country")
alt = Genre.create(name: "Alternative")
elec = Genre.create(name: "Electronic")
hip_hop = Genre.create(name: "Hip-Hop")
house = Genre.create(name: "House")
indie = Genre.create(name: "Indie")
k_pop = Genre.create(name: "K-Pop")
pc = Genre.create(name: "PC Music")
pop = Genre.create(name: "Pop")
punk = Genre.create(name: "Punk")
r_b = Genre.create(name: "R&B")
rap = Genre.create(name: "Rap")
rock = Genre.create(name: "Rock")

#songs
love_story = Song.create(name: "Love Story", artist_id: taylor.id, length: "3:56", genre_id: country.id, year: 2008, url: "https://open.spotify.com/track/1vrd6UOGamcKNGnSHJQlSt?si=Lp3Imn6aSwSx3KICCGhRnA")
californication = Song.create(name: "Californication", artist_id: red_hot.id, length: "5:30", genre_id: alt.id, year: 1999, url: "https://open.spotify.com/track/48UPSzbZjgc449aqz8bxox?si=AjN7FUI2SY6ISv6-VGMZnA")
harder = Song.create(name: "Harder, Better, Faster, Stronger", artist_id: daft.id, length: "3:45", genre_id: elec.id, year: 2001, url: "https://open.spotify.com/track/5W3cjX2J3tjhG8zb6u0qHn?si=mBoSFnu4Qqm1j5g714Ejgg")
rain_gurl = Song.create(name: "Raingurl", artist_id: yaeji.id, length: "3:57", genre_id: elec.id, year: 2017, url: "https://open.spotify.com/track/5z1wOyEyoRu0HTkXYvuqiH?si=JmKcY-JYRfaDw8B3BYCDbQ")
ronda = Song.create(name: "Ronda", artist_id: loffler.id, length: "5:46", genre_id: elec.id, year: 2020, url: "https://open.spotify.com/track/4WyhOKXtCkNVcgfTBpYaxm?si=NJ8roD_FRRyp8RXnCp1Nvw")
night_walk = Song.create(name: "Night Walk", artist_id: gold_fir.id, length: "4:18", genre_id: elec.id, year: 2019, url: "https://open.spotify.com/track/5CZrgMeHNiW71WRwTCgBck?si=Que1QQOjQs2YKIR0w-kPIg")
something_was_real = Song.create(name: "Something Was Real", artist_id: eli_and_fur.id, length: "3:42", genre_id: elec.id, year: 2018, url: "https://open.spotify.com/track/7HXqYIF5kMN1XY52GWQKrZ?si=cUI9xpV1SGmxCHn-1e0VTA")
slime = Song.create(name: "SLIME", artist_id: shygirl.id, length: "2:39", genre_id: hip_hop.id, year: 2020, url: "https://open.spotify.com/track/5alFLxnNmBmTdNM6Oq0nqD?si=jEnn0fWMRz-U-zy6R57n2w")
show_me_love = Song.create(name: "Show Me Love", artist_id: robin_s.id, length: "4:12", genre_id: house.id, year: 1993, url: "https://open.spotify.com/track/4t0UsYzmmmZRMTWn77jiGF?si=Yl1dKznCSraSM8PquvgRyA")
xs = Song.create(name: "XS", artist_id: rina.id, length: "3:21", genre_id: indie.id, year: 2020, url: "https://open.spotify.com/track/1TWNKyNQOBfNUkWWs7FooF?si=2mqWE4mJQJGPHtpMRDFemA")
mia = Song.create(name: "MIA", artist_id: rac.id, length: "2:32", genre_id: indie.id, year: 2020, url: "https://open.spotify.com/track/7BCFV1bils1XvWp2r7zY0d?si=KIeeCk6PR2eA-ZGCTHUKZA")
honey = Song.create(name: "Honey Thighs", artist_id: strongboi.id, length: "4:44", genre_id: indie.id, year: 2020, url: "https://open.spotify.com/track/00Ym9pLCeLnEzwy95bnzn1?si=QaXgrIxITf22yM4iqgRBXA")
cold_war = Song.create(name: "Cold War", artist_id: cautious.id, length: "3:22", genre_id: indie.id, year: 2018, url: "https://open.spotify.com/track/6DwiGVCgXGREeCyJZtX7S1?si=gkODLGT1RtysN-f3ZdL4CQ")
heaven = Song.create(name: "Heaven's Only Wishful", artist_id: mor.id, length: "4:03", genre_id: indie.id, year: 2018, url: "https://open.spotify.com/track/7ksSKcmjvXE6lfDZYe6U7E?si=LQF0_hamRF2Z_5WM1VJ05w")
walls = Song.create(name: "4 Walls", artist_id: fx.id, length: "3:27", genre_id: k_pop.id, year: 2015, url: "https://open.spotify.com/track/2YkjXEab4USTV9uuAgC90E?si=6yw500VmQqWqIf-Vg74Jww")
ten = Song.create(name: "Track 10", artist_id: charli.id, length: "5:27", genre_id: pc.id, year: 2017, url: "https://open.spotify.com/track/4t9PBD27dndlf6YMBK2ROc?si=Pco0adxTQPu6HjMDlR2QUA")
stupid = Song.create(name: "Stupid Love", artist_id: gaga.id, length: "3:14", genre_id: pop.id, year: 2020, url: "https://open.spotify.com/track/7yBbV2k2S2uhaQc24NF2xt?si=mkAXS03OQI-kgLgRErdUrQ")
sugar = Song.create(name: "Sugar, We’re Goin Down", artist_id: fallout.id, length: "3:49", genre_id: fallout.id, year: 2005, url: "https://open.spotify.com/track/2TfSHkHiFO4gRztVIkggkE?si=6rHDcRKoR5ucjENkp6qmMQ")
pyramids = Song.create(name: "Pyramids", artist_id: frank.id, length: "9:53", genre_id: r_b.id, year: 2012, url: "https://open.spotify.com/track/4QhWbupniDd44EDtnh2bFJ?si=uWKu5qGsRgyemVBteFXEAQ")
yeah_right = Song.create(name: "Yeah Right", artist_id: vince.id, length: "3:09", genre_id: rap.id, year: 2017, url: "https://open.spotify.com/track/35tWhD29yvWwB0IDRr6zsL?si=39_nqTGxQU6dPBXONkiQSQ")
diary = Song.create(name: "Diary of Jane", artist_id: breaking.id, length: "3:21", genre_id: rock.id, year: 2006, url: "https://open.spotify.com/track/5m9uiFH9sK5wxRZdfN62n9?si=etF0r2j8S3CFzhWlhPKk5A")

 puts "💿 💿 💿 💿 Seeded! 💿 💿 💿 💿 "