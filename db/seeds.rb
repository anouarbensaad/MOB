# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(login:'admin',nom:'admin', prenom:'admin', email:'admin@mysite.com', utype:'Administrateur', password_digest:'$2a$10$EF2MpeDPiHX.Sj4/d3tSo.bbSySvqjKjO5amnq.fO5pzxwuxtkqUe')
