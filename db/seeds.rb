# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

posts = Post.create([
  {
    category: 'home', title: 'Greetings FnFers!',
    body:
      'Welcome to the FnF 2016 Cabin Reservation App<br/><br/>'\
      'Using FnF 2016 Cabins you can register for lodging at the FnF Summer Campout, receive notification of lodging '\
      'registration times, review and reserve specific rooms at the Saratoga Springs resort, and receive confirmation '\
      'of your reservation and payment. To use FnF 2016 Cabins, please review the lodging reservation instructions '\
      'below and lodging policy details, and click <strong><a href="/users/new">here to register</a></strong>.'
  },
  {
    category: 'home', title: 'Using FnF 2016 Cabins',
    body:
      '<p>On the next page, FnF 2016 Cabins will prompt you for contact information and details about your participation '\
      'in this year\'s summer campout. We will be assigning people to signup tiers based on the following</p>'\
      '<p><strong>Coordinators & Planners:</strong> People on the planners mailing list.</p>'\
      '<p><strong>Planner Medical:</strong> Planners with reasonable medical need for a room, or late term pregnant / post-partum mothers</p>'\
      '<p><strong>Other / Attendee:</strong> People who have tickets already but don\'t fit into one of the other categories.</p>'\
      '<p>Once you complete the registration process, FnF 2016 Cabins admins will send you a follow-up email that '\
      'confirms your eligibility and provides you with dates during which the system will be available to you to '\
      'register for the lodging of your choice at Saratoga Springs.</p>'
  },
  {
      category: 'home', title: 'Register',
      body:
        '<p>During the registration period, log onto the FnF 2016 Cabins lodging registration page '\
        '(you will receive the URL in email). Please review the available lodging and select from the available options.'\
        'Please note that you will be able to register for exactly one room*, and NO MORE than one room. '\
        'Once you select a room, FnF 2016 Cabins will reserve that room in your name until the payment deadline '\
        '(1 week), during which time you must send your payment, or we will release your reservation.</p>'\
        '<p>Upon receipt of payment, FnF 2016 Cabins will send you a confirmation of your reservation. '\
        'Please note that some of the rooms have space for as many as 6 people**, so you can organize a '\
        'group and split up the room however you wish. Once you have registered and paid for a room, any room '\
        'changes or cost sharing are your responsibility. <strong>Please note</strong>, you will also be responsible '\
        'for any damages that may occur and removal of all trash. '\
        '<strong>FnF campout is a pack in and pack out event and this applies to the cabins as well.</strong>'\
        '<p style="font-style: italic; font-size: smaller;">* The notable exception: In the Main Cabin, you may register'\
        'for individual beds in dormitory-style rooms. These rooms have multiple twin bunk beds for which you can register for more than one.'\
        '<br/><br/>** Assuming 2 people to a double or queen bed and 1 person to a twin.</p>'
  },
  {
    category: 'home', title: 'Pay',
    body:
        '<p>Once you have reserved your lodging through FnF 2016 Cabins, you will receive a confirmation email with '\
        'details on where to send your payment by check or money order.</p>'\
        'Please note that your pre-paid registration only lasts for one week. If we have not received your payment '\
        'within that time, FnF 2016 Cabins will cancel your reservation and make your lodging preference available for other participants.</p>'\
        'Once we receive payment, FnF 2016 Cabins will send you an email confirming your paid reservation. Should you '\
        'have any questions about the FnF lodging policy, please review the policy and if you still have questions, contact Jessica Allard</p>'\
        '<p>Happy camping!</p>'
  },
  {
    category: 'rule', title: 'ATTENTION: FnF Campout is a PACK IN/PACK OUT Event.',
    body:
      '<p>FnF Campout is a PACK IN/PACK OUT Event.</p>'\
      '<p>Please take all your Trash/Recyclables including what is in the trash can when you leave.</p>'
  },
  {
      category: 'rule', title: 'Room Rules: Smoking',
      body:
          'Smoking (of any kind) is strictly prohibited (that means don\'t do it). Saratoga Springs only permits '\
          'smoking in designated smoking areas (see map or ask). <strong>This is especially important this year.</strong>'
  },
  {
      category: 'rule', title: 'Room Rules: Bathrooms',
      body:
          'The bathroom facilities are for your use only. This is a critical restriction as the septic system will not '\
          'handle more than what the limited number of renters can produce. <strong>Please ask your friends to make '\
          'use of the ample portable and public facilities.</strong>'
  },
  {
      category: 'rule', title: 'Room Rules: Leave it as you found it',
      body:
          'Please leave the room as you found it. Move furniture back where it was when you arrived. You are '\
          'responsible for any damages or excessive dirtiness.'
  },
  {
      category: 'rule', title: 'Room Rules: Trash',
      body:
          'Remove <strong>ALL<strong> trash from room. FnF is a pack in/pack out event and this includes the trash '\
          'and recyclables in the trash cans in the rooms.'
  },
  {
      category: 'rule', title: 'Room Rules: Issues',
      body:
          'Should you have any problems with your room, please contact Bob, the Saratoga Springs facilities guy.'
  },
  {
      category: 'faq', title: 'you haz question?',
      body:
          'here are all the answers!'
  },
  {
      category: 'faq', title: 'FAQ it',
      body:
          'yep'
  }
])

