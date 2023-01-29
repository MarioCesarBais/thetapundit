Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', controller: :pages, action: :about
  get 'constelacao', controller: :pages, action: :constelacao
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cursos
  resources :agendadas, only: [:index, :create, :edit, :destroy]
  resources :inscrs, only: :new
  resources :prontuarios
  resources :eventos
  post 'distribui', to: 'agendadas#distribui'
  get 'distribui', to: 'agendadas#distribui'
  get 'agendar', to: 'agendadas#agendar'
  post 'marcar', to: 'agendadas#marcar'
  patch 'gravar', to: 'agendadas#gravar'
  get 'escolher_cliente', to: 'adms#escolher_cliente'
  get 'criar_cliente', to: 'adms#criar_cliente'
  post 'inserir_cliente', to: 'adms#inserir_cliente'
end
