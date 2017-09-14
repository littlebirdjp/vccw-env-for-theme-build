# VCCW Environment for Theme Build

A starter kit for WordPress theme development with [VCCW](http://vccw.cc/).

[日本語版の説明はこちら](https://github.com/littlebirdjp/vccw-env-for-theme-build/blob/master/README-ja.md)

## Feature

This repository contains all functions below.

- WordPress
- [_s](http://underscores.me/)(Starter Theme)
- Theme Unit Test Datas
- Useful Plugins for Theme Development
- Multi Sites Setting(English and Japanese)

## Install

### 1. Install VirtualBox.  

https://www.virtualbox.org/

### 2. Install Vagrant.

http://www.vagrantup.com/

### 3. Install the vagrant-hostsupdater plugin. (Optional)

```
$ vagrant plugin install vagrant-hostsupdater
```

### 4. Download vagrant box

```
$ vagrant box add vccw-team/xenial64
```

### 5. Clone this repository and start a Vagrant environment.

```
git clone https://github.com/littlebirdjp/vccw-env-for-theme-build.git ~/prj/vccw-env-for-theme-build
cd ~/prj/vccw-env-for-theme-build
vagrant up
```

You can replace `/prj/` to any other name.

### 6. Visit WordPress on the Vagrant in your browser.

Visit [http://example.vccw/](http://example.vccw/) or [http://192.168.33.99/](http://192.168.33.99/)

## Usage

If there are any changes in `wordpress.sql` on remote repository, run the below commands.

```
vagrant ssh
wp db import /vagrant/wordpress.sql
exit
```

If you make any changes in WodrPress DB, run the below commands.

```
vagrant ssh
wp db export /vagrant/wordpress.sql
exit
```

## Customization

Unique configurations for a website are described on `site.yml`.
Change following variables if you like.

```
hostname: example.vccw
ip: 192.168.33.99
multisite: true
plugins:
  - wp-total-hacks
  - tinymce-templates
  - theme-check
  - wordpress-importer
  - jetpack
linked_clone: true
```

### Global configuration

VCCW has a series of global parameters which work with all virtual machines.
They can be specified on `~/.vccw/config.yml`.

### Customizable variables

See `provision/default.yml`.
