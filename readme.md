# Arrow Automation Framework #
The Arrow automation framework follows the industry standard page object design pattern, implemented using Selenium-WebDriver and several helper classes.  It is designed to simplify and  speed up the process of building reliable automated tests.  Tests are built using the Ruby Cucumber syntax, with feature files defining tests, step files defining reusable steps, and page objects defining how to manipulate a page.  Page Objects can be built using smaller page objects called sections, which represent a portion of a web page that may appear in more than one spot.  For example, the header and footer, and any modal windows should be defined as sections, which can be included in any other page object that needs them.  Any elements that are shared across multiple sections can be defined in modules and included in appropriate sections.

### Executing Tests: ###
Tests may be executed using the RubyMine interactive runner, or via command line.  The parallel_cucumber command may be used to execute tests concurrently.

When executing via command line profiles must be included for the desired size, environment, and functionality.  Profiles are defined and configured in the cucumber.yml file.  If no profiles are included the "default" profile will be used.  

```
#!bash
bundle exec cucumber features/ (to use default profile)

OR

bundle exec cucumber --p all --p uat --p smoke features/ 

OR

bundle exec parallel_cucumber --p all --p uat --p smoke features/ 

```

### Tags: ###
Tests must be tagged with the requirement, the test suite (smoke or full) and one or more size tags, specifying which responsive size the test supports.  

```
#!ruby

Feature: Google Site Verification

  @BKT_1322 @smoke @full @desktop
  Scenario: Arrow Home Page has Google Site Verification Meta Tag
    Given I visit the Arrow Home Page
    Then The Google Site Verification Meta tag is present
    And The Google Site Verification Meta tag has a Content attribute

```
Responsive Sizes:

```
#!ruby


@mobile = 327, 600
@phablet= 600, 900
@tablet = 720, 900
@desktop = 1025, 900
@wide = 1240, 1080
@max = full screen
```



### WebElement ###

The heart of the framework is the WebElement class.  This class wraps around and extends the WebDriver::WebElement class using the Decorator design pattern.  This class is intended to be instantiated ahead of time, and will only search on the given page when an action (such as a click) is performed.  It also caches the element found, and will only re-find the element if the DOM changes and the reference goes stale.

The WebElement API should match the Selenium::WebDriver::WebElement api, with some additional methods added to increase support and simplify complex tasks.

By default, the WebElement class will search for an element multiple times up until the global wait time.

A WebElement can be instantiated using any WebDriver locators in a hash.  Multiple locators may be given as an Array, and each will be tried in turn.

CSS Selector :  
```
#!ruby

@element = WebElement.new(“a.searchClass”)
```

Array of CSS Selectors : 
``` 
#!ruby

@element = WebElement.new(“a.searchClass”, “div.searchClass”)
```

WebDriver locator : 
```
#!ruby

@element = WebElement.new(:id=>”idOfElement”)
```

Array of WebDriver Hash :
```
#!ruby

 @element = WebElement.new([{:id=>”idOfElement”},{:class=>”classOfElement”}]
```


A root element may be included to limit scope inside of the root.

```
#!ruby


@parent = WebElement.new(“.className”)
@element = WebElement.new(“.otherClassName”,@parent)

```

A frame may be included as well
```
#!ruby


@parent = WebElement.new(“.className”)
@frame = WebElement.new(“iframe”)
@element = WebElement.new(“.className”,@parent, @frame)

```

WebElements support both single and multiple copies of an element on a page.
```
#!ruby



@element.click()
@element.first.click()
@element[3].click()
```


WebElements support filtering and standard ruby select syntax:

```
#!ruby

@element.select{|ele| ele.text == “some text”}.first.click
```


The WebElement class includes a number of verification methods that should be used instead of assertions whenever possible, as they will automatically re-try up to the standard timeout.

```
#!ruby

@element.verify_text(“some text”)
```


All WebElement methods include an optional timeout parameter. Which defaults to the global $element_timeout value.

```
#!ruby

@element.verify_value(“some value”, 120)
```


### Page Object: ###
The included PageObject class extends the WebElement class, so any elements that are defined within a page object will always be limited in scope to the root element of the page object.

When defining a page object, simply inherit from the included PageObject class, and define any elements needed.  A constructor should not be needed, but if a custom constructor is required you must call the super constructor.

WebElements can be defined as instance variables in the class header (outside the constructor) and will be copied into each instantiated object.

```
#!ruby


Class ExampleLoginPage < PageObject

@login_btn = WebElement.new(“.loginClass”)
@password_field = WebElement.new(“.password”)
@submit_btn = WebElement.new(“.submitBtn”)

Def login(username, password)
	@login_btn.send_keys username
	@password_field.send_keys password
	@submit_btn.click
End

```

By default all elements are available from outside the class, so attribute accessors are not necessary.  However, to fully support code completion from outside the class attr_accessor should be defined.

Elements are available as both instance references and as class references:

```
#!ruby


@page = ExampleLoginPage.new
@page.login_btn.click

 OR

ExampleLoginPage.login_btn.click
```


A locator may be included when instantiating a page object, and all WebElements will use the found element as a root for all searches:

```
#!ruby


page = ExampleLoginPage(“.loginPanel”)
Page.login_btn.click

```

Just as with WebElements, PageObjects support multiple matching elements on the page.

```
#!ruby


page = ExampleLoginPage(“.loginPanel”)
page[2].login_btn.click
page.select{|p|p.text.include? “Some text”}.first.login_btn.click

```

As PageObjects inherit from the WebElement class, all WebElement methods may be used with the root element.

```
#!ruby

page = ExampleLoginPage(“.loginPanel”)
page.verify_text(“some text”)

```


A page object may include a @page_url which will be navigated to using the open_page method, and returns an instantiated object

```
#!ruby


Class ExampleLoginPage < PageObject
@page_url = “http://www.login.com”

login_page = ExampleLoginPage.open_page

```

URL parameters may be included using the formatting of ${var_name} as a hash
```
#!ruby


Class ExamplePage < PageObject
@page_url = “http://www.login.com/?q=${query_param}

ExamplePage.open_page{:query_param=>”something”)
```


This would navigate to url http://www.login.com/?q=something