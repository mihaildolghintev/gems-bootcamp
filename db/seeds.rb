user = User.new(email: 'admin@admin.com', password: 'jap3g1', password_confirmation: 'jap3g1')
user.save!

30.times do
  Course.create!([{
                   title: Faker::Educator.course_name,
                   description: Faker::TvShows::GameOfThrones.quote,
                   user_id: user.id,
                   short_description: Faker::Quote.famous_last_words,
                   language: Course.languages.first,
                   level: Course.levels.first,
                   price: Faker::Number.between(from: 1000, to: 20_000)
                 }])
end
