Rails.application.routes.draw do
  # http://localhost:3000/admins/sign_in
  devise_for :admins, path: 'admins',
                      controllers: {
                        sessions:      'admins/devise/sessions',
                        passwords:     'admins/devise/passwords',
                        registrations: 'admins/devise/registrations'
                      }
  # http://localhost:3000/umdzes/sign_in
  devise_for :umdzes, path: 'umdzes',
                      controllers: {
                        sessions:      'umdzes/devise/sessions',
                        passwords:     'umdzes/devise/passwords',
                        registrations: 'umdzes/devise/registrations'
                      }
  # http://localhost:3000/patrons/sign_in
  devise_for :patrons,  path: 'patrons',
                      controllers: {
                        sessions:      'patrons/devise/sessions',
                        passwords:     'patrons/devise/passwords',
                        registrations: 'patrons/devise/registrations'
                      }

  authenticated :patron do
    root 'patrons/home#index',     as: :auth_patron_root
  end
  authenticated :umdze do
    root 'umdzes/home#index',      as: :auth_umdze_root
  end
  authenticated :admin do
    root 'admins/home#index', as: :auth_admin_root
  end

  namespace :admins do
    resources :spaces do
      resources :reservations # restrict routes once all routes are known
    end
    get 'home/index', as: :home
    # resource  :home,       only: [:index]
  end
  get '/admins', to: 'admins/home#index', as: :admins

  namespace :umdzes do
    resources :reservations, only: [:edit, :update]
    get 'home/index', as: :home
    # resource  :home,       only: [:index]
  end
  get '/umdzes', to: 'umdzes/home#index', as: :umdzes

  namespace :patrons do
    get 'home/index', as: :home
    # resource  :home,       only: [:index]
  end
  get '/patrons', to: 'patrons/home#index', as: :patrons

  get '/landing', to: 'landing#index', as: :landing
  get 'landing/index'
  root to: "landing#index"
end
