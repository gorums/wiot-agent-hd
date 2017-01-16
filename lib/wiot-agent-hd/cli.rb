require 'optparse'

require_relative '../../lib/wiot-agent-hd/agent'

module WiotAgentHd
  module CLI

    def self.parse_options(args=ARGV)
      options = {apikey: nil, space: nil, project: nil}

      parser = OptionParser.new do|opts|
        opts.banner = "Usage: wiot-agent-hd [options]"

        opts.separator ''
        opts.separator 'Specific options:'

        # Mandatory argument.

        opts.on('--api-key APIKEY', 'the api key') do |apikey|
          options[:apikey] = apikey;
        end

        opts.on('--space SPACE', 'the space name') do |space|
          options[:space] = space;
        end

        opts.on('--project PROJECT', 'the project name') do |project|
          options[:project] = project;
        end

        opts.on_tail('-h', '--help', 'Displays Help') do
          puts opts
          exit
        end

        # Another typical switch to print the version.
        opts.on_tail('-v', '--version', 'Show version') do
          puts WiotAgentHd::VERSION
          exit
        end
      end

      parser.parse!(args)
      options
    end

    def self.start(opts)
      agent = WiotAgentHd::Agent.new opts[:apikey], opts[:space], opts[:project]
      agent.start
    end

  end
end