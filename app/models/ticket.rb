# == Schema Information
#
# Table name: tickets
#
#  id          :integer          not null, primary key
#  details     :text
#  photo       :string
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#  vendor_id   :integer
#
class Ticket < ApplicationRecord

  belongs_to(:customer, { :required => true, :class_name => "User", :foreign_key => "customer_id" })
  belongs_to(:vendor, { :required => true, :class_name => "User", :foreign_key => "vendor_id" })
  has_many(:messages, { :class_name => "Message", :foreign_key => "ticket_id", :dependent => :destroy })
end
