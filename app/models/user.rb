class User < ApplicationRecord
  has_many :outbound_calls, class_name: 'Call', :foreign_key => 'caller_id'
  has_many :inbound_calls, class_name: 'Call', :foreign_key => 'receiver_id'
end
