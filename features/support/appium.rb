# Wrapper around #Appium::Driver
class AppiumDriver
  attr_reader :driver, :wait

  # @param [Symbol] platform :ios or :android
  # @param [Hash] opts options
  # @option opts [String] :deviceName Name of android device
  # @option opts [String] :app Path to the application
  def initialize(platform, opts)
    device_name              = opts.delete :deviceName
    app                      = opts.delete :app
    options                  = case platform
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
    @driver                  = Appium::Driver.new(options)

    # two different ways to wait
    @driver.start_driver.manage.
      timeouts.implicit_wait = 10
    @wait                    = Selenium::WebDriver::Wait.new :timeout => 30
  end

  # kill driver at the end of the test
  def teardown
    @driver.driver_quit
  end

  # Do swipe action
  def swipe(x1, y1, x2, y2, duration = 500)
    action = Appium::TouchAction.new
    action.swipe({ :start_x => x1, :start_y => y1, :end_x => x2, :end_y => y2, :duration => duration }).perform
  end

  # Swipe from the left corner. Helpful to get an application menu
  def swipe_from_left
    swipe 1, 0, 500, 0
  end

end