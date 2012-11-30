require 'redis'
require 'active_support'

module Appsignal
  module Redis
    module Instrumentation

      private

      def process_with_appsignal_instrumentation(commands)
        ActiveSupport::Notifications.instrument(
          'query.redis', :query => commands) do
            process_without_appsignal_instrumentation(commands)
          end
      end

    end
  end
end

::Redis::Client.class_eval do
  include Appsignal::Redis::Instrumentation

  alias_method :process_without_appsignal_instrumentation, :process
  alias_method :process, :process_with_appsignal_instrumentation
end
