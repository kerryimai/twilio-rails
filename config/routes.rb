Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'twilio/voice' => 'twilio#voice'
  get 'twilio/number' => 'twilio#number'
  get 'twilio/voicemail' => 'twilio#voicemail'

end
