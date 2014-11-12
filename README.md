Puppet - Rancher
================

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

A big thanks goes out to the authors of both the contributors of the required Puppet modules and the Rancher team.
