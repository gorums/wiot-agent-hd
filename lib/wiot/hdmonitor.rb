require 'wiot/hdmonitor/version'

require 'sys/filesystem'
include Sys

module Wiot
  module Hdmonitor
    def self.monitor
      p 'OS ' + RbConfig::CONFIG['host_os']
      Filesystem.mounts.each { |mount|
        next unless valid_mount_type mount

        stat = Filesystem.stat(mount.mount_point)

        p 'Partition name ' + mount.name
        p 'Point ' + mount.mount_point
        p 'Type ' + mount.mount_type
        p 'Total ' + stat.bytes_total.to_gb.to_s + 'GB'
        p 'Free '  + stat.bytes_free.to_gb.to_s + 'GB'
        p 'Used '  + (stat.bytes_total - stat.bytes_free).to_gb.to_s + 'GB'
        p 'Used %' + stat.percent_used.round(2).to_s
        p 'Free %' + (100 - stat.percent_used).round(2).to_s
      }
    end

    private

    def self.valid_mount_type(mount)
      mount.mount_type == 'ext4'
    end
  end
end
