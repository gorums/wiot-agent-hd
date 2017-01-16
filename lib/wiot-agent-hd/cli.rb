require 'optparse'
require 'version'

module WiotAgentHd
  module CLI

    def self.parse_options(args=ARGV)
      options = {api_key: nil, space: nil, project: nil}

      parser = OptionParser.new do|opts|
        opts.banner = "Usage: wiot-agent-hd [options]"

        # Mandatory argument.

        opts.on('-a', '--api-key api_key', 'The API Key') do |api_key|
          options[:api_key] = api_key;
        end

        opts.on('-s', '--space space', 'The Space') do |space|
          options[:space] = space;
        end

        opts.on('-p', '--project project', 'The Project') do |project|
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
      puts opts
    end

  end
end