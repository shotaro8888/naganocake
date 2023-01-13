Rails.application.routes.draw do
 devise_for :customers, skip: [:passwords], controllers: {
   registrations: "pablic/registrations",
   sessions: 'public/sessions'
 }

 devise_for :admin, skip: [:registrations, :passwords], controllers: {
   sessions: "admin/sessions"
 }
end
