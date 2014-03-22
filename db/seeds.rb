# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "nokogiri"
#Coursesテーブルに値を代入 
#Course(id: integer, day: string, period: integer, teacher: string, memo: string, created_at: datetime, updated_at: datetime, user_id: integer, name: string) 
file = File.open("db/sirabasu2.xml")
xml_doc = Nokogiri::XML(file)
item_nodes = xml_doc.xpath('//item')

item_nodes.each do |item|
	day     = item.xpath('day').text
	name    = item.xpath('subject').text
	teacher = item.xpath('teacher').text
	Course.create(day:day, name:name, teacher:teacher)
end
