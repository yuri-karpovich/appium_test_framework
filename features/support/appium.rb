class AppiumDriver
  attr_reader :driver, :wait

  def initialize(platform, opts)
    device_name = opts.delete :deviceName
    app         = opts.delete :app
    opts        = case platform
                    when :android
                      {
                        caps:       {
                          platformName: platform,
                          app:          app,
                          deviceName:   device_name
                        },
                        appium_lib: {
                          wait_timeout:  11130,
                          wait_interval: 1
                        }
                      }
                    when :ios
                      {
                        caps:       {
                          platformName: platform,
                          deviceName:   device_name,
                          app:          app
                        },
                        appium_lib: {
                          wait_timeout: 30
                        }
                      }
                    else
                      raise "Unknown platformName: #{platform}"
                  end


    # Create the driver
    @driver                                            = Appium::Driver.new(opts)

    # two different ways to wait
    @driver.start_driver.manage.timeouts.implicit_wait = 10
    @wait                                              = Selenium::WebDriver::Wait.new :timeout => 20
  end

  def teardown # kill driver at the end of the test
    @driver.driver_quit
  end

end