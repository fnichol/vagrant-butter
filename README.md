# <a name="title"></a> vagrant-butter

## <a name="installation"></a> Installation

Using Vagrant installed from package:

```sh
vagrant gem install vagrant-butter
```

Using Vagrant installed as a gem:

```sh
gem install vagrant-butter
```

## <a name="middleware"></a> Middleware

#### <a name="middleware-sethostname"></a> SetHostName

Sets a default host name based on the directory containing your
`Vagrantfile`. For example a project in `/tmp/vagrant/chef-testing`
will set the host name to `chef-testing.vagrantup.com`.

## <a name="helpers"></a> Helpers

### <a name="helpers-localip"></a> local_ip

#### Usage

```ruby
include Vagrant::Butter::Helpers
```

## <a name="patches"></a> Patches

### <a name="patches-suse"></a> SuSE Halting and Setting Hostname

#### Usage

```ruby
require 'vagrant/butter/systems/suse'
```

## <a name="development"></a> Development

* Source hosted at [GitHub][repo]
* Report issues/questions/feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make. For
example:

1. Fork the repo
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## <a name="authors"></a> Authors

Created and maintained by [Fletcher Nichol][fnichol] (<fnichol@nichol.ca>)

## <a name="license"></a> License

MIT (see [LICENSE][license])

[license]:      https://github.com/fnichol/vagrant-butter/blob/master/LICENSE
[fnichol]:      https://github.com/fnichol
[repo]:         https://github.com/fnichol/vagrant-butter
[issues]:       https://github.com/fnichol/vagrant-butter/issues
[contributors]: https://github.com/fnichol/vagrant-butter/contributors
