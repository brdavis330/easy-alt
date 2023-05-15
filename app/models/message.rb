# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :text
#  photo      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sender_id  :integer
#  ticket_id  :integer
#
class Message < ApplicationRecord
  belongs_to(:sender, { :required => true, :class_name => "User", :foreign_key => "sender_id" })
  belongs_to(:ticket, { :required => true, :class_name => "Ticket", :foreign_key => "ticket_id" })
  mount_uploader :photo, PhotoUploader
end
