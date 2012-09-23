namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Quyen LQ",
                 email: "lucquocquyen@gmail.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    #Fake link
    user = User.first
    15.times do      
        rlink = "http://genk.vn"
        name = Faker::Name.first_name
        title ="Genk.vn"
        user.links.create!(rlink: rlink, name: name, title: title) 
    end

    11.times do
      name = Faker::Name.name
      user.boxes.create!(name: name) 
    end

    user.links(limit: 11).each do |link|
      link.update_attribute("box_id", "11")
    end
  end
end