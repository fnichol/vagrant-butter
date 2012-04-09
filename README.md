# vagrant-butter

## Install

Using Vagrant installed from package:

```sh
vagrant gem install vagrant-butter
```

Using Vagrant installed as a gem:

```sh
gem install vagrant-butter
```

## Middleware

#### SetHostName

Sets a default host name based on the directory containing your
`Vagrantfile`. For example a project in `/tmp/vagrant/chef-testing`
will set the host name to `chef-testing.vagrantup.com`.

## Helpers

### local_ip

#### Usage

```ruby
include Vagrant::Butter::Helpers
```

## Patches and Support

### SuSE Halting and Setting Hostname

#### Usage

```ruby
require 'vagrant/butter/systems/suse'
```
