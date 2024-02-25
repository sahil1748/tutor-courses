# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Course Records
@course_1 = Course.create!(name: "Learn Javascript", description: "Javascript adavanced course", category: "javascript", level: 2)

@course_2 = Course.create!(name: "Master Javascript", description: "Javascript adavanced course", category: "javascript", level: 0)

@course_3 = Course.create!(name: "Master Ruby on Rails", description: "Ruby on Rails advanced course", category: "ruby on rails", level: 1)

# Tutuor Records
Tutor.create!(first_name: 'John', last_name: 'Doe', date_of_birth: '29-01-1997', about: 'About john doe', primary_skill: 'javascript', course_id: @course_1.id)

Tutor.create!(first_name: 'Elena', last_name: 'Gilbert', date_of_birth: '25-04-1999', about: 'About Elena Gilbert', primary_skill: 'javascript', course_id: @course_1.id)

Tutor.create!(first_name: 'Stefan', last_name: 'Salvatore', date_of_birth: '25-08-2000', about: 'About Stefan Salvatore', primary_skill: 'ruby on rails', course_id: @course_2.id)

Tutor.create!(first_name: 'Matt', last_name: 'Damon', date_of_birth: '01-11-1995', about: 'About Matt Damon', primary_skill: 'ruby on rails', course_id: @course_3.id)