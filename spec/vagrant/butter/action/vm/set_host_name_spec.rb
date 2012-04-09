# -*- encoding: utf-8 -*-
require 'minitest/autorun'
require 'mocha'
require 'vagrant'
require 'vagrant/butter/action/vm/set_host_name'

describe Vagrant::Butter::Action::VM::SetHostName do
  include Vagrant::TestHelpers

  let(:middleware)  { Vagrant::Butter::Action::VM::SetHostName.new(@app, @env) }
  let(:host_name)   { @env["vm"].config.vm.host_name }

  def stub_root_path!(path)
    @env[:vm].env.stubs(:root_path).returns(Pathname.new(path))
  end

  before do
    @app, @env = action_env
  end

  it "invokes the next middleware" do
    @app.expects(:call).with(@env).once

    middleware.call(@env)
  end

  it "sets host name to the current working directory name" do
    stub_root_path! "/tmp/vagrant/myhost"
    middleware.call(@env)

    host_name.must_equal "myhost.vagrantup.com"
  end

  it "replaces underscores with dashes" do
    stub_root_path! "/vagrants/the_dude_app_1"
    middleware.call(@env)

    host_name.must_equal "the-dude-app-1.vagrantup.com"
  end

  it "uses the host name from a Vagrantfile over default" do
    stub_root_path! "/tmp/vagrant/fuzzypants"
    @env[:vm].config.vm.host_name = "buzzkill.example.com"
    middleware.call(@env)

    host_name.must_equal "buzzkill.example.com"
  end
end
