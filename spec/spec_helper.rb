$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)


require 'unsaved_records'
require 'pry'

require 'pathname'
GEM_ROOT = Pathname.new File.expand_path('../..', __FILE__)
$: << GEM_ROOT.join('lib').to_s

require 'bundler'
ENV['RAILS_ENV'] ||= 'test'
require GEM_ROOT.join('spec/dummy/config/environment')
require 'rspec/rails'

require 'rake'
Rails.application.load_tasks
Rake::Task['db:migrate'].invoke
