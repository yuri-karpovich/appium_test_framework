module Page

  def self.included base
    base.extend ClassMethods
  end


  module ClassMethods
    cattr_accessor :driver, :wait

    def displayed?
      wait.until { identifier_element.displayed? }
    end

    def identifier_element
      raise 'Define #identifier_element method first'
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

