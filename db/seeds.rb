# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(number: '6467234567', country: 'US', state: 'NY', city:'NEW YORK', nick_name: 'John')
user2 = User.create(number: '2127234500', country: 'US', state: 'NY', city:'NEW YORK', nick_name: 'Kirk')
user3 = User.create(number: '4057234111', country: 'US', state: 'CA', city:'LOS ANGELS', nick_name: 'Peter')
user4 = User.create(number: '6467256946', country: 'US', state: 'NY', city:'NEW YORK', nick_name: 'Annie')
user5 = User.create(number: '2127234944', country: 'US', state: 'NY', city:'NEW YORK', nick_name: 'Laura')

call1 = Call.create!(receiver: user1, caller: user3, option: '1', recording_url: "test.com", recording_duration: 2)
call2 = Call.create!(receiver: user1, caller: user2, option: '1', recording_url: "test1.com", recording_duration: 0)
call3 = Call.create!(receiver: user1, caller: user5, option: '2', recording_url: "test2.com", recording_duration: 10)
call4 = Call.create!(receiver: user5, caller: user3, option: '2', recording_url: "test3.com", recording_duration: 5)
call5 = Call.create!(receiver: user3, caller: user2, option: '2', recording_url: "test4.com", recording_duration: 12)
call6 = Call.create!(receiver: user3, caller: user4, option: '1', recording_url: "test5.com", recording_duration: 14)
call7 = Call.create!(receiver: user4, caller: user2, option: '1', recording_url: "test6.com", recording_duration: 20)
