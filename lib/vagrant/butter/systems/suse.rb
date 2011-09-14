module Vagrant
  module Systems
    class Suse
      def halt
        vm.env.ui.info I18n.t("vagrant.systems.linux.attempting_halt")
        vm.ssh.execute do |ssh|
          ssh.exec!("sudo /sbin/shutdown -hP now")
        end

        # Wait until the VM's state is actually powered off. If this doesn't
        # occur within a reasonable amount of time (15 seconds by default),
        # then simply return and allow Vagrant to kill the machine.
        count = 0
        while vm.vm.state != :powered_off
          count += 1

          return if count >= vm.env.config.linux.halt_timeout
          sleep vm.env.config.linux.halt_check_interval
        end
      end

      def change_host_name(name)
        vm.ssh.execute do |ssh|
          # Only do this if the hostname is not already set
          if !ssh.test?("sudo hostname | grep '#{name}'")
            ssh.exec!("sudo sed -i 's/^.*$/#{name}/' /etc/HOSTNAME")
            ssh.exec!("sudo hostname #{name}")
            ssh.exec!("sudo sed -i 's@^\\(127[.]0[.]0[.]1[[:space:]]\\+\\)@\\1#{name} #{name.split('.')[0]} @' /etc/hosts")
          end
        end
      end
    end
  end
end
