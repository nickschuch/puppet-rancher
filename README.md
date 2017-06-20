Puppet - Rancher
================

[![Build Status](https://travis-ci.org/andrewpsp/puppet-rancher.svg?branch=master)](https://travis-ci.org/andrewpsp/puppet-rancher)

## Overview

A manifest with the goal of aiding setup of the Rancher projects.

https://github.com/rancherio/rancher

## Puppet Forge

https://forge.puppetlabs.com/nick/rancher

## Demo manifest

https://github.com/nickschuch/puppet-rancher-demo

## Usage

Management node

```puppet
include rancher::management
```

Docker Node

```puppet
rancher::node { 'example_node':
  management         => '10.0.1.2',
  registration_token => '5074AF5E431560691B8F1457978400000:UZRKUYcESSHKpOTERoOPPor7QY',
}
```

To add a Docker Node on the Management server

```puppet
rancher::node { 'manager_node':
  management         => '10.0.1.2',
  registration_token => '5074AF5E431560691B8F1457978400000:UZRKUYcESSHKpOTERoOPPor7QY',
  docker_env         => ["CATTLE_AGENT_IP=${::ipaddress}"]
}
```

## Requirements

We require the following Puppet modules.

* https://forge.puppetlabs.com/garethr/docker
* https://forge.puppetlabs.com/puppetlabs/stdlib

## Testing

To run the tests:

```
gem install bundler
bundle install
bundle exec rake test
export BEAKER_destroy=no
bundle exec rspec spec/acceptance
```

## Thanks

A big thanks goes out to the contributors of the required Puppet modules and also the Rancher team.
