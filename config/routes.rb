Rails.application.routes.draw do
  root to: 'lunch#show'

  post '/feedback' => 'lunch#feedback'
  get '/lunch/votes_list' => 'lunch#votes_list'
  get '/lunch/thanks_for_response' => 'lunch#thanks_for_response'
end
