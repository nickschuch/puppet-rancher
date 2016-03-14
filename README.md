Puppet - Rancher
================

[![Build Status](https://travis-ci.org/nickschuch/puppet-rancher.svg?branch=master)](https://travis-ci.org/nickschuch/puppet-rancher)

## Overview

A manifest with the goal of aiding setup of the Rancher projects.

https://github.com/rancherio/rancher

## Demo manifest

https://github.com/nickschuch/puppet-rancher-demo

## Usage

Management node

```
include rancher::management
```

Docker Node

```
rancher::node { 'example_node':
  management => '10.0.1.2',
  registration_token => '5074AF5E431560691B8F1457978400000:UZRKUYcESSHKpOTERoOPPor7QY',
}
```

## Requirements

We require the following Puppet modules.

* https://forge.puppetlabs.com/garethr/docker
* https://forge.puppetlabs.com/puppetlabs/stdlib

## Thanks

A big thanks goes out to the contributors of the required Puppet modules and also the Rancher team.
