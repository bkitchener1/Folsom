require 'selenium-webdriver'
require 'fileutils'
require_relative 'webdriver'
require_relative 'dual_logger'
require_relative 'browser'
require_relative 'cucumber'

Before("@desktop") do
  $size = "desktop"
end

Before("@phablet") do
  $size = "phablet"
  end

Before("@wide") do
  $size = "wide"
end

Before("@max") do
  $size = "max"
end

Before("@mobile") do
  $size = "mobile"
end

Before("@tablet") do
  $size = "tablet"
end

# Commenting update_testrail for now

Before do |scenario|
  get_name(scenario)
  create_report_dir(scenario)
  start_logger scenario
  launch_browser
update_testrail(scenario)
end

def get_short_name(scenario)
  "#{$size}: #{scenario.name}"
end

def update_testrail(scenario)
  if $update_testrail
    api = TestRailIntegrator.new()
    path = scenario.source[0].location.to_s.split(":")[0]
    root = File.join($root_dir,"features/arrow_features")
    new_path = path.sub(File.absolute_path(root),"")
    new_path = new_path.gsub("arrow_features/","")
   toks = new_path.split('/')
   suite = api.get_suite_by_name(toks[1])
    suite_id = suite["id"]
    section = api.get_section_by_name(suite_id,toks[2])
   section_id = section["id"]
   for i in 3..(toks.count-1)
    section = api.get_section_by_name(suite_id,toks[i],section_id)
     section_id = section["id"]
   end
   description = ""
    steps = []
    scenario.instance_variable_get(:@test_case).test_steps.each{|step|
      steps.push({:content=>step.source[2].keyword + " " + step.source[2].name,:expected=>""})
     description += step.source[2].keyword + " " + step.source[2].name + "\r\n"
   }

    new_case = api.get_case_by_name(suite_id, section_id, get_short_name(scenario), description, steps)

    plan = api.get_default_plan
   plan = api.get_plan(plan["id"])
    @plan_id = plan["id"]
   @case_id = new_case["id"]
   @entry = api.get_case_entry(@plan_id, suite_id, @case_id)
   @run_id = @entry["runs"].first["id"]
   @entry_id = @entry["id"]
    #raise Cucumber::Core::Test::Result::Skipped, "Skipping Scenario"
  end
end

def get_name(scenario)
  if scenario.respond_to?(:title)
    name = scenario.source[0].name + "_" + scenario.name
  else
    name = scenario.source[0].name + "_" + scenario.scenario_outline.name
  end
  @name = name.tr('^a-zA-Z0-9', '_')
  @name.tr('_{2}', '_')

end

def launch_browser()
  @session = BrowserSession.new($browser, $environment, $os, $os_version, $browser_version, $device, @name)
  $driver = @session.launch_browser
end

def start_logger scenario
  $logger = DualLogger.new
  $logger.info "Starting Scenario '#{scenario.name}'"
end

def get_safe_name(name)
  name.tr('^a-zA-Z0-9', '_')[0..100]
end

def create_report_dir(scenario)
  if scenario.respond_to?(:title)
    name = scenario.name
  else
    name = scenario.scenario_outline.name
  end
  path_strings = scenario.instance_variable_get(:@test_case).source[0].location.to_s.split('/')
  folder = path_strings[path_strings.count-2]
  file = path_strings[-1]
  location = file.split('.')[0]
  name = get_safe_name name
  $report_dir = File.join($root_report_dir, folder)
  $report_dir = File.join($report_dir, location)
  $report_dir = File.join($report_dir, name)
  $report_dir = File.join($report_dir,"#{$browser}_#{$size}")
  FileUtils::mkdir_p $report_dir
end

def get_log_entries
  begin
    $driver.manage.logs.get('browser').each { |entry| $logger.info entry }
  rescue Exception
    puts "Could not get driver logs, driver may have crashed"
  end
end

After do |scenario|
  get_log_entries
  if(scenario.failed?)
    $logger.fatal "Scenario '#{@name}' Failed"
    $logger.fatal scenario.exception.message
    $logger.fatal scenario.exception.backtrace.join("\n")
    get_screenshot(scenario)
  else
    $logger.info "Scenario '#{@name}' Passed"
  end
  $driver.quit
  log_path = File.join $report_dir, "log.txt"
  #for some reason html report needs this hack
  log_path = log_path.gsub("reports/","")
  embed(log_path,"text/plain","log.txt")
  if ENV["BUILD_ID"]
    file_path = log_path.sub("reports/", "")
    $logger.error "url(repository/download/#{ENV["BUILD_ID"]}/#{ENV["BUILD_NUMBER"]}/#{file_path})"
  end
  update_testrail_status(scenario)
end

def update_testrail_status(scenario)
  if $update_testrail
    if scenario.failed?
      api = TestRailIntegrator.new()
      api.add_result_for_case(@run_id, @case_id, {:status_id=>5})
    elsif scenario.passed?
      api = TestRailIntegrator.new()
      api.add_result_for_case(@run_id, @case_id, {:status_id=>1})
    end
  end
end

def pre_accept_cookie_policy
  $driver.get $base_url
  $driver.cookies.add("privacyAcceptance", "true", :path => "/", :domain => hostname($base_url), :expires => Time.now+86400, :secure => false)
end