users = User.create([
   {name: 'minty', email:'minty@inappropirates.com', password:'nopenope', password_confirmation:'nopenope', phone: '1111', role: 'planner', admin: true},
   {name: 'maximus', email:'maximus@fatboycentral.com', password:'nopenope', password_confirmation:'nopenope', phone: '1111', role: 'planner', admin: true},
   {name: 'asdf', email:'asdf@gmail.com', password:'asdfasdf', password_confirmation:'asdfasdf', phone: '1111', role: 'attendee', admin: false}
])

Tier.create([
  {label: 'Tier 1', description: 'Secret', available: DateTime.new(2016, 7, 1, 19, 30, 0, Rational(-7,24))},
  {label: 'Tier 2', description: 'Planners Medical', available: DateTime.new(2016, 6, 29, 19, 30, 0, Rational(-7,24))},
  {label: 'Tier 3', description: 'Planners', available: DateTime.new(2016, 7, 1, 19, 30, 0, Rational(-7,24))},
  {label: 'Tier 4', description: 'All', available: DateTime.new(2016, 7, 2, 19, 30, 0, Rational(-7,24))},
  {label: 'Tier 5', description: 'Un-moderated', available: DateTime.new(2016, 7, 30, 19, 30, 0, Rational(-7,24))},
])

summer_cabin = BuildingType.create(label: 'Summer Cabin');
wood_tent = BuildingType.create(label: 'Wood Tent');
cabin = BuildingType.create(label: 'Cabin');
lodge = BuildingType.create(label: 'Lodge');

bed = AccommodationType.create(label: 'Bed', description: 'bed in a dorm room');
private_room = AccommodationType.create(label: 'Private Room', description: '1 bed in room');
semi_private_room = AccommodationType.create(label: 'Semi-Private Room', description: '2 beds in room');
not_private_room = AccommodationType.create(label: 'Not Private Room', description: '3+ beds in room OR futon in living area');

array = ['S1', 'S2']
array.each { |label|
  building = Building.create(label: label, building_type: summer_cabin)
  Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                       label: "Summer Cabin #{label}", description: '1x double (futon) - screens & no electricity',
                       occupancy: 2, price: 185.0, quantity: 1, air_conditioning: false, bathroom: false, kitchen: false)
}

array = ['A', 'B', 'C', 'D', 'E', 'F', 'H']
array.each { |label|
  building = Building.create(label: label, building_type: wood_tent)
  Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                       label: "Wood Tent #{label}", description: '1x queen',
                       occupancy: 2, price: 227.0, quantity: 1, air_conditioning: false, bathroom: false, kitchen: false)
}
building = Building.create(label: 'G', building_type: wood_tent)
Accommodation.create(accommodation_type: private_room, building: building, hold: true,
                     label: 'Wood Tent G - Medic', description: '1x queen',
                     occupancy: 2, price: 309.0, quantity: 1, air_conditioning: true, bathroom: false, kitchen: false)


