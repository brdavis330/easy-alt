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
end
