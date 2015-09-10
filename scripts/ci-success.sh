if [ $(git rev-parse --abbrev-ref HEAD) == 'develop' ] ; then
  git config --global user.email "not-monitored@dcycle.com"
  git config --global user.name "alberto56's CircleCI build"
  git checkout master
  git pull origin master
  CURRENTVERSION=$(head -n 1 copy-to-your-project-root/jekyll/dcycle/CHANGELOG.txt|sed s/Version\ //)
  NEWVERSION=$(expr $CURRENTVERSION + 1)
  git merge develop -m "Merging the develop branch because it passed at version $NEWVERSION"
  echo "Version $NEWVERSION" > copy-to-your-project-root/drupal7module/dcycle/CHANGELOG.txt
  echo "Version $NEWVERSION" > copy-to-your-project-root/drupal7site/dcycle/CHANGELOG.txt
  echo "Version $NEWVERSION" > copy-to-your-project-root/drupal8module/dcycle/CHANGELOG.txt
  echo "Version $NEWVERSION" > copy-to-your-project-root/drupal8site/dcycle/CHANGELOG.txt
  echo "Version $NEWVERSION" > copy-to-your-project-root/jekyll/dcycle/CHANGELOG.txt
  git commit -am "Set version number to $NEWVERSION"
  git tag "$NEWVERSION.0"
  git push origin master --tags

  git checkout gh-pages
  git pull origin gh-pages
  // See http://stackoverflow.com/questions/7573368
  sed -i"any_symbol" "s/^title:.*$/title: Dcyclebox $NEWVERSION/g" "_config.yml"
  git commit -am "Set version number to $NEWVERSION"
  git tag "documentation-$NEWVERSION.0"
  git push origin gh-pages --tags
fi
