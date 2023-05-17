desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  #  id              :integer          not null, primary key
  #  address         :string
  #  email           :string
  #  name            :string
  #  password_digest :string
  #  phone_number    :string
  #  vendor          :boolean
  #  created_at      :datetime         not null
  #  updated_at      :datetime     

  names = ["Pat", "Raghu", "Jelani"]
  bool = [true, false]

  3 times do |count|
    user = User.new
    user.name = names.at(count)
    user.address = "200 S Wacker"
    user.email = "#{name.at(count)}@example.com"
    user.password = "password"
    user.phone_number = "222-222-2222"
    user.vendor = bool.sample
  end

  p "Added #{User.count} Users"
end
