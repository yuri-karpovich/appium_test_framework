Before '@appium' do |scenario|
  tags          = scenario.tags.map(&:name)
  platform_name = nil
  platform_name = :android if tags.find { |t| t == '@android' }
  platform_name = :ios if tags.find { |t| t == '@ios' }

  raise 'You should specify @android or @ios tag for @appium scenarios' unless platform_name
  device = ENV['DEVICE']
  raise "You should provide a device name in ENV['DEVICE'] variable" unless device
  app_path = ENV['APP_PATH']
  raise "You should provide a path to the apk file in ENV['APP_PATH']" unless app_path

  @driver_wrapper                   = AppiumDriver.new(platform_name, deviceName: device, app: app_path)
  Page::ClassMethods.driver_wrapper = @driver_wrapper
  @driver                           = @driver_wrapper.driver
  Page::ClassMethods.driver         = @driver
  @wait                             = @driver_wrapper.wait
  Page::ClassMethods.wait           = @wait
  @remembered                       = {}
end

After do
  @driver_wrapper.teardown
end