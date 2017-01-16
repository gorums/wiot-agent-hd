require_relative '../../lib/wiot-agent-hd/client'
require_relative '../../lib/wiot-agent-hd/metric'

module WiotAgentHd
  class Agent
    def initialize(api_key, space, project)
      @api_key = api_key
      @space = space
      @project = project
    end

    def start
      # collect metrics
      metric = WiotAgentHd::Metric.collect

      # send the metrics to the watchiot api
      client = WiotAgentHd::Client.new @api_key, @space, @project
      client.send metric
    end

  end
end