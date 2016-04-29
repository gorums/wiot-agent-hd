module Wiot
  module Agent
    module Hd
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
end