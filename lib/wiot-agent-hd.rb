require 'wiot-agent-hd/version'
require 'wiot-agent-hd/cli'

require 'sys/filesystem'
require 'wiot-sdk'

include Sys

module WiotAgentHd
  def self.monitor
    p 'Host name: ' + server_name
    Filesystem.mounts.each { |mount|
      next unless valid_mount_type mount

      stat = Filesystem.stat(mount.mount_point)

      WiotSdk.init_json
      metric = Metric.new
      metric.add 'os', RbConfig::CONFIG['host_os']
      metric.add 'server_name', server_name
      metric.add 'partition', mount.name
      metric.add 'mount_point', mount.mount_point
      metric.add 'type', mount.mount_type
      metric.add 'total_space', stat.bytes_total.to_gb.to_s + unit
      metric.add 'free_space', stat.bytes_free.to_gb.to_s + unit
      metric.add 'unit', unit
      metric.add 'use_percet_space', stat.percent_used.round(2).to_s

      send metric # catch exceptions and logger
    }
  end

  private

  def self.valid_mount_type(mount)
    mount.mount_type == 'ext4'
  end

  def self.unit
    'GB'
  end

  def self.server_name
    ip = Socket.ip_address_list.find { |ai| ai.ipv4? && !ai.ipv4_loopback? }.ip_address
    Socket.gethostname + '-' + ip
  end

  def self.project
    'hardware-monitor/hd'
  end

  def self.api
    'hardware-monitor/hd'
  end
end
