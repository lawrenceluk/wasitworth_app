WasitworthApp::Application.routes.draw do
  
  resources :schools, :path => '' do
    resources :w_classes, :path => '', :except => [:index]
  end

  root 'pages#home'

end
