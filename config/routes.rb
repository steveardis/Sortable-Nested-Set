SortableNestedSet::Application.routes.draw do
  resources :pages do 
    member{
      get   :up
      get   :down
    }
    collection{
      post  :restructure
    }
  end

  root :to => "pages#index"
end
