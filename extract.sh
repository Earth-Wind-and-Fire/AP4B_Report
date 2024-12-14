if ! test -f webHelpR2-all.zip; then
  echo "\033[31mError: webHelpR2-all.zip not found\033[0m"
  exit 1
fi

unzip -o webHelpR2-all.zip -d docs

echo "Extracted webHelpR2-all.zip to docs"