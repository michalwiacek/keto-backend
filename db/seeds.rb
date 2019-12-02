# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin_password = SecureRandom.hex(9)
admin_email = 'andrzej@nekosoft.pl'

admin = {
  email: admin_email,
  first_name: 'Andrzej',
  last_name: 'Bond',
  password: admin_password,
  admin: true
}

a = User.create!(admin)
a.add_role :admin
a.confirm

p "created admin with email: #{admin_email}, password: #{admin_password}"
