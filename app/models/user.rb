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

  has_many(:work_requests, { :class_name => "Ticket", :foreign_key => "customer_id", :dependent => :destroy })
  has_many(:messages, { :class_name => "Message", :foreign_key => "sender_id", :dependent => :destroy })
  has_many(:work_orders, { :class_name => "Ticket", :foreign_key => "vendor_id", :dependent => :destroy })
end
