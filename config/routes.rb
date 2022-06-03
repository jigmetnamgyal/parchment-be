# frozen_string_literal: true

Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'

  post '/users', defaults: { format: :json }, to: 'registration#create'
  delete '/users', defaults: { format: :json }, to: 'logout#destroy'
  post '/users/sign_in', defaults: { format: :json }, to: 'login#login'
end
