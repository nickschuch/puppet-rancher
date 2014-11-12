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
