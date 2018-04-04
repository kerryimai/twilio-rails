Rails.application.routes.draw do
  root :to => 'calls#index'
  resources :calls, only: [:index, :create]
  get 'number' => 'calls#number'
  get 'end_of_call' => 'calls#end_of_call'
end
