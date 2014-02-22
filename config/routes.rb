GetIn::Application.routes.draw do
  resources :activities do
    resources :content
  end
end
