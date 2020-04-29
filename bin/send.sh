python taggenerator.py
git add .
git commit -m "Initial commit"
git push .
git add .
git commit -m "Initial commit"
git push . -f
echo "y" | sh ./bin/deploy --user
