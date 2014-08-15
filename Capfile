require 'capistrano/console'

# this is not set for default
#require 'capistrano/rails/migrations'
#require 'capistrano/rails/assets'


# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

require 'capistrano/bundler'
require 'capistrano/rails'

#add for sidekiq
#you should care about the order of require
require 'capistrano/sidekiq'
require 'capistrano/sidekiq/monit' #to require monit tasks # Only for capistrano3


require 'capistrano/rvm'
set :rvm_type, :user
set :rvm_ruby_version, '2.0.0-p451'

# Includes tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#
# require 'capistrano/rvm'
# require 'capistrano/rbenv'
# require 'capistrano/chruby'
# require 'capistrano/bundler'
# require 'capistrano/rails/assets'
# require 'capistrano/rails/migrations'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
