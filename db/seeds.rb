# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  [
    {
      email: 'test@t.com',
      password: 'test123',
      user_name: '1230',
      account_name: '1000',
      introduction: '疲れた',
      birth_date: '',
      sex: '',
      is_deleted: 'false'
    },

    {
      email: 'test0@t.com',
      password: 'test123',
      user_name: '1231',
      account_name: '1001',
      introduction: '',
      birth_date: '',
      sex: 'female',
      is_deleted: 'false'
    },

    {
      email: 'test1@t.com',
      password: 'test123',
      user_name: '1232',
      account_name: '1002',
      introduction: '',
      birth_date: '',
      sex: '',
      is_deleted: 'false'
    }
  ]
)

Admin.create!(
 email: 'test@t.com',
 password: 'test123'
)