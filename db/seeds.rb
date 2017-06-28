# users = []

20.times do
  user = User.new(
    nickname: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    about: Faker::HowIMetYourMother.quote,
    )
  user.remote_avatar_url = UiFaces.face
  user.save
  # users << user
end


boards = []

100.times do
  boards << Board.new(
    user_id: rand(20) + 1,
    title: Faker::Book.title,
    description: Faker::Friends.quote
    )
end

Board.import boards
