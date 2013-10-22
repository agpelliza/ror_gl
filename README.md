RoR GL
======
_This is a sample application for a Ruby on Rails Geek Lunch_

I do always asked my self why every Ruby on Rail iniciation samples are so excesibly simple and makes so extensive use of scaffolding, when every Rails developer will tell that scaffolding generators are not a good thing for a real project.
Here we try to prived simple steps to get with a simple example developed in away a developer may do it. For our example project we will use TDD, so that we can let the tests to lead us throw Rails components while we develop our application.

Steps to reproduce this example
-------------------------------

- Create project
  `rails new ror_gl --skip-test-unit`
  The --skip-test-unit option to the rails command tells Rails not to generate a test directory associated with the default Test::Unit framework. This is not because we won’t be writing tests, is just because we will be using RSpec.

- Update necessary gems
  At this point we need to get the [Gemfile updated][1] to include the required gems. Once we have so we need to run following commands:
  `bundle install --without production`
  `bundle update`
  `bundle install`
  From now on we won't need the _--without production_ fleag any more, since it's a remembered option and bundle will handle it for us.

- Improve security
  Also, we may want to update [_config/initializers/secret_token.rb_][2] at this early stage. This is not a must, but because it’s a potentially serious security issue I feel it’s important to include it even at this early stage.

- Config RSpec
  `rails generate rspec:install`
  This configures Rails to use RSpec in place of Test::Unit.


[1]: https://github.com/agpelliza/ror_gl/blob/master/Gemfile
[2]: https://github.com/agpelliza/ror_gl/blob/master/config/initializers/secret_token.rb