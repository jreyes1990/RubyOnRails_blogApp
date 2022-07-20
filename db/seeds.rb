# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
Article.create(title: 'Impresora CANON', body: 'Descricòn de la impresora, para uso de reportes', user_id: 1)
Article.create(title: 'Impresora HP', body: 'Descricòn de la impresora, para uso de reportes', user_id: 2)
Article.create(title: 'Impresora multifuncional HP', body: 'Descricòn de la impresora, para uso de reportes', user_id: 1)
