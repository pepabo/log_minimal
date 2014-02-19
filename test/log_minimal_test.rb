require 'test/unit'
require 'active_support/core_ext/time'
require 'fileutils'
require 'logger'
require 'log_minimal/methods'

class Request
  def session_options
    {id: :bar}
  end
end

class ActionController
  include LogMinimal::Methods

  def logger
    @logger ||= Logger.new(File.expand_path(File.dirname(__FILE__) + '/dummy.log'))
  end

  def request
    @request ||= Request.new
  end

  def session
    {user_id: :foo}
  end

  def action_name
    "dummy"
  end

  def current_user
    nil
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
    @controller.fatalf('foo')
    assert File.exist? File.expand_path(File.dirname(__FILE__) + '/dummy.log')
    FileUtils.rm File.expand_path(File.dirname(__FILE__) + '/dummy.log')
  end
end
