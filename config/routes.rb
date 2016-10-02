Rails.application.routes.draw do
  
  resources :mouse_racks do
    resources :mating_cages, except: [:index], controller: 'mouse_racks/mating_cages'
    resources :holding_cages, except: [:index], controller: 'mouse_racks/holding_cages'
  end
  
  resources :mating_cages, except: [:index], controller: 'mouse_racks/mating_cages'do
    resources :mice, except: [:index, :show]
  end
  
  resources :holding_cages, except: [:index], controller: 'mouse_racks/holding_cages' do
    resources :mice, except: [:index, :show]
  end
  
  resources :mice, only: [:index, :show]
  
  root 'mouse_racks#index'
  
end
