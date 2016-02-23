# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def load_patients
  5.times do |i|
    fullname = Faker::Name.name.split(' ')
    Patient.create(
      firstname: fullname.first.truncate(25),
      lastname: fullname.last.truncate(25),
      birthdate: Faker::Date.between(60.year.ago, 18.year.ago),
      type_document_cd: ['DNI', 'CI', 'LD'].shuffle.first,
      document_number: Faker::Number.number(8).to_s,
      nationality: "Argentina",
      gender_cd: ['femenino', 'masculino'].shuffle.first,
      phone: '+54 221 ' + rand(4000000...7000000).to_s
    )
  end
end

load_patients
