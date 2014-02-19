require 'active_support/core_ext/time'

module LogMinimal
  module Methods
    [:fatal, :error, :warn, :info, :debug].each do |method|
      define_method "#{method}f" do |message|
        time = Time.now.iso8601
        level = method.to_s.upcase
        caller = "%s#%s:%s" % [self.class, caller(1)[0].scan(/in `(.*)'/)[0][0], caller(1)[0].scan(/:(\d+):/)[0][0]]
        msg = message

        logger.send(method, "%s\t[%s]\t%s\t%s" % [time, level, caller, msg])
      end
    end
  end
end
