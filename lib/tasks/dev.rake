desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment }) do
  names = ["Pat", "Raghu", "Jelani"]
  bool = [true, false]

  5.times do |count|
    name = Faker::Name.first_name
    user = User.create(
      name: name,
      address: Faker::Address.full_address,
      email: "#{name.downcase.split(" ").join("-")}@example.com",
      phone_number: Faker::PhoneNumber.phone_number,
      vendor: [true, false].sample,
    ) do |u|
      u.password = "password"
    end

    ticket = Ticket.create(
      status: "new",
      details: Faker::Lorem.paragraph,
      customer: User.where(vendor: false).sample,
      vendor: User.where(vendor: true).sample,
    )
    ticket.remote_photo_url = Faker::LoremFlickr.image(size: "250x250", search_terms: ["fashion"])

    ticket.save
  end
end
