require 'bundler'
Bundler.require
require 'csv'

require './lib/router'

Router.new.perform