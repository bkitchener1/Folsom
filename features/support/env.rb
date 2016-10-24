require 'cucumber'
require 'data_magic'
require 'fig_newton'
require 'net/http'
require 'openssl'
require 'json'
require 'rest-client'
require 'uri'
require 'rspec'
require 'rspec/expectations'
require 'money'
require 'require_all'
require_relative '../support/String'
require_relative 'random'
require_relative 'fignewton'
require_relative 'cucumber'
require_relative 'page_object'
require_relative 'web_element'
require_relative 'url_helper'
require_relative 'junit_formatter'

# ENV #-------------------------------------------------------------------------------

#browser string aka 'chrome' or 'firefox'
$browser                        = ENV['BROWSER'] || 'chrome'
#environment: localhost, GRID HUB IP
$environment                    = ENV['ENVIRONMENT'] || 'localhost'
#languge shortcut
$language                           = ENV['LANGUAGE'] || 'en'

#base environment URL for arrow.com
$base_url                       = if (ENV['BASE_URL'].to_s.strip.length == 0)
                                    "#{FigNewton.base_url}/#{$language}"
                                  else
                                    "#{ENV['BASE_URL']}/#{$language}"
                                  end
$update_testrail                = ENV['UPDATE_TESTRAIL'] || false
$testrail_project_id            = ENV['TESTRAIL_PROJECT_ID'] || 2
$testrail_plan_name             = ENV['TESTRAIL_PLAN_NAME']  || "TEST"
#base url for the cart app (cart.arrow.com)
$cart_url                       = ENV['CART_URL'] || FigNewton.cart_url
#all size configurations
$sizes = ['@mobile','@tablet','@desktop','@phablet','@wide','@max']
#this tests size
$size                           = ENV['BROWSER_SIZE'] || 'max'
#automatic highlighting of elements after find
$highlight                      = (ENV['HIGHLIGHT'] || "True").is_truthy
#the report directory
$root_report_dir                = ENV['REPORT_DIR'] || 'reports'
#root code directory
$root_dir                       = File.absolute_path(".")
#default element wait time
$element_timeout                = FigNewton.element_timeout || 30
#default webdriver page load waiting time
$page_timeout                   = FigNewton.page_timeout || 30


# SauceLabs Desired Capabilities
$device                         = ENV['DEVICE'] || ''
$browser_version                = ENV['BROWSER_VERSION'] || 'any'
$os                             = ENV['OS'] || 'any'
$os_version                     = ENV['OS_VERSION'] || 'any'

#creating the reports directory
FileUtils.mkdir_p($root_report_dir)

#clearing the reports directory
FileUtils.rm_rf(Dir.glob("#{$root_report_dir}/*"))

#allowing use of both should and expect assertions
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
    require_relative 'cucumber'
  end
end

require_all 'features/api'
require_all 'features/modules'
require_all 'features/sections'
require_all 'features/page_objects'
