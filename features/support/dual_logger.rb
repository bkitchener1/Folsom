require 'logger'

class DualLogger
  def initialize()
    $log_path = File.join($report_dir,"log.txt")
    @logger = Logger.new($log_path)
    @logger.formatter = proc do |severity, datetime, progname, msg|
      date_format = datetime.strftime("%Y-%m-%d %H:%M:%S")
      if severity == "INFO" or severity == "WARN"
        "[#{date_format}] #{severity}: #{msg}\n"
      else
        "[#{date_format}] #{severity}: #{msg}\n"
      end
    end
    puts $log_path
  end

  def info msg
    @logger.info msg
    puts msg
  end

  def debug msg
    @logger.debug msg
    puts msg
  end

  def error msg
    @logger.error msg
    puts msg
  end

  def fatal msg
    @logger.fatal msg
    puts msg
  end

  def screenshot msg
    puts msg
  end

end