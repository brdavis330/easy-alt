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
end
