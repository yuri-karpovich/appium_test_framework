require 'rspec'
require 'appium_lib'
require 'active_support/all'
require 'rspec/expectations'
require './lib/mobile_page_object'
require 'i18n'

I18n.load_path = Dir['translations/*.yml']
I18n.locale    = ENV['APP_LOCALE'] || :en