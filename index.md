---
layout: page
title: "Dcyclebox"
description: "A Docker-based workflow for Drupal and Jekyll development, testing, continuous integration and deployment."
header-img: "img/dcyclebox.png"
---

Downloads and issues
-----

[You can download the project, fork it, and consult the issue on GitHub](https://github.com/dcycleproject/dcyclebox).

Introduction
-----

This project attempts to provide an end-to-end Docker workflow for Drupal or Jekyll projects. You might want to consider Dcyclebox if:

 * you are a Drupal module developer and you are having issues with MAMP;
 * it takes you several hours to set up a new developer's environment using outdated wiki documentation;
 * you are developing a Drupal site which is under git;
 * your continuous integration environment is slightly different from your development environment, and this causes issues.
 * you are interested in how Docker might be used for deploying production sites.

The philosophy
-----

Docker is a container management tool; think of containers as very efficient virtual machines which are fast and cheap to set up and destroy.

This project uses Docker to define, within your project's Git repo, what is required for your project to work: which version of PHP, which operating system, which tools or libraries, etc. This is meant to avoid problems caused by slightly different environments.

This project aims to provide the simplest possible use of Docker. Therefore, a single container might be used instead of several; and the ideal Docker architecture might not be followed.

This project is for users who want a simple introduction to Docker, that works with their existing projects. It does not attempt to be complete or perfect, or even secure.

Step 1: prerequisites
-----

To use this project, whatever you are developing, whether it be a Drupal 8 site, a Drupal 8 module, a Drupal 7 module, a Jekyll site, must be tracked by the Git version control system.

Then, whether you are developing, testing, doing continuous integration, or deploying to production, your environments must have Docker installed. The recommended way to use this project is to set up a CoreOS virtual machine (VM).

To set up a CoreOS VM on a Mac, follow the Dcycle U. lesson [Virtualization, CoreOS, and the command line](http://u.dcycle.com/2015/03/29/01-command-line/).

To set up CoreOS in the cloud, find a cloud provider listed on [the CoreOS website](https://coreos.com/docs/), open an account with one of them, and create your CoreOS machine.

**Once you can log into your CoreOS VM on the command line, move to step 2.**

Step 2: copy the required files to your project root
-----

This project contains a folder called `copy-to-your-project`, with several subfolders:

 * `drupal-8-module-development`
 * `drupal-7-site-development`
 * ...

Find the project type that best suits what you are working on, and copy the contents of that folder to the root of your project.

**For example, if you are developing a Drupal 8 module, copy the contents of `drupal-8-module-development` to the root of your module**.

