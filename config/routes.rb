WasitworthApp::Application.routes.draw do
  
  scope 'a', as: 'a' do
    resources :schools, :w_classes
  end
  resources :schools, :path => '' do
    resources :w_classes, :path => '', :except => [:index]
  end

  root 'pages#home'
  match '/a/schools/new', to: 'schools#create', via: [:post]
  match '/a/w_classes/new', to: 'w_classes#create', via: [:post]
  match 'reports/new', to: 'reports#create', via: [:post]

end
