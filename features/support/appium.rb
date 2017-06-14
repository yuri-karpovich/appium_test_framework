class AppiumDriver
  attr_reader :driver, :wait

  def initialize(platform, opts)
    device_name                                        = opts.delete :deviceName
    app                                                = opts.delete :app
    opts                                               = case platform
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

  def swipe(x1, y1, x2, y2, duration = 500)
    action = Appium::TouchAction.new
    action.swipe({ :start_x => x1, :start_y => y1, :end_x => x2, :end_y => y2, :duration => duration }).perform
  end

  def swipe_from_left
    swipe 1, 0, 500, 0
  end

end