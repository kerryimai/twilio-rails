class Call < ApplicationRecord
  belongs_to :caller, class_name: "User"
  alias_attribute :CallSid, :call_sid
  alias_attribute :Digits, :option
  alias_attribute :RecordingDuration, :recording_duration
  alias_attribute :RecordingUrl, :recording_url
end
