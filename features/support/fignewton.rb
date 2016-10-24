module FigNewton
  module Missing
    def method_missing(*args, &block)
      read_file unless @yml
      m = args.first
      value = @yml[m.to_s]
      value = args[1] if value.nil?
      value = block.call(m.to_s) if value.nil? and block
      if value.nil?
        read_defaults
        m = args.first
        if $default_yml == false
          raise "Could not find key #{m} in #{ENV["FIG_NEWTON_FILE"]} and defaults.xml blank"
        end
        value = $default_yml[m.to_s]
        value = args[1] if value.nil?
        value = block.call(m.to_s) if value.nil? and block
        if value.nil?
          raise "Could not find key #{m} in #{ENV["FIG_NEWTON_FILE"]} or defaults.yml"
        end
      end
      value = FigNewton::Node.new(value) unless type_known? value
      value
    end


    def read_file
      if not ENV['FIG_NEWTON_FILE']
        raise "No FIG_NEWTON_FILE has been declared.  Check your cucumber.yml file and confirm an environment profile is added"
      end
      @yml = nil
      @yml = YAML.load_file "#{yml_directory}/#{ENV['FIG_NEWTON_FILE']}" if ENV['FIG_NEWTON_FILE']
      unless @yml
        hostname = Socket.gethostname
        hostfile = "#{yml_directory}/#{hostname}.yml"
        @yml = YAML.load_file hostfile if File.exist? hostfile
      end
      FigNewton.load('defaults.yml') if @yml.nil?
    end

    def read_defaults
      return $default_yml if not $default_yml.nil?
      dir = yml_directory
      $default_yml = YAML.load_file "#{dir}/defaults.yml"
    end

    def yml_directory
      return @yml_directory if @yml_directory
      return default_directory if self.respond_to? :default_directory
      nil
    end
  end
end