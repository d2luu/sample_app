User.create!(name:  "Luu Manh",
             email: "luubkk57@gmail.com",
             dateofbirth: "26/10/1994",
             gender: "Male",
             phone: "01647996070",
             password:              "luumanh94",
             password_confirmation: "luumanh94",

             admin: true,
             activated: true,
             activated_at: Time.zone.now)

50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  dateofbirth = "01/01/1994"
  gender = "Male"
  phone = "01647996070"
  password = "password"
  User.create!(name:  name,
               email: email,
			   dateofbirth: dateofbirth,
			   gender: gender,
			   phone: phone,               
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }