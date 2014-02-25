require 'test/unit'
require 'fileutils'
require 'logger'
require 'log_minimal'

class LogMinimalDefaultTest < Test::Unit::TestCase
  include LogMinimal::Methods

  def test_default
      assert_equal $stderr, LogMinimal::Configuration.path
  end
end

class ActionController
  include LogMinimal::Methods

  def logger
    @logger ||= Logger.new(File.expand_path(File.dirname(__FILE__) + '/dummy.log'))
  end

  def show
    fatalf("foo")
  end
end

class ActionNoLoggerController
  include LogMinimal::Methods

  def show
    fatalf("foo")
  end
end


module LogMinimalTestCase
  def test_define
    [:fatalf, :errorf, :warnf, :infof, :debugf].each do |method|
      assert @controller.respond_to?(method)
    end
  end

  def test_logger
    @controller.show
    assert File.exist? log
    body = File.read(log)
    assert body.include?('show')
    assert body.include?('foo')
    FileUtils.rm log
  end

  def log
    File.expand_path(File.dirname(__FILE__) + '/dummy.log')
  end
end

class LogMinimalTest < Test::Unit::TestCase
  include LogMinimalTestCase

  def setup
    @controller = ActionController.new
  end
end

class LogMinimalNoLoggerTest < Test::Unit::TestCase
  include LogMinimalTestCase

  def setup
    LogMinimal::Configuration.path = log
    @controller = ActionNoLoggerController.new
  end
end
