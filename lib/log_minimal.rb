require 'log_minimal/railtie'

module LogMinimal
  [:fatal, :error, :warn, :info, :debug].each do |method|
    define_method "#{method}f" do |message|
      user_id = if current_user
                  current_user.id
                else
                  session[:user_id]
                end

      time = Time.now.iso8601
      level = method.to_s.upcase
      caller = "%s#%s:%s" % [self.class, action_name, caller(1)[0].scan(/:(\d+):/)]
      msg = "%s\tuser_id=%s,session_id=%s" % [message, user_id, request.session_options[:id]]

      logger.send(method, "%s\t[%s]\t%s\t%s" % [time, level, caller, msg])
    end
  end
end
