module Wiot
  module Hdmonitor
    class Metric
      def initialize
        @metric = {}
      end

      def add(key, value)
        @metric[key] = value
      end

      def metric
        @metric
      end
    end
  end
end