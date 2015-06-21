The Dcyclebox Drupal7module image
=====

Please use or modify this code only if you plan to participate in Dcycelbox development. If you want to use Dcyclebox containers in your own projects (for example Drupal sites or projects), please see [box.dcycle.com](http://box.dcycle.com).

Updating this file
-----

Only perform this if you are working on the Dcyclebox infrastructure, not if you are just using it:

 * Make sure you have an account on Docker.com, and change <account> for your own account name in the following instructions.
 * `Docker build .`
 * This will give you an image hash
 * docker tag <image hash> <account>/dcyclebox-drupal7module:latest
 * docker push <account>/dcyclebox-drupal7module
 * you
