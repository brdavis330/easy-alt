# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  address         :string
#  email           :string
#  name            :string
#  password_digest :string
#  phone_number    :string
#  vendor          :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
