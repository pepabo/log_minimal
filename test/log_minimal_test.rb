require 'test/unit'
require 'fileutils'
require 'logger'
require 'log_minimal/methods'

class ActionController
  include LogMinimal::Methods

  def logger
    @logger ||= Logger.new(File.expand_path(File.dirname(__FILE__) + '/dummy.log'))
  end

  def show
    fatalf("foo")
  end
end

class LogMinimalTest < Test::Unit::TestCase
  def setup
    @controller = ActionController.new
  end

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
