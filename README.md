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
  management => 'localhost',
}
```

## Requirements

We require the following Puppet modules.

* https://forge.puppetlabs.com/garethr/docker
* https://forge.puppetlabs.com/puppetlabs/stdlib

## Thanks

A big thanks goes out to the contributors of the required Puppet modules and also the Rancher team.
