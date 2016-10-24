require_relative 'web_element'

class PageObject < WebElement
  def initialize(locators=nil, element=nil)
    if locators.class == Hash
      @locators = [locators]
    elsif locators.class == Array
      @locators = locators
    elsif locators.class == String
      @locators = [{:css=>locators}]
    elsif locators.nil?
      @locators = nil
    else
      raise "Page Object only supports String, Hash and Array of Hash locators not #{locators.class}"
    end
    @element = element
    ancestors = self.class.ancestors

    convert_class_vars_to_instance_vars(self.class)
    ancestors.select{ |ancestor| ancestor < PageObject}.each { |ancestor| convert_class_vars_to_instance_vars(ancestor) }
  end


  def convert_class_vars_to_instance_vars(object)
    klass = self.class
    vars = object.instance_variables
    vars.each do |var|
      variable = object.instance_variable_get(var)
      if variable.class <= WebElement
        new_variable = variable.class.new(variable.locators)
        if variable.root.nil?
          new_variable.root = self
        else
          new_variable.root = variable.root
        end
        new_variable.frame = variable.frame
        new_variable.name = "#{object}.#{self.class_variable_name_for(variable)}"
        self.instance_variable_set(var,new_variable)
      else
        self.instance_variable_set(var,variable)
      end
    end
  end

  include Enumerable
  def [] num
    self.verify_present
    self.to_a[num]
  end

  def first
    return self[0]
  end

  def last
    return self[-1]
  end

  def entries
    entries = []
    elements.each do | element |
      new_instance = self.class.new(@locators, element)
      entries << new_instance
    end
    return entries
  end

  def each
    @entries = entries
    elements.each do | element |
      new_instance = self.class.new(@locators)
      new_instance.element = element
      new_instance.root = self.root
      new_instance.frame = self.frame
      new_instance.name
      yield new_instance
    end
  end

  def where(key, value)
    new_list = []
    elements.each { |element|
      key_s = key.to_s
      if (key == :displayed and element.displayed?) or (key == :text and element.text.include? value)# or (element.attribute(key_s).include? value)
        new_list << element
      end
    }
    @elements = new_list
    self
  end

  def self.get_param_url(params)
      url = @page_url
      if url.nil?
        raise "Cannot open page unless variable @page_url is defined"
      end
      if url.match('\$\{(.*)\}') and params.nil?
        raise "Cannot proceed, URL has an undefined paramater matching ${var_name} #{url}"
      end
      return url if params.nil?
      params.each { |param|
        key = param[0].to_s
        value= param[1].to_s
        $logger.info "PARAM URL = #{key}:#{value}"
        url = url.gsub("${#{key}}",value)
      }
      if url.match('\$\{(.*)\}')
        raise "Cannot proceed, URL has an undefined paramater matching ${var_name} #{url}"
      end
      return url
  end

  def self.open_page(params=nil)
    url = get_param_url(params)
    $driver.get url
    return self.new
  end

  def open_page(params=nil)
    url = self.get_param_url(params.to_s)
    $driver.get url
    return self
  end

  def self.method_missing(method_name, *args, &block)
    vars = self.instance_variables
    symbol = "@#{method_name}".to_sym
    if vars.include? symbol
      var = self.instance_variable_get "@#{method_name}"
      if var.class <= WebElement
        var.name = "#{self}.#{symbol}"
      end
      return var
    else
      vars = self.class.instance_variables
      if vars.include? "@#{method_name}".to_sym
        var = self.class.instance_variable_get "@#{method_name}"
        return var
      end

    end
  end

  def method_missing(method_name, *args, &block)
    vars = self.instance_variables
    if vars.include? "@#{method_name}".to_sym
      return self.instance_variable_get "@#{method_name}"
    else
      vars = self.class.instance_variables
      if vars.include? "@#{method_name}".to_sym
        return self.class.instance_variable_get "@#{method_name}"
      end

    end
     super
  end

  def element=(element)
    @element = element
    @elements = [element]
  end

  def locators=(locators)
    if locators.class == Hash
      @locators = [locators]
    elsif locators.class == Array
      @locators = locators
    else
      raise "WebElement only supports Hash and Array of Hash locators not #{locators.class}"
    end
    @locators = locators
  end

  def elements
    exists?
    @elements
  end

  def exists?
    if @locators.nil?
      return false
    end
    if not @elements.nil? and @elements.count >0 and not is_stale?
      return true
    end
    $driver.manage.timeouts.implicit_wait = 5
    for locator in @locators
      by, value = locator.first
      @elements = $driver.find_elements(by, value, self.name)
      if @elements.length > 0
        @element = @elements[0]
        $driver.manage.timeouts.implicit_wait = 0
        return true
      else
        $driver.manage.timeouts.implicit_wait = 0
        return false
      end
    end
  end

  def find_elements(by, value, name=NIL)
    elements = element.find_elements(by, value, name)
    return elements
  end


  def find_element(by, value, name=NIL)
    element.find_element(by, value, name)
  end

  def class_variable_name_for(x)
    items = self.class.instance_variables.find do |var|
      x == self.class.instance_variable_get(var)
    end
    if items.nil?
      ancestors = self.class.ancestors
      ancestors = ancestors.select{|ancestor| ancestor < WebElement}
      ancestors.each{ |ancestor|
      items = ancestor.instance_variables.find do |var|
        x == ancestor.instance_variable_get(var)
      end
      if not items.nil?
        return items
      end
      }
    end
    return items
  end
end
