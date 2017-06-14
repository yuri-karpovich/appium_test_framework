module Page

  def self.included base
    base.extend ClassMethods
  end


  module ClassMethods
    cattr_accessor :driver, :driver_wrapper, :wait

    def displayed?
      raise "#{self} doesn't have any identifiers" if @identifiers.count.zero?
      @identifiers.all? { |locators| wait.until { driver.find_element(locators).displayed? } }
    end

    def identifier(locators)
      @identifiers ||= []
      @identifiers << locators
    end

    def identifiers
      @identifiers ||= []
    end

    def element(name, locators)
      define_singleton_method "#{name}_element" do
        driver.find_element(locators)
      end

      define_singleton_method "#{name}_elements" do
        driver.find_elements(locators)
      end

      define_singleton_method "#{name}_element?" do
        element = send "#{name}_element"
        wait.until { element.displayed? }
      end
    end


  end


end

