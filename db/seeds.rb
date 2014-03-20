# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
member = Member.create :email => 'tprentis@gmail.com', :password => 'Estero8064'
Category.create [{:name => 'Physical Labor'},
                  {:name => 'Office Work'},
                  {:name => 'Computer Software'},
                  {:name => 'Computer Hardware'},
                  {:name => 'Errands'},
                  {:name => 'I Need A Hand'},
                  {:name => 'Mentor/Teacher'}
                  
                  ]   
                   
member.jobs.create :title => 'House painting', 
                   :body => 'I need someone to paint my 2 story house',
                   :published_at => Date.today,
                   :excerpt => 'Paint House',
                   :location => 'Estero, FL'

member.jobs.create :title => 'Trash Pick Up',
                   :body => 'Can somebody come get some trash.  It is about a pickup load.',
                   :published_at => Date.today,
                   :excerpt => 'Trash Pick UP',
                   :location => 'Estero, FL'
                   

member.jobs.create :title => 'Music Lessons',
                   :body => 'I need Piano Lessons for my 10 yr. old.  Willing to pay $15/hr',
                   :published_at => Date.today, 
                   :excerpt => 'Piano Music Lessons',
                   :location => 'Estero, FL'
                   
                   
member.jobs.create :title => 'Hair Styling',
                   :body => 'Need a Stylist every other week to do my hair',
                   :published_at => Date.today, 
                   :excerpt => 'Hair Cut Stylist',
                   :location => 'Estero, FL'
                      
                   
member.jobs.create :title => 'Pool Maintenance',
                   :body => 'NWant Reliable Pool Maintenance on bi-weekly basis',
                   :published_at => Date.today, 
                   :excerpt => 'Pool Maintenance Swimming',
                   :location => 'Estero, FL'
                    
                   
member.jobs.create :title => 'Pick Vegetables',
                   :body => 'Need laborer to pick tomatoes fulltime',
                   :published_at => Date.today, 
                   :excerpt => 'Pick Vegetables Labor Farm',
                   :location => 'Estero, FL'

                                      
member.jobs.create :title => 'Hair Styling',
                   :body => 'Need a Stylist every other week to do my hair',
                   :published_at => Date.today, 
                   :excerpt => 'Hair Cut Stylist',                   
                   :location => 'Estero, FL'


member.jobs.create :title => 'Computer Repair',
                   :body => 'Fix my slow computer',
                   :published_at => Date.today, 
                   :excerpt => '',                                        
                   :location => 'Estero, FL'
                                   
member.jobs.create :title => 'Programming',
                   :body => 'I want a web site built to promote my music',
                   :published_at => Date.today, 
                   :excerpt => 'Music MP3 Digital',
                   :location => 'Estero, FL'
                      