module LogMinimal
  class Configuration
    class << self
      attr_writer :path

      def path
        @path || $stderr
      end
    end
  end
end
