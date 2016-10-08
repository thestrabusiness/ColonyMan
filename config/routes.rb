Rails.application.routes.draw do
  
  resources :mouse_racks do
    resources :cages, except: [:index], controller: 'mouse_racks/cages'
  end
  
  resources :cages, except: [:index], controller: 'mouse_racks/cages' do
    resources :mice, except: [:index, :show]
  end
  
  resources :mice, only: [:index, :show]
  
  root 'mouse_racks#index'
  
end
