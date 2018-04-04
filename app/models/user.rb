class User < ApplicationRecord
  # attr_accessor :number
  has_many :outbound_calls, class_name: 'Call', :foreign_key => 'caller_id'
  alias_attribute :Caller, :number
  alias_attribute :FromCity, :city
  alias_attribute :FromState, :state
  alias_attribute :CallerCountry, :country


end
