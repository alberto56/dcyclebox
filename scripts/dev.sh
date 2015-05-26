echo ""
echo "This script be used for site development. Once you run ./scripts/dev.sh, you"
echo "will have access on your Docker container via http to the contents of the _site"
echo "folder herein."
echo ""
echo "For production, please use ./scripts/prod.sh instead."
echo ""

./scripts/build-dev.sh

echo ""
echo "For now we are unable to build the site continually; please call"
echo "./scripts/jekyll-build every time you want to build your site."
echo ""
