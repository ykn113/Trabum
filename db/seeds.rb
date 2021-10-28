# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Continent.create({ name: "日本"}) if !Continent.where(name: "日本").present?;
Continent.create({ name: "アジア"}) if !Continent.where(name: "アジア").present?;
Continent.create({ name: "オセアニア"}) if !Continent.where(name: "オセアニア").present?;
Continent.create({ name: "ヨーロッパ"}) if !Continent.where(name: "ヨーロッパ").present?;
Continent.create({ name: "中東"}) if !Continent.where(name: "中東").present?;
Continent.create({ name: "アフリカ"}) if !Continent.where(name: "アフリカ").present?;
Continent.create({ name: "北米"}) if !Continent.where(name: "北米").present?;
Continent.create({ name: "南米"}) if !Continent.where(name: "南米").present?;