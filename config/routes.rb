SortableNestedSet::Application.routes.draw do
  resources :pages do 
    member{
      get :up
      get :down
    }
  end

  root :to => "pages#index"
end
