require 'wiot-sdk'

module WiotAgentHd
  class Client
    def initialize(api_key, space, project)
      @client = WiotSdk.init api_key, space, project
    end

    def send(metrics)
      @client.send metrics
    end
  end
end