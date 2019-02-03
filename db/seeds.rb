require_relative( "../models/animal" )
require_relative( "../models/owner" )
require('pry')

Animal.delete_all()
Owner.delete_all()


owner1 = Owner.new({
  "name" => "Susan Hunter",
  "address" => "18 Hillend Rd",
  "contact_num" => "07123456789"
  })

  owner2 = Owner.new({
    "name" => "Abi Clark",
    "address" => "10 Daleview Dr",
    "contact_num" => "07987654321"
    })

owner1.save
owner2.save

animal1 = Animal.new({
  "name" => "Stimpy",
  "type" => "Dog",
  "entry_date" => "2018-12-01",
  "status" => "Unavailable"
  })

  animal2 = Animal.new({
    "name" => "Cleo",
    "type" => "Cat",
    "entry_date" => "2018-11-09",
    "status" => "Unavailable",
    "owner_id" => owner1.id
    })

  animal3 = Animal.new({
      "name" => "Speedy",
      "type" => "Tortoise",
      "entry_date" => "2018-06-15",
      "status" => "Unavailable",
      "owner_id" => owner1.id
      })

  animal4 = Animal.new({
        "name" => "Chatty",
        "type" => "Parrot",
        "entry_date" => "2018-09-23",
        "status" => "Avaiable",
        })

    animal1.save
    animal2.save
    animal3.save
    animal4.save

    owner1.name = "Suzie Hunter"
    owner1.update()

    animal1.available_for_adoption()

    animal4.adopted(owner2)

    # animal1.status = "Available"
    # animal1.update()

    # owner2.delete()
    #
    # animal1.delete()




    binding.pry
    nil









binding.pry
nil
