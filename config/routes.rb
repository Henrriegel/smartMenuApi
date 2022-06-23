Rails.application.routes.draw do
  namespace 'api' do
    namespace 'users' do
      resources :users #Ruta /api/users/users para las peticiones http
    end
    namespace 'sessions' do
      resources :users
    end
  end
end
