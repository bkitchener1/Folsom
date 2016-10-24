#require '../support/testrail'
require 'timeout'
class TestRailIntegrator
  def initialize()
    @project_id = $testrail_project_id
    @client = TestRail::APIClient.new('https://arrowdigital.testrail.com')
    @client.user = 'b.kitchener@aspenware.com'
    @client.password = 'Qubit123!'
  end

  def get_runs
    @client.send_get("get_runs/#{@project_id}")
  end

  def get_run run_id
    @client.send_get("get_run/#{run_id}")
  end

  def get_tests run_id
    @client.send_get("get_tests/#{run_id}")
  end

  def get_test test_id
    @client.send_get("get_test/#{test_id}")
  end

  def get_latest_run
    runs = get_runs
    runs.last
  end

  def get_case num
    @client.send_get("get_case/#{num}")
  end

  def get_cases suite, section
    @client.send_get("get_cases/#{@project_id}&suite_id=#{suite}&section_id=#{section}")
  end

  def get_project num
    @client.send_get("get_project/#{num}")
  end

  def add_case section_id, data
    @client.send_post("add_case/#{section_id}", data)
  end

  def get_sections suite_id
    @client.send_get("/get_sections/#{@project_id}&suite_id=#{suite_id}")
  end

  def add_section data
    @client.send_post("add_section/#{@project_id}", data)
  end

  def add_suite name, description
    @client.send_post("add_suite/#{@project_id}", {:name => name, :description => description})
  end

   def get_plan plan_id
    @client.send_get("get_plan/#{plan_id}")
  end

  def get_plans
    @client.send_get("get_plans/#{@project_id}")
  end

  def get_default_plan
    fh = File.open("plan.lock", File::CREAT)
    fh.flock(File::LOCK_EX)
    @plan = get_plans.select{|plan|plan["name"]==$testrail_plan_name}.first
    if @plan.nil?
      @plan = add_plan($testrail_plan_name,"Generated #{Time.now}")
    end
    fh.flock(File::LOCK_UN)
    File.delete("plan.lock") if File.exists?("plan.lock")
    return @plan
  end

  def update_plan_entry(plan_id, entry_id, data)
    @client.send_post("update_plan_entry/#{plan_id}/#{entry_id}", data)
  end

  def add_case_to_entry(plan_id, entry_id, case_id, cases)
    cases.push(case_id) if not cases.include? case_id
    update_plan_entry(plan_id, entry_id, {:case_ids=>cases})
  end

  def add_plan(name, description)
    @client.send_post("/add_plan/#{@project_id}",{:name=>name, :desription=>description})
  end

  def get_plan_entry(plan_id, entry_id)
    @client.send_get("get_plan_entry/#{plan_id}/#{entry_id}")
  end

  def add_plan_entry(plan_id, data)
    @client.send_post("add_plan_entry/#{plan_id}", data)
  end

  def add_result_for_case(run_id, case_id, data)
    @client.send_post("add_result_for_case/#{run_id}/#{case_id}", data)
  end

  def get_subfolders path
    folders = Dir.entries(path)
    folders.delete(".")
    folders.delete("..")
    folders.delete_if{|folder|folder.include?(".feature")}
    folders
  end

  def get_suites
    @client.send_get("get_suites/#{@project_id}")
  end

  def get_suite_by_name name
    fh = File.open("suite.lock", File::CREAT)
    fh.flock(File::LOCK_EX)
    suites = get_suites
    suites = suites.select{|suite|suite["name"].include? name}
    @suite = suites.first
    if @suite.nil?
      @suite = add_suite(name,"")
    end
    fh.flock(File::LOCK_UN)
    File.delete("suite.lock")  if File.exists?("suite.lock")
    return @suite
  end

  def get_section_by_name(suite_id, name, parent_id="")
    fh = File.open("section.lock", File::CREAT)
    fh.flock(File::LOCK_EX)
    @section = get_sections(suite_id).select{|suite|suite["name"].include? name}.first
    if @section.nil?
      @section = add_section({:name=>name,:suite_id=>suite_id,:parent_id=>parent_id})
    end
    fh.flock(File::LOCK_UN)
    File.delete("section.lock") if File.exists?("section.lock")
    return @section
  end

  def get_case_by_name(suite_id, section_id, name, description,custom_steps)
    cases = get_cases(suite_id, section_id)
    cases = cases.select{|cas|cas["title"].include? name}
    if cases.first.nil?
      return add_case(section_id,{:title=>name,:description=>description, :custom_preconds=>description,:custom_steps_separated=>custom_steps})
    end
    return cases.first
  end

  def delete_all_suites
    suites = get_suites
    suites.each{|suite|
      id = suite["id"]
      delete_suite id
    }
  end

  def delete_suite id
    @client.send_post("delete_suite/#{id}",{})
  end

  def get_root_folder
    features = File.join($root_dir,"features")
    arrow_features = File.join(features,"arrow_features")
  end

  def add_run(suite_id, include_all, case_ids=[])
    @client.send_post("add_run/#{@project_id}",{:suite_id=>suite_id, :include_all=>include_all, :case_ids=>case_ids})
  end

  def update_run run_id, data
    @client.send_post("update_run/#{run_id}",data)
  end

  def get_case_entry(plan_id, suite_id, case_id)
    fh = File.open("case_entry.lock", File::CREAT)
    fh.flock(File::LOCK_EX)
    plan = get_plan(plan_id)
    @entry = plan["entries"].select{|entry|entry["suite_id"] == suite_id}.first
    if @entry.nil?
      @entry = add_plan_entry(plan_id, {:suite_id=>suite_id, :include_all=>false, :case_ids=>[case_id]})
    else
      run_id = plan["entries"].first["runs"].first["id"]
      tests = get_tests(run_id)
      cases = []
      tests.each{|test|cases.push(test["case_id"])}
      @entry = add_case_to_entry(plan_id, @entry["id"], case_id, cases)
    end
    fh.flock(File::LOCK_UN)
    File.delete("case_entry.lock") if File.exists?("case_entry.lock")
    return @entry
  end

end