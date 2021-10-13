Rails.application.routes.draw do
  get 'books/list'
  get 'books/new'
  post 'books/create'
  patch 'books/update'
  get 'books/list'
  get 'books/show'
  get 'books/edit'
  get 'books/delete'
  get 'books/update'
  get 'books/show_subjects'

  root "books#list"
end

# Rails.application.routes.draw do
#   resources :books do
#     resources :subjects
#   end
#
#   get '/books/:id', to: 'books#show'
#   root "books#list"
# end


