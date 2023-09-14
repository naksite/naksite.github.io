rm -rf exampleSite/resources/_gen/*
rm -rf exampleSite/public/*
rm -rf resources/_gen/*
rm -rf public/*

hugo server --navigateToChanged --noHTTPCache --disableFastRender -D
