RoR GL
======
_This is a sample application for a Ruby on Rails Geek Lunch_

I do always asked my self why every Ruby on Rail iniciation samples are so excesibly simple and makes so extensive use of scaffolding, when every Rails developer will tell that scaffolding generators are not a good thing for a real project.
Here we try to prived simple steps to get with a simple example developed in away a developer may do it. For our example project we will use TDD, so that we can let the tests to lead us throw Rails components while we develop our application.

Steps to reproduce this example
-------------------------------

- Create project with `rails new ror_gl --skip-test-unit`.
The --skip-test-unit option to the rails command tells Rails not to generate a test directory associated with the default Test::Unit framework. This is not because we won’t be writing tests, is just because we will be using RSpec.

- Update the [Gemfile][1] to include the required gems. Once we have so we need to run following commands:
  
  `bundle install --without production`

  `bundle update`

  `bundle install`

  From now on we won't need the _--without production_ flag any more, since it's a _remembered option_ and bundle will do it for us.

- Improve security by updating the [*secret_token.rb*][2] file. This is not a must, but because it’s a potentially serious security issue I feel it’s important to include it even at this early stage.

- Config RSpec with `rails generate rspec:install`.
This configures Rails to use RSpec in place of Test::Unit.

- Initialize Guard `bundle exec guard init rspec`
- Update [Guardfile][3]
- Run Guard `bundle exec guard` and run the tests in the console `all rspec`
- Install `gem install rb-fsevent`
- Create [database.yml][4]
- Create db ` bundle exec rake db:create`
- Create integration test for tasks`rails g integration_test tasks`
- Run Guard `bundle exec guard` and run the tests in the console `all rspec`
- Add resources :tasks to [routes][5]
- Run Guard `bundle exec guard` and run the tests in the console `all rspec`
- Change spec/request to spec/features for capybara
- Run Guard `bundle exec guard` and run the tests in the console `all rspec`
- Create the controller for tasks `rails g controller Tasks index`, along with the index views
- Add `root tasks#index` to the routes.rb file
- Create the model `rails g model Task task:string`
- Migrate the db `rake db:migrate`
- Migrate the db `rake db:migrate RAILS_ENV=test`
- Run Guard `bundle exec guard` and run the tests in the console `all rspec`
- Update tasks_spec.rb
- Update view
- Update tasks_spec.rb
- Update controller



[1]: https://github.com/agpelliza/ror_gl/blob/master/Gemfile
[2]: https://github.com/agpelliza/ror_gl/blob/master/config/initializers/secret_token.rb




Pasos Posta
-----------
- rails new proy_name --skip-test-unit
- update Gemfile and run `bundle update`, `bundle install`
- update secret_token.rb with a dinamic hash
- rails generate rspec:install
- bundle exec guard init rspec
- bundle exec spork --bootstrap
- bundle exec guard init spork
- config spork at spec_helper
- config capybara at spec_helper
- create config/database.yml
- bundle exec guard
  - all rspec
- rails generate integration_test tasks
- remove all generated directory specs but request directory
- rails generate controller Tasks index
- rails generate model Task task:string
- bundle exec rake db:migrate
- bundle exec rake db:migrate RAILS_ENV=test

Start TDD
---------
_Keep this flow:_

- Update specs with new requirements
- Update models, views, controllers & configs (routes) to fit requirements and make tests pass
- Update specs..
- Update models, views, controllers & configs (routes)..
- ...


RVM, Ruby and Rails instalation steps:
----------

**Prerequisites:**

We need install some staff before use Ruby on Rails.

- sudo apt-get install openssl
- sudo apt-get install nodejs (or the JS interpreter that you prefer)

**Steps for instalation:**

- user$ \curl -L https://get.rvm.io | bash -s stable
- rvm list known (you could see the diferents version of ruby. Choose the version that you prefer)
- rvm install 2.0.0 (you could choose another version)
- rvm use 2.0.0
- rvm gemset create your_gemset (it save the gems which you are working)
- gem install rails





Other Steps
-----------

Steps
=====
Environment
-----------

- 

Sample
------

- rails new geek_lunch --skip-test-unit
- cd geek_lunch
- cp -f ../machete/Gemfile .
- bundle install --without production
- bundle update
- bundle install
- cp -f ../machete/.gitignore .
- cp -f ../machete/config/initializers/secret_token.rb config/initializers/secret_token.rb
- rails generate rspec:install
- git init
- git add .
- git commit -m "Initial commit"
- git mv README.rdoc README.md
- git commit -am "Improve the README"
- git remote add origin https://github.com/agpelliza/machete.git
- git push -u origin master
- git config --global push.default simple
- heroku create
- git push heroku master
- heroku run rake db:migrate
- git checkout -b tasks
- rails generate controller Tasks index --no-test-framework
- git add .
- git commit -m "Add a Tasks controller"
- rails generate integration_test tasks
- # update spec/spec_helper.rb with capybara DSL
- bundle exec rspec spec/requests/tasks_spec.rb
- # update spec/requests/tasks_spec.rb to some real spec
- # update config/routes.rb
- git add .
- git commit -m "Add a first test"
- # update Gemfile for guard
- bundle install
- bundle exec guard init rspec
- # update Guardfile
- bundle exec guard
- git add .
- git commit -m "Guard config"
- # update Gemfile for spork
- bundle install
- bundle update childprocess
- bundle install
- bundle exec spork --bootstrap
- # update spec/spec_helper to start env in prefork
- time bundle exec rspec spec/requests/tasks_spec.rb
- bundle exec spork
- time bundle exec rspec spec/requests/static_pages_spec.rb --drb (in a new console)
- git add .
- git commit -m "Spork config and test"
- bundle exec guard init spork
- # update Guardfile to integrate spork with guard
- bundle exec guard
- rails generate model Task task:string --no-test-framework
- rake db:migrate RAILS_ENV=test
- rake db:migrate
- # start TDD flow




