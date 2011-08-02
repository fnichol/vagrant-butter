# coding: utf-8

require 'socket'

module Vagrant
  module Butter
    module Helpers
      ##
      # Returns the local IP address of the host running the vagrant VMs.
      #
      # Thanks to:
      # https://github.com/jedi4ever/veewee/blob/c75a5b175c5b8ac7e5aa3341e93493923d0c7af0/lib/veewee/session.rb#L622
      #
      # @return [String] the local IP address
      def local_ip
        @local_ip ||= begin
          # turn off reverse DNS resolution temporarily
          orig, Socket.do_not_reverse_lookup =
            Socket.do_not_reverse_lookup, true

          UDPSocket.open do |s|
            s.connect '64.233.187.99', 1
            s.addr.last
          end
        ensure
          Socket.do_not_reverse_lookup = orig
        end
      end
    end
  end
end
