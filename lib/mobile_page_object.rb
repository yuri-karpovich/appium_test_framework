# Provides very simple DSL.
# It extends Pages classes with common methods and fast elements accessors.
module MobilePageObject

  def self.included base
    base.extend ClassMethods
  end


  module ClassMethods
    cattr_accessor :driver, :driver_wrapper, :wait

    # Check if page displayed based on all its identifiers displaying - all #@identifiers should be displayed.
    # @return [true]
    # @raise if element is not found
    def displayed?
      raise "#{self} doesn't have any identifiers" if @identifiers.count.zero?
      @identifiers.all? { |locators| wait.until { driver.find_element(locators).displayed? } }
    end

    # Add new page identifier
    # @param [Hash] locators #Appium locators
    def identifier(locators)
      @identifiers ||= []
      @identifiers << locators
    end

    # Return list of identifiers
    # @return [Array]
    def identifiers
      @identifiers ||= []
    end

    # Generates some methods :name_element, :name_elements, :name_element?, :name_locators
    # @param [Symbol] name of element
    # @param [Hash] locators #Appium locators
    def element(name, locators)
      define_singleton_method "#{name}_element" do
        driver.find_element(locators)
      end

      define_singleton_method "#{name}_elements" do
        driver.find_elements(locators)
      end

      define_singleton_method "#{name}_locators" do
        locators
      end

      define_singleton_method "#{name}_element?" do
        element = send "#{name}_element"
        wait.until { element.displayed? }
      end
    end


  end


end

