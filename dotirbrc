require 'rubygems'

begin
  #nice history and color
  gem 'blackwinter-wirble' # blackwinter branch has history_uniq fixes
  require 'wirble'
  Wirble::History::DEFAULTS[:history_uniq] = 'reverse'

  Wirble.init
  Wirble.colorize
rescue LoadError => e
end


#Show Rails output
#  quick-and-dirty possibility to redirect the logger-output to console
#  http://techspeak.plainlystated.com/2009/03/watching-your-logs-from-console.html
#  dynamic_logger_switcher.rb
#
#  Created by Roman Heinrich on 2009-06-05.
#  Copyright 2009 DaWanda. All rights reserved.
#

def show_rails_log
  unless @log_buffer_size
    @log_file = Rails.logger.instance_variable_get("@log")
    @log_level = Rails.logger.level
    @log_buffer_size = Rails.logger.auto_flushing
  end
  Rails.logger.flush
  Rails.logger.instance_variable_set("@log", STDOUT)
  Rails.logger.level = Logger::DEBUG
  Rails.logger.auto_flushing = 1
  nil
end

def hide_rails_log
  if @log_buffer_size
    Rails.logger.instance_variable_set("@log", @log_file)
    Rails.logger.level = @log_level
    Rails.logger.auto_flushing = @log_buffer_size
  end
  nil
end

class Time
  def self.benchmark
    t = Time.now.to_f
    yield
    Time.now.to_f - t
  end
end

def sql(query)
  ActiveRecord::Base.connection.select_all(query)
end
