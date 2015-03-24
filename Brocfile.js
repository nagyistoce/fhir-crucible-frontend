/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');

var app = new EmberApp();

// Use `app.import` to add additional libraries to the generated
// output files.
//
// If you need to use different assets in different
// environments, specify an object as the first parameter. That
// object's keys should be the environment name and the values
// should be the asset to use in that environment.
//
// If the library that you are including contains AMD or ES6
// modules that you would like to import into your application
// please specify an object with the list of modules as keys
// along with the exports of each module as its value.
//
// Imported files get inserted into dist/assets/vendor.js

app.import(app.bowerDirectory + '/bootstrap-sass-official/assets/javascripts/bootstrap.js');
app.import(app.bowerDirectory + '/d3/d3.js');
app.import(app.bowerDirectory + '/d3-tip/index.js');

// --

var pickFiles = require('broccoli-static-compiler');
var mergeTrees = require('broccoli-merge-trees');
var gzipFiles = require('broccoli-gzip');

// generate a broccoli tree with the fonts from bootstrap copied into the desired location
var bootstrapFonts = pickFiles(app.bowerDirectory + '/bootstrap-sass-official/assets/fonts/bootstrap', {
  srcDir: '/',
  destDir: '/assets/bootstrap'
});

// generate a broccoli tree with the fonts from fontawesome copied into the desired location
var fontawesomeFonts = pickFiles(app.bowerDirectory + '/font-awesome/fonts', {
  srcDir: '/',
  destDir: '/assets/font-awesome'
});

// builds final tree that will end up in the output folder (dist/)
var finalTree = mergeTrees([app.toTree(), bootstrapFonts, fontawesomeFonts]);

// on production builds, generate a static gzipped file for the given extensions
if (app.env === 'production') {
  finalTree = gzipFiles(finalTree, {
    extensions: ['html', 'js', 'css', 'json', 'svg', 'txt', 'map'],
    keepUncompressed: true
  });
}

module.exports = finalTree;
