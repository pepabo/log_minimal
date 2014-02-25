
require "log_minimal"

require "test/unit"

class TestSimpleCase < Test::Unit::TestCase
	def test_simple
		assert_equal LogMinimal::Configuration.path, $stderr
	end
end

