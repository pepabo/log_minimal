module LogMinimal
  module Methods
    [:fatal, :error, :warn, :info, :debug].each do |method|
      define_method "#{method}f" do |message|
        caller = "%s#%s:%s" % [self.class, caller(1)[0].scan(/in `(.*)'/)[0][0], caller(1)[0].scan(/:(\d+):/)[0][0]]
        logger.send(method, "%s\t%s" % [caller, message])
      end
    end
  end
end
