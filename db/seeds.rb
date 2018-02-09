# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Sector.create!(
	name:"Administration",
	code:"101")

Sector.create!(
	name:"Church Ministries",
	code:"102")
Sector.create!(
	name:"Pastoral Care and ministries",
	code:"103")


puts "3 sectors created"

Department.create!(
	name:"Hospitality",
	code:"1011",
	sector_id:Sector.first.id)

Department.create!(
	name:"Programs",
	code:"1012",
	sector_id:Sector.first.id)

Department.create!(
	name:"Human Resource",
	code:"1013",
	sector_id:Sector.first.id)

Department.create!(
	name:"Estates",
	code:"1014",
	sector_id:Sector.first.id)

Department.create!(
	name:"Security",
	code:"1015",
	sector_id:Sector.first.id)


Department.create!(
	name:"IT",
	code:"1016",
	sector_id:Sector.first.id)


Department.create!(
	name:"Children Church",
	code:"1021",
	sector_id:Sector.second.id)


Department.create!(
	name:"Youth Church",
	code:"1022",
	sector_id:Sector.second.id)

Department.create!(
	name:"Young Adult Church",
	code:"1023",
	sector_id:Sector.second.id)

Department.create!(
	name:"Services and Volunteer Management",
	code:"1024",
	sector_id:Sector.second.id)


Department.create!(
	name:"Technical Production",
	code:"1025",
	sector_id:Sector.second.id)


Department.create!(
	name:"Media",
	code:"1026",
	sector_id:Sector.second.id)


Department.create!(
	name:"Music",
	code:"1027",
	sector_id:Sector.second.id)


Department.create!(
	name:"Small Groups",
	code:"1031",
	sector_id:Sector.third.id)


Department.create!(
	name:"Family Enrichment Ministry",
	code:"1032",
	sector_id:Sector.third.id)

Department.create!(
	name:"Discipleship and Member Integration",
	code:"1033",
	sector_id:Sector.third.id)


Department.create!(
	name:"Membership Experience",
	code:"1034",
	sector_id:Sector.third.id)



Department.create!(
	name:"Evangelism and Missions",
	code:"1035",
	sector_id:Sector.third.id)


puts "All departments created"



User.create!(
	email:"adminuser@email.com",
	password:"pass1234",
	first_name:"Admin",
	password_confirmation:"pass1234",
	sector_id:1,
	department_id:1,
	su_role:true,
	ss_role:true)


puts "1 Admin user created"