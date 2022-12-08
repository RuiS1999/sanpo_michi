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
      introduction: '何事も',
      birth_date: '',
      sex: '',
      is_deleted: 'false'
    },

    {
      email: 'test0@t.com',
      password: 'test123',
      user_name: '1231',
      account_name: '1001',
      introduction: '温泉行きたい',
      birth_date: '',
      sex: 'female',
      is_deleted: 'false'
    },

    {
      email: 'test1@t.com',
      password: 'test123',
      user_name: '1232',
      account_name: '1002',
      introduction: '海辺で黄昏たい',
      birth_date: '',
      sex: '',
      is_deleted: 'false'
    }
  ]
)

Post.create!(
  [
    {
      user_id: '1',
      body: 'test',
      hashbody: '#test'
    },

    {
      user_id: '2',
      body: 'test2',
      hashbody: '#test'
    }
  ]
)

StepLog.create!(
  [
    {
      user_id: '1',
      calorie: '390',
      number_of_step: '12000',
      walking_time: '120',
      start_time: '2022-12-1 00:00:00'
    },

    {
      user_id: '1',
      calorie: '390',
      number_of_step: '12000',
      walking_time: '120',
      start_time: '2022-12-2 00:00:00'
    }
  ]
)

Admin.create!(
 email: 'test@t.com',
 password: 'test123'
)
