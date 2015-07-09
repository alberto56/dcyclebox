Depending on what you are developing:

 * Locate the appropriate subfolder in this folder. (For example, if you are developing a Jekyll site, use the "Jekyll" folder; if you are developing a Drupal 8 module, use the "drupal8module" folder"; if you are developing a Drupal 7 website (Git root == Drupal root, with a [site deployment module](http://dcycleproject.org/blog/44/what-site-deployment-module)), use "drupal7site", etc.)
 * Copy the entire contents of the subfolder you located to your project root.
 * In a CoreOS box (Use [this Vagrant VM](https://github.com/dcycleproject/coreos-vagrant) if you are on a Mac), type `./dcycle/deploy.sh` or `./dcycle/deploy.sh -p1234` if you want port 1234 rather than port 80.
 * Access your site via `http://172.17.8.101` or `http://172.17.8.101:1234` if your port is 1234.

Dcyclebox is currently for development use; data persistence [is not yet supported](https://github.com/dcycleproject/dcyclebox/issues/2).
