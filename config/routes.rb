GetIn::Application.routes.draw do
  resources :activities do
    resources :content
  end
  post '/activities/:activity_id/content/add_pic', to: 'content#add_pic'

  resources :categories, only: [:index]

  resources :profiles, only: [:show, :edit, :update]
  post '/profiles/add_pic', to: 'profiles#add_pic'

  resources :site, only: [:index]

  devise_for :users
  # The priority is based upon order of
  # creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # set the root route to hit the activities index (for now)
  root to: 'site#index'

end

#                   Prefix Verb   URI Pattern                                         Controller#Action
#   activity_content_index GET    /activities/:activity_id/content(.:format)          content#index
#                          POST   /activities/:activity_id/content(.:format)          content#create
#     new_activity_content GET    /activities/:activity_id/content/new(.:format)      content#new
#    edit_activity_content GET    /activities/:activity_id/content/:id/edit(.:format) content#edit
#         activity_content GET    /activities/:activity_id/content/:id(.:format)      content#show
#                          PATCH  /activities/:activity_id/content/:id(.:format)      content#update
#                          PUT    /activities/:activity_id/content/:id(.:format)      content#update
#                          DELETE /activities/:activity_id/content/:id(.:format)      content#destroy
#               activities GET    /activities(.:format)                               activities#index
#                          POST   /activities(.:format)                               activities#create
#             new_activity GET    /activities/new(.:format)                           activities#new
#            edit_activity GET    /activities/:id/edit(.:format)                      activities#edit
#                 activity GET    /activities/:id(.:format)                           activities#show
#                          PATCH  /activities/:id(.:format)                           activities#update
#                          PUT    /activities/:id(.:format)                           activities#update
#                          DELETE /activities/:id(.:format)                           activities#destroy
#                          POST   /activities/:activity_id/content/add_pic(.:format)  content#add_pic
#               categories GET    /categories(.:format)                               categories#index
#             edit_profile GET    /profiles/:id/edit(.:format)                        profiles#edit
#                  profile GET    /profiles/:id(.:format)                             profiles#show
#                          PATCH  /profiles/:id(.:format)                             profiles#update
#                          PUT    /profiles/:id(.:format)                             profiles#update
#         profiles_add_pic POST   /profiles/add_pic(.:format)                         profiles#add_pic
#               site_index GET    /site(.:format)                                     site#index
#         new_user_session GET    /users/sign_in(.:format)                            devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                            devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                           devise/sessions#destroy
#            user_password POST   /users/password(.:format)                           devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)                       devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                      devise/passwords#edit
#                          PATCH  /users/password(.:format)                           devise/passwords#update
#                          PUT    /users/password(.:format)                           devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                             devise/registrations#cancel
#        user_registration POST   /users(.:format)                                    devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                            devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                               devise/registrations#edit
#                          PATCH  /users(.:format)                                    devise/registrations#update
#                          PUT    /users(.:format)                                    devise/registrations#update
#                          DELETE /users(.:format)                                    devise/registrations#destroy
#                     root GET    /                                                   site#index
