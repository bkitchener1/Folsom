require 'selenium-webdriver'
require 'rspec/expectations'

# A Decorator wrapper around the Selenium::WebDriver class.
# Only looks for an element when an action is executed, so it may be instantiated ahead of time.
# Caches reference to the WebElement, and will automatically re-find the element if the reference goes stale.
#
# Supports multiple types of locator formats
# string => css selector:  WebElement.new("div.className")
# hash => webdriver locators: WebElement.new(:id=>"idOfElement") or WebElement.new({:id=>"idOfElement"})
# array of strings => multiple css selectors : WebElement.new("a.class", "#idOfElement")
# array of hashes => multiple webdriver locators : WebElement.new([{:id=>"idOfElement"}, {:class=>"classOfElement"}])
#
# Supports root elements to limit search scope
# @parent = WebElement.new("#idOfParent")
# @child = WebElement.new(".classOfChild", @parent)
#
# Supports frames
# @frame = WebElement.new("iframe")
# @element = WebElement.new(locators="a.class", frame=@frame)
class WebElement
  include Selenium::WebDriver::Error
  attr_accessor :name, :locators, :frame, :element, :name, :root

  # Supports multiple types of formats
  def initialize(locators, root=nil, frame=nil)
    if locators.class == String
      @locators = [{:css=>locators}]
    elsif locators.class == Hash
      @locators = [locators]
    elsif locators.class == Array
      @locators = []
      for locator in locators
        if locator.class == String
          @locators << {:css=>locator}
        elsif locator.class == Hash
          @locators << locator
        else
          raise "Does not support locators of type #{locator.class}"
        end
      end
    else
      raise "WebElement only supports String, Hash and Array of Hash locators not #{locators.class}"
    end
    @name = ""
    @root = root
    @timeout = $element_timeout
    @frame = frame
  end

  #returns the list of Webdriver WebElements.  Used internally
  def elements
    if @frame.nil?
      $driver.switch_to.default_content
    else
      $driver.switch_to.frame(@frame.element)
    end
    for locator in @locators
      by, value = locator.first
      if not @root == nil and @root.instance_variable_defined?("@locators") and not @root.locators.nil?
        if $highlight
          @root.highlight(-1,"green")
        end
        @elements = @root.find_elements(by,value,self.name)
      else
        @elements = $driver.find_elements(by,value,self.name)
      end
      if @elements.count > 0
        @elements = filter_elements(@elements)
      end
      if @elements.count > 0
        @element = @elements.first
        return @elements
      end
    end
    @element = @elements.first
    @elements
  end

  #returns the WebDriver::WebElement assocaited with the locator.  Will always return a visible element if possible.
  def element
    if @element.nil? and @locators.nil?
      raise "Cannot find an element without locators or a webelement defined"
    end
    if @element.nil? or is_stale?
      wait("Element #{self} was not present after #{$element_timeout} seconds").until {
        exists?
      }
    end
    return @element
  end

  include Enumerable
  #Returns a list of WebElements matching the locator.  May be blank
  # WebElement.new("input")[2].click
  def [] num
    array = self.to_a
    if num > array.length
      raise "Could not find #{num} elements matching #{self}, found #{array.length}"
    end
    element = array[num]
    element
  end

  #the number of WebElements on the page
  # WebElement.new("input").count
  def count
    elements.count
  end

  #needed by Enumerable, iterates through the list of elements and yields each
  # WebElement.new("input").each { |element| element.click}
  def each
    elements.each do | element |
      new_ele = WebElement.new(@locators,@root, @frame)
      new_ele.name = @name
      new_ele.element=element
      yield new_ele
    end
  end

  #returns first item found.
  # WebElement.new("input").first
  def first
    self[0]
  end

  #returns the last item found
  # WebElement.new("input").last
  def last
    self[-1]
  end

  #webdriver wait method to be used by internal wait commands
  def wait(message, timeout=$element_timeout)
    Selenium::WebDriver::Wait.new :timeout => timeout, :interval => 1, :ignore=>[Selenium::WebDriver::Error::NoSuchElementError,Selenium::WebDriver::Error::StaleElementReferenceError], :message=>message
  end

  # Returns an array of elements matching the query.  Shortcut method to select{}.  Accepts :displayed, :text, and :attributekey
  # WebElement.new("input").where(:text, "some text").first.click
  # WebElement.new("input").where(:displayed, false).first.click
  # WebElement.new("input").where(:class, "ClassName").first.click
