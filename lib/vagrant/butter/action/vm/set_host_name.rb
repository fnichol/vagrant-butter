# -*- encoding: utf-8 -*-

module Vagrant
  module Butter
    module Action
      module VM
        class SetHostName
          def initialize(app, env)
            @app = app
          end

          def call(env)
            if env[:vm].config.vm.host_name.nil?
              host = File.basename(env[:vm].env.root_path).gsub(/_/, '-')
              env[:vm].config.vm.host_name = "#{host}.vagrantup.com"
            end

            @app.call(env)
          end
        end
      end
    end
  end
end

Vagrant.actions[:start].
  insert_before(Vagrant::Action::VM::HostName, Vagrant::Butter::Action::VM::SetHostName)
