require_relative '../../lib/wiot-agent-hd/client'
require_relative '../../lib/wiot-agent-hd/metric'

module WiotAgentHd
  class Agent
    def initialize(username, api_key, space, project)
      @username = username
      @api_key = api_key
      @space = space
      @project = project
    end

    def start
      # collect metrics
      payload = WiotAgentHd::Metric.collect

      # send the metrics to the watchiot api
      client = WiotAgentHd::Client.new @username, @api_key, @space, @project

      client.send payload
    end

  end
end