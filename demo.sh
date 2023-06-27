##
#
#  This automates the steps here:
#  https://docs.google.com/document/d/1a-vQiblbRroLkLmKopDTGWz_REIy8jM6aPlQttWp4jI/edit#heading=h.7slqnxz9frj7
#  Requirements:
#  Download the latest cli tools and make executable in your $PATH
#  https://github.com/getappmap/appmap-js/releases?q=appmap-preflight&expanded=true

git checkout main
rm -rfv .appmap/ tmp/appmap/
bundle exec rails test || true
sleep 5 # AppMap needs time to index maps
appmap archive
base_revision=$(git rev-parse HEAD)
echo $base_revision
rm -rf tmp/appmap 

git checkout demo/break-test 
bundle exec rails test || true
sleep 5 # AppMap needs time to index maps
appmap archive
head_revision=$(git rev-parse HEAD)
echo $head_revision
appmap restore --exact -r $base_revision --output-dir .appmap/change-report/$base_revision-$head_revision/base
appmap restore --exact -r $head_revision --output-dir .appmap/change-report/$base_revision-$head_revision/head 
appmap compare -b $base_revision -h $head_revision

cat .appmap/change-report/$base_revision-$head_revision/change-report.json | jq -r 'keys[]'

appmap compare-report --source-url file://$(pwd) .appmap/change-report/$base_revision-$head_revision

code .appmap/change-report/$base_revision-$head_revision/report.md