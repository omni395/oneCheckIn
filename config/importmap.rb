# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
pin "@hotwired/turbo-rails", to: "https://ga.jspm.io/npm:@hotwired/turbo-rails@7.1.1/app/javascript/turbo/index.js"
pin "@hotwired/turbo", to: "https://ga.jspm.io/npm:@hotwired/turbo@7.1.0/dist/turbo.es2017-esm.js"
pin "@rails/actioncable/src", to: "https://ga.jspm.io/npm:@rails/actioncable@7.0.2/src/index.js"
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.0.1/dist/stimulus.js"
