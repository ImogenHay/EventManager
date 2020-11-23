# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

location1 = Location.where(name: 'Felbridge Village Hall').first #uses the location ORM to find any existing location with that name
                                                       #“first” returns the first record found, if any
location1.delete if location1 #if location1 record found delete it from db so no repeats

locations = Location.create([name: 'Felbridge Village Hall', description: 'Welcome to the Felbridge Village Hall. A much loved building at the heart of the Village. The Village Hall has all the amenities that you need and is a very versatile space. There is a large entrance lobby, Mens, Ladies & Disabled toilet facilities.', country: 'UK', street: '49 Crawley Down Rd', postcode: 'RH19 2NT'])
# Use the ORM again to create Location records in the database from an array of records, each entry defining a hash of the fields
