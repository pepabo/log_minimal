module LogMinimal
  class Configuration
    class << self
      attr_writer :path

      def path
        @path || raise
      end
    end
  end
end
