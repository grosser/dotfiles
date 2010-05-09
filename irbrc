require 'rubygems'

#nice history and color
gem 'blackwinter-wirble' # blackwinter branch has history_uniq fixes
require 'wirble'
Wirble::History::DEFAULTS[:history_uniq] = 'reverse'

Wirble.init
Wirble.colorize

#Show Rails output
require 'logger'
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT))
end