def where(key, value)
  key_s = key.to_s
  if key == :displayed
    @elements = elements().select{|element| element.displayed?}
  elsif key == :text
    @elements = elements.select{|element| element.text.include? value}
  # elsif instance_variable_defined?(key.to_sym)
  #   @elements = elements.select{|element| element.instance_variable_get(key.to_sym).displayed? == value}
  else
    @elements = elements.select{|element| element.attribute(key_s).include? value}
  end
  self
end

  # Selects a dropdown by key and value.  Shortcut method do WebDriver::Support:Select.select_by
  def select_by(key, value)
    option = Selenium::WebDriver::Support::Select.new(element)
    option.select_by(key, value)
  end

  # Returns the WebElement as a WebDriver::Support::Select object
  def as_select
    Selenium::WebDriver::Support::Select.new(element)
  end

  # filters elements based upon locator values that are not webdriver selectors.
  # Not fully implemented yet
  def filter_elements(elements)
    for locator in locators
      by, value = locator.first
      case by
        when :text
          elements = elements.select{ |element| element.text.include? value}
        when :index
          elements = elements[value]
        when :displayed
          elements = elements.select{ |element| element.displayed? == value}
        when :value
          elements = elements.select{ |element| element.value == value}
      end
    end
    return elements
  end

  # Returns a boolean if the element is present or not
  def exists?
    if not @element.nil? and not is_stale?
      return true
    end
    if @frame.nil?
      $driver.switch_to.default_content
    else
      $driver.switch_to.frame(@frame.element)
    end
      for locator in locators
        by, value = locator.first
        case by
          when :css, :class, :class_name, :id, :link_text, :link, :partial_link_text, :name, :tag_name, :xpath
            if not @root == nil and @root.instance_variable_defined?("@locators") and not @root.locators.nil?
              if $highlight
                @root.highlight(-1,"green")
              end
              @elements = @root.find_elements(by,value,self.name)
            else
              @elements = $driver.find_elements(by,value,self.name)
            end
            if @elements.count > 0
              @elements = filter_elements(@elements)
              @element = @elements.select{|element|element.displayed?}.first
              if @element.nil?
                @element = @elements.first
              end
              return true
            end
          else
            raise "Locator format not supported #{locator}"
        end

      end
    return false
  end


  # Generates a string for printing
  def to_s
    str = "#{@name}: #{@locators}"
    if str == ""
      yes = true
    end
    str
  end

  def ==(other)
    super
  end

  def attribute(name)
    element.attribute(name)
  end

  def clear
    element.clear
    self
  end

  def click
    begin
      element.click
    rescue UnknownError
      element.js_click
    end
    self
  end

  def css_value(prop)
    element.css_value(prop)
  end

  def hover
    $driver.action.move_to(element).perform
  end

  def displayed?
    if not exists?
      return false
    end
    return @element.displayed?
  end

  def parent
    return element.find_element(:xpath,"..")
  end

  def present?
    exists?
  end

  def enabled?
    element.enabled?
  end

  def location
    element.location
  end

  def location_once_scrolled_into_view
    element.location_once_scrolled_into_view
  end

  def selectable?
    element.selectable?
  end

  def selected?
    element.selected?
  end

  def check(is_checked=true)
    sel = selected?
    if selected? != is_checked
      element.click
    end
  end

  def send_keys(*args)
    element.send_keys(args)
  end

  def size
    element.size
  end

  def submit
    element.submit
  end

  def tag_name
    element.tag_name
  end

  def text
    element.text
  end

  def value
    element.attribute("value")
  end

  def to_json(*args)
    element.to_json(args)
  end

  def find_elements(by, value, name=NIL)
    element.find_elements(by, value, name)
  end

  def find_element(by, value, name=NIL)
    element.find_element(by, value, name)
  end

  def highlight(time=0.1, color="yellow")
    element.highlight(time, color)
  end

  def set_text(value)
    element.set_text(value)
  end

  def is_stale?
    begin
      @element.enabled?
      return false
    rescue Exception => e
      return true
    end
  end

  def html()
    attribute("outerHTML")
  rescue Selenium::WebDriver::Error::StaleElementReferenceError
  end

  def scroll_into_view()
    $driver.execute_script("arguments[0].scrollIntoView(); return;", self)
    self
  end

  def js_click
    $logger.info "JS Clicking Element #{self}"
    $driver.execute_script("arguments[0].click(); return;", self)
    self.highlight(color="red")
    self
  end

  def verify_visible(timeout=$element_timeout)
    wait("Element #{self} was not visible after #{timeout} seconds.", timeout).until {
      element.displayed?
    }
    $logger.info "Verified #{self} is visible"
    self
  end

   def verify_text(value, timeout=$element_timeout, exact_match = false)
    wait("Element #{self} text was not correct after #{timeout} seconds.  Expected '#{value}' Got '#{element.text}'",timeout).until {
      if exact_match
        element.text == value.to_s
      else
        element.text.include? value.to_s
      end
    }
    $logger.info "Verified #{self} text contains '#{value}'"
    self
   end

  def displayed_items
    visible_item_collection = []
    self.each do |current_element|
     if current_element.displayed?
       visible_item_collection << current_element
     end
    end

    visible_item_collection
  end

  def verify_attribute(name, value, timeout=$element_timeout, exact_match = false)
    wait("Element #{self} attribute #{name} was not correct after #{timeout} seconds.  Expected '#{value}' Got '#{element.attribute(name)}' #{self.html}",timeout).until {
      if element.attribute(name).nil?
        raise "Element #{self} was not correct.  Does not contain attribute #{name}: #{self.html}"
      end
      if exact_match
        element.attribute(name) == value.to_s
      else
        element.attribute(name).include? value.to_s
      end
    }
    $logger.info "Verified #{self} attribute '#{name}' contains '#{value}'"
    self
  end

  def verify_text_not(value, timeout=$element_timeout, exact_match = false)
    wait("Element #{self} text was incorrect after #{timeout} seconds.  Expected '#{element.text}' to NOT include '#{value}'", timeout).until {
      if exact_match
        not element.text == value.to_s
      else
        not element.text.include? value.to_s
      end
    }
    $logger.info "Verified #{self} text is NOT '#{value}'"
    self
  end

  def verify_attribute_not(name, value, timeout=$element_timeout, exact_match = false)
    wait("Element #{self} value was not correct after #{timeout} seconds.  Expected '#{value}' != '#{element.attribute(name)}'", timeout).until {
      if element.attribute(name).nil?
        return self
      end
      if exact_match
        element.attribute(name) != value.to_s
      else
        not element.attribute(name).include? value.to_s
      end
    }
    $logger.info "Verified #{self} #{name} is not '#{value}'"
    self
  end
  def verify_not_visible(timeout=$element_timeout)
    wait("Element #{self} value was still visible after #{timeout} seconds.", timeout).until {
      not self.displayed?
    }
    $logger.info "Verified #{self} is not visible"
    self
  end
  def verify_present(timeout=$element_timeout)
    wait("Element #{self} not present in #{timeout} seconds", timeout).until{
      self.exists?
    }
    $logger.info "Verified #{self} is present"
    self
  end

  def verify_not_present(timeout=$element_timeout)
    wait("Element #{self} value was still present after #{timeout} seconds.", timeout).until {
      not self.exists?
    }
    $logger.info "Verified #{self} is not present"
    self
  end

  def wait_until(timeout=$element_timeout, message=nil, &block)
    wait(message, timeout).until &block
    self
  end

  def verify_value(value, timeout = $element_timeout, exact_match = false)
    wait("Element #{self} value was not correct after #{timeout} seconds.  Expected '#{value}' Got '#{self.value}' : #{element.html}", timeout).until{

      if exact_match
        self.value == value.to_s
      else
        self.value.include? value.to_s
      end
    }
    $logger.info "Verified #{self} value is not '#{value}'"
    self
  end
  def verify_value_not(value, timeout = $element_timeout, exact_match = false)
    wait("Element #{self} value was still #{value} after #{timeout} seconds. #{element.html}", timeout).until{
      if exact_match
        self.value == value.to_s
      else
        self.value.include? value.to_s
      end

    }
    $logger.info "Verified #{self} value is not '#{value}'"
    self
  end




  def verify_count_greater_than(num, timeout= $element_timeout)
    wait("#{self} Expected more than #{num} elements after #{timeout} seconds.  Got '#{self.count}'", timeout).until{
      count = self.count
      newcount = num.to_i
      count > newcount
    }
    $logger.info "Verified #{self} count is greater than '#{num}'"
    self
  end

  def verify_count_less_than(num, timeout= $element_timeout)
    wait("#{self} Expected less than #{num} elements after #{timeout} seconds. Found #{self.count}", timeout).until{
      self.count < num.to_i
    }
    $logger.info "Verified #{self} count is less than '#{num}'"
    self
  end

  def verify_count(num, timeout= $element_timeout)
    wait("Expected #{num} elements #{self} after #{timeout} seconds.  Got '#{self.count}' : #{element.html}", timeout).until{
      self.count == num.to_i
    }
    $logger.info "Verified #{self} count is '#{num}'"
    self
  end
  def verify_count_not(num, timeout= $element_timeout)
    wait("Still found #{self.count} elements #{self} after #{timeout} seconds. : #{element.html}", timeout).until{
      self.count != num.to_i
    }
    self
    $logger.info "Verified #{self} count is not '#{num}'"
  end


  def verify_html(value, timeout=$element_timeout, exact_match = false)
    wait("Element #{self} html was not correct after #{timeout} seconds.  Expected '#{value}' Got '#{element.html}'",timeout).until {
      if exact_match
        element.html == value.to_s
      else
        element.html.include? value.to_s
      end
    }
    $logger.info "Verified #{self} html contains '#{value}'"
    self
  end

  def verify_html_not(value, timeout = $element_timeout, exact_match = false)
    wait("Element #{self} html was still #{value} after #{timeout} seconds. #{element.html}", timeout).until{
      if exact_match
        self.html != value.to_s
      else
        not self.html.include? value.to_s
      end

    }
    $logger.info "Verified #{self} html doesn't contain '#{value}'"
    self
  end

  def verify_style(attribute, value, timeout = $element_timeout, exact_match = false)
    wait("Element #{self} style '#{attribute}' was not correct after #{timeout} seconds.  Expected '#{value}' Got '#{element.css_value(attribute)} #{self.html}'",timeout).until {
      if exact_match
        element.css_value(attribute) == value.to_s
      else
        element.css_value(attribute).include? value.to_s
      end
    }
    $logger.info "Verified #{self} style #{attribute} contains '#{value}'"
    self
  end

  def verify_style_not(attribute, value, timeout = $element_timeout, exact_match = false)
    wait("Element #{self} style '#{attribute}' was still '#{value} 'after #{timeout} seconds.", timeout).until{
      if exact_match
        self.css_value(attribute) != value.to_s
      else
        not self.css_value(attribute).include? value.to_s
      end
    }
    $logger.info "Verified #{self} style #{attribute} doesn't contain '#{value}'"
    self
  end


  def verify_selected(timeout = $element_timeout)
    wait("Element #{self} was not selected after #{timeout} seconds.  #{self.html}'",timeout).until {
      element.selected?
    }
    $logger.info "Verified #{self} is selected"
    self
  end

  def verify_not_selected(timeout = $element_timeout)
    wait("Element #{self} was still selected after #{timeout} seconds. #{self.html}", timeout).until{
      not element.selected?
    }
    $logger.info "Verified #{self} is not selected"
    self
  end

  def verify_option_selected(value, timeout = $element_timeout)
    wait("Element #{self} option #{value} was not selected after #{timeout} seconds.  #{self.html}'",timeout).until {
      as_select.first_selected_option.text == value
    }
    $logger.info "Verified #{self} has selected #{value}"
    self
  end
end

class TextField < WebElement

end

class TextArea < WebElement

end

class Button < WebElement

end

class Icon < WebElement

end

class Image < WebElement

end

class CheckBox < WebElement

end

class DropDown < WebElement

end

class ErrorMessage < WebElement

end

class Link < WebElement

end

class Div < WebElement

end

class Span < WebElement

end

class Label < WebElement

end


