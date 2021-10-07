User.create!(email: 'admin@admin.com', password: 'jap3g1', password_confirmation: 'jap3g1')

30.times do
  Course.create!([{
                   title: Faker::Educator.course_name,
                   description: Faker::TvShows::GameOfThrones.quote,
                   user_id: User.first.id
                 }])
end
