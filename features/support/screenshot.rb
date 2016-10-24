# SCREEN SHOT NAMING #-------------------------------------------------------------------------------
def get_name(scenario)
  if scenario.respond_to?(:title)
    name = scenario.name
  else
    name = scenario.scenario_outline.name
  end
  trimmed_name = name.tr('^a-zA-Z0-9', '_') + '.png'
  trimmed_name.tr('_{2}', '_')
end

# TAKE SCREEN SHOT#-------------------------------------------------------------------------------
def get_screenshot(scenario)
  if $screenshot == 'false'
    true
  else
    begin
      name = get_name(scenario)
      full_path = File.join($report_dir, name)
      $driver.save_screenshot full_path
      embed(full_path, "image/png")
      $logger.error full_path
      if ENV["BUILD_ID"]
        full_path = full_path.gsub("reports/","")
        $logger.error "url(repository/download/#{ENV["BUILD_ID"]}/#{ENV["BUILD_NUMBER"]}/#{full_path})"
      end

    rescue NoMethodError => error
      $stderr.puts "" "
      ********************
      $driver does not reference a valid object.
      #{error.message},
      class: #{error.class}
      @browser: #{$driver.inspect}
      ********************
" ""
    end
  end

end