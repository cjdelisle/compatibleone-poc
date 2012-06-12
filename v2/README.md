Introduction
============

This directory contains the needed files for running the POC1 version 2.

In order to do so you need to:

* Have an account on an Openstack provider
* Have a bare Debian with COSACS image for building images using the COIPS image production service
* Build an image containing an XWiki installation and publish it on the Openstack provider

Steps
-----

* Install the ACCORDS platform by following the instructions available here: http://gitorious.ow2.org/ow2-compatibleone/accords-platform
* Clone this repository
* Start the ACCORDS platform using the `co-start` command
* Parse the COIPS manifest with `co-parser coips`. This will make the COIPS service available.
* Parse the MySQL manifest with `co-parser mysql`. This will trigger the building of an image that will contain the MySQL service ready to be used.
* Parse the XWiki manifest with `co-parser xwiki`.
* Ask the broker to provision the resources for deploying XWiki with `co-broker xwiki`. This will instantiate a MySQL server, an XWiki server, initialize the database and start the XWiki application.
* You can go on your Openstack provider dashboard in order to find out which IP has been allocated to the XWiki machine.
* Open a browser and go to http://IP_OF_THE_XWIKI_MACHINE:8080 you should see a functional XWiki up and running.
* Shut down the deployment with `co-command delete service/*`. This will destroy the MySQL and XWiki machine and deallocate all the resources.
* Shut down the ACCORDS platform with `co-stop`.

This POC has been tested on the ENovance platform where an image containing the XWiki server is also available.

You can have a look at the comments in the XML files to understand better how things work.

