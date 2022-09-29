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
      email: 'test0@t.com',
      password: 'test123',
      user_name: 'test1',
      account_name: '101',
      introduction: '何にもなりたくない',
      age: '21',
      sex: 'female',
      is_deleted: 'false'
    },

    {
      email: 'test1@t.com',
      password: 'test123',
      user_name: 'test2',
      account_name: '102',
      introduction: '何にもなりたくない',
      age: '32',
      sex: 'male',
      is_deleted: 'false'
    },

    {
      email: 'test2@t.com',
      password: 'test123',
      user_name: 'test3',
      account_name: '103',
      introduction: '何にもなりたくない',
      age: '47',
      sex: 'male',
      is_deleted: 'false'
    }
  ]
)

Relationship.create!(
  [
    {
      following_id: '2',
      follower_id: '1'
    },

    {
      following_id: '2',
      follower_id: '3'
    },

    {
      following_id: '3',
      follower_id: '1'
    },

    {
      following_id: '3',
      follower_id: '2'
    }
  ]
)