Rails.application.routes.draw do
  resources :calls, only: [:index, :create]
  get 'number' => 'calls#number'
  get 'end_of_call' => 'calls#end_of_call'
end
