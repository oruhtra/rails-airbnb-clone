pictures_pleureurs = []
pictures_pleureurs << "https://mymodernmet.com/wp/wp-content/uploads/archive/d4M9tmZdZGmsR0w7dOoN_1082121253.jpeg"
pictures_pleureurs << "https://zibwall.files.wordpress.com/2014/08/funny-baby-face-crying-1.jpg?w=210"
pictures_pleureurs << "https://4thdivisionmoneyfam.files.wordpress.com/2015/01/wpid-man-crying-pic.jpg"
pictures_pleureurs << "http://slightlywarped.com/crapfactory/curiosities/2011/july/images/the_most_depressing_02.jpg"
pictures_pleureurs << "http://bronxbardetroit.com/wp-content/uploads/2017/10/funny-baby-face-crying-6-you-can-search-every-type-of-pic-here-on-funny-pictures-of-people-crying.jpg"
pictures_pleureurs << "https://i.pinimg.com/736x/4b/ca/34/4bca34fad61432553bbde9a67948eef7--funeral.jpg"
pictures_pleureurs << "https://mutterhals.files.wordpress.com/2014/03/images1.jpg"
pictures_pleureurs << "https://i.pinimg.com/736x/b0/72/62/b0726223102fec57edb8bfbb84227c0a--crying-face-gymhumor.jpg"
pictures_pleureurs << "https://www.creativeboom.com/uploads/articles/83/832c2a47ce810b6ad2e4df835201873787566937_1100.jpg"
pictures_pleureurs << "http://cdn3.lostateminor.com/wp-content/uploads/2010/05/Marina-Abromovic-Cry-2.jpg"
pictures_pleureurs << "https://www.readingthepictures.org/files/2011/12/mourning-Kim-Jong-Il-2.jpg"
pictures_pleureurs << "http://www.thamike.com/fn_images/crying.jpg"
pictures_pleureurs << "https://tcdh.files.wordpress.com/2011/02/431983931.jpg"
pictures_pleureurs << "http://images.amcnetworks.com/ifc.com/wp-content/uploads/2014/12/Daryl-Crying.jpg"
pictures_pleureurs << "https://i.pinimg.com/474x/ce/b1/3a/ceb13aa4cad6b4cd7c8e3ec5ffa39951--funeral-emotion.jpg"
pictures_pleureurs << "https://www.creativeboom.com/uploads/articles/5b/5b30992623189e4fb7f09f23b430281d2f2b2dd2_1100.jpg"
pictures_pleureurs << "https://joshblakesley.files.wordpress.com/2016/06/crying.jpg"
pictures_pleureurs << "https://ichef.bbci.co.uk/news/640/media/images/57405000/jpg/_57405209_jex_1268358_de28-1.jpg"
pictures_pleureurs << "https://i.pinimg.com/736x/0f/8d/b4/0f8db475d5c90cf6f4039a0fc554711a--lonely-old-age.jpg"
pictures_pleureurs << "https://image1.masterfile.com/getImage/NjIzLTA0MjU0OTc4ZW4uMDAwMDAwMDA=AF5L94/623-04254978en_Masterfile.jpg"

p "Creating 20 pleureurs"

20.times do |i|
   passeword = "123456"
   url = pictures_pleureurs [i - 1]
   user = User.new(
   first_name: Faker::Name.first_name,
   last_name: Faker::Cat.name,
   status: true,
   tarif: (56..250).to_a.sample,
   description: Faker::HowIMetYourMother.quote,
   password: passeword,
   password_confirmation: passeword,
   email: Faker::Internet.safe_email,
   phone_number: Faker::Number.number(10),
   location: ["Paris", "Bordeaux", "Toulouse", "Lille", "Lyon", "Marseille", "Nice", "Nantes", "Strasbourg", "Montpellier"].sample
   )
  user.remote_photo_url = url
  user.save
end


p "Creating an event, a booking and a review "
30.times do
  user = User.all.sample
  pleureur = User.where(status: true).sample
  ville = ["Paris", "Bordeaux", "Toulouse", "Lille", "Lyon", "Marseille", "Nice", "Nantes", "Strasbourg", "Montpellier"].sample

  my_event = Event.new(
  title: "Burrial in #{ville}",
  date: Faker::Time.between(DateTime.now - 1000, DateTime.now),
  location: "#{ville}"
  )
  my_event.user = user
  my_event.save

  booking = Booking.new(
  description: "Hello #{user.first_name}",
  price: "#{user.tarif}",
  status: "accepted"
  )
  booking.user = pleureur
  booking.event = my_event
  booking.save

   review = Review.new(
   content: Faker::ChuckNorris.fact,
   rating: (1..5).to_a.sample
   )
  review.booking = booking
  review.save

end




