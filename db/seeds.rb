# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.create([
  {title: 'Greetings FnFers!', body:'Welcome to the FnF 2015 Cabin Reservation App<br/><br/>Using FnF 2015 Cabins you can register for lodging at the FnF Summer Campout, receive notification of lodging registration times, review and reserve specific rooms at the Saratoga Springs resort, and receive confirmation of your reservation and payment. To use FnF 2015 Cabins, please review the lodging reservation instructions below and lodging policy details, and you will then be taken to a form where you can create your account in FnF 2015 Cabins.'},
  {title: 'Using FnF 2015 Cabins', body:'<h2>Register:<h2><p>On the next page, FnF 2015 Cabins will prompt you for contact information and details about your participation in this year\'s summer campout. We will be assigning people to signup tiers based on the following</p><p>Coordinators & Planners:<br/><br/>People on the planners mailing list.     Planner Medical: Planners with reasonable medical need for a room, or late term pregnant / post-partum mothers Other / Attendee: People who have tickets already but don\'t fit into one of the other categories.</p><p>Once you complete the registration process, FnF 2015 Cabins admins will send you a follow-up email that confirms your eligibility and provides you with dates during which the system will be available to you to register for the lodging of your choice at Saratoga Springs.</p>'}
])

User.create([
   {name: 'mint', email:'minty@inappropirates.com'},
   {name: 'maximus', email:'maximus@fatboycentral.com'}
])
