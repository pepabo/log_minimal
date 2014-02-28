module LogMinimal
  class Configuration
    class << self
      attr_writer :path

      def path
        @path || $stdout
      end
    end
  end
end
