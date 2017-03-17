# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(first_name: "Mo", last_name: "Riley", email: "moriley5@gmail.com", password: "password")
guardian = user.guardian_profiles.create!(title: "Papa", image: "image.jpeg")
memory = guardian.memories.create!(audio_recording: "audio.mp3", description: "Grandpa reading Christmas story", date: DateTime.new(1996,12,25))
memory2 = guardian.memories.create!(audio_recording: "audio2.mp3", description: "Words of advice", date: DateTime.new(2005,8,16))
memory3 = guardian.memories.create!(audio_recording: "audio3.mp3", description: "Grandpa says 'hi'", date: DateTime.new(2001,11,18))
memory4 = guardian.memories.create!(audio_recording: "audio4.mp3", description: "Words of encouragement", date: DateTime.new(2011,1,16))
memory5 = guardian.memories.create!(audio_recording: "audio5.mp3", description: "Hanging out with the family", date: DateTime.new(2014,6,11))