building = Building.create(label: 'Cabin 1', building_type: cabin)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: 'Room A', description: '2x twin (can be joined for 1x queen)',
                     occupancy: 2, price: 340.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: 'Room B', description: '2x double',
                     occupancy: 4, price: 412.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: 'Room C', description: '2x twin (can be joined for 1x queen)',
                     occupancy: 2, price: 340.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: 'Room D', description: '1x double + 1x twin',
                     occupancy: 3, price: 340.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)

building = Building.create(label: 'Cabin 2', 'description': 'Reserved for Radiant Atmospheres', building_type: cabin)
Accommodation.create(accommodation_type: semi_private_room, building: building, hold: true,
                     label: 'Room A', description: 'Front of cabin. 2x queen (bunked)',
                     occupancy: 4, price: 381.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: semi_private_room, building: building, hold: true,
                     label: 'Room B', description: 'Front of cabin. 2x queen (bunked) + 1x double (futon)',
                     occupancy: 6, price: 515.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: semi_private_room, building: building, hold: true,
                     label: 'Room C', description: 'Back of cabin. 2x queen (bunked)',
                     occupancy: 4, price: 381.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: semi_private_room, building: building, hold: true,
                     label: 'Room D', description: 'Back of cabin. 2x twin',
                     occupancy: 2, price: 361.0, quantity: 1, air_conditioning: true, bathroom: true, kitchen: false)

building = Building.create(label: 'Cabin 5', building_type: cabin)
Accommodation.create(accommodation_type: semi_private_room, building: building, hold: false,
                     label: 'Room A', description: '2x queen (bunked)',
                     occupancy: 4, price: 412.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: semi_private_room, building: building, hold: false,
                     label: 'Room B', description: '2x twin (bunked) + 2x queen (bunked)',
                     occupancy: 6, price: 515.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: not_private_room, building: building, hold: false,
                     label: 'Room C', description: '1x double futon (living room)',
                     occupancy: 2, price: 185.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)

building = Building.create(label: 'Cabin 6', building_type: cabin)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: 'Room A', description: '1x double',
                     occupancy: 2, price: 391.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: true)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: 'Room B', description: '1x queen + 1x twin',
                     occupancy: 3, price: 391.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: true)
Accommodation.create(accommodation_type: not_private_room, building: building, hold: false,
                     label: 'Room C', description: '1x double futon (living room)',
                     occupancy: 2, price: 206.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: true)

building = Building.create(label: 'Cabin 7', building_type: cabin)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: 'Room A', description: '1x double',
                     occupancy: 2, price: 361.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: 'Room B', description: '1x queen + 1x twin',
                     occupancy: 3, price: 361.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: not_private_room, building: building, hold: false,
                     label: 'Room C', description: '1x double futon (living room)',
                     occupancy: 2, price: 185.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)

building = Building.create(label: 'Main Lodge', building_type: cabin)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: 'Suite', description: '1x queen + 1x twin',
                     occupancy: 3, price: 309.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: bed, building: building, hold: false,
                     label: 'Dorm A', description: '1 twin bed in a room of 10 twin beds (bunked)',
                     occupancy: 1, price: 67.0, quantity: 10, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: bed, building: building, hold: false,
                     label: 'Dorm B', description: '1 twin bed in a room of 10 twin beds (bunked)',
                     occupancy: 1, price: 67.0, quantity: 8, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: bed, building: building, hold: false,
                     label: 'Dorm C', description: '1 twin bed in a room of 10 twin beds (bunked)',
                     occupancy: 1, price: 67.0, quantity: 8, air_conditioning: false, bathroom: true, kitchen: false)

Planner.create([
  {'email': 'planner1@inappropirates.com'},
  {'email': 'planner2@inappropirates.com'}
])
