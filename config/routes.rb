Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/api/v1/:a/add/:b", to: "nvm_kata/math#add", constraints: { a: /[^\/]+/, b: /[^\/]+/  }
  get "/api/v1/:a/sub/:b", to: "nvm_kata/math#sub", constraints: { a: /[^\/]+/, b: /[^\/]+/  }
  get "/api/v1/:a/mul/:b", to: "nvm_kata/math#mul", constraints: { a: /[^\/]+/, b: /[^\/]+/  }
  get "/api/v1/:a/div/:b", to: "nvm_kata/math#divide", constraints: { a: /[^\/]+/, b: /[^\/]+/  }
  get "/api/v1/:a/fact", to: "nvm_kata/math#fact", constraints: { a: /[^\/]+/}
end
