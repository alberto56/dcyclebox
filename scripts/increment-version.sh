if [ $(git rev-parse --abbrev-ref HEAD) == 'develop' ] ; then
  CURRENTVERSION=$(head -n 1 move-to-your-project-root/jekyll/dcycle/CHANGELOG.txt|sed s/Version\ //)
  NEWVERSION=$(expr $CURRENTVERSION + 1)
  echo "Version $NEWVERSION" > move-to-your-project-root/drupal7module/dcycle/CHANGELOG.txt
  echo "Version $NEWVERSION" > move-to-your-project-root/drupal7site/dcycle/CHANGELOG.txt
  echo "Version $NEWVERSION" > move-to-your-project-root/drupal8module/dcycle/CHANGELOG.txt
  echo "Version $NEWVERSION" > move-to-your-project-root/drupal8site/dcycle/CHANGELOG.txt
  echo "Version $NEWVERSION" > move-to-your-project-root/jekyll/dcycle/CHANGELOG.txt
fi
