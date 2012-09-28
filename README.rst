.. Michael Mulich, (C) 2012 Rice University

   This software is subject to the provisions of the GNU Lesser General
   Public License Version 2.1 (LGPL).  See LICENSE.txt for details.

Authoring Tools Client
======================

This web project has the following setup:

* www/ - the web assets for the project

 * index.html - the entry point into the app.
 * css/ - all css for the project.
 * img/ - all images for this project.
 * js/

  * app.js - the top-level config script used by index.html
  * app/ - the directory to store project-specific scripts.
  * lib/ - the directory to hold third party scripts.

For more information on the optimizer:
http://requirejs.org/docs/optimization.html

For more information on using requirejs:
http://requirejs.org/docs/api.html

JavaScript Third-party Library Notes
------------------------------------

The following is information about how the third-party library was
acquired and placed in this package.

:RequireJS: Manually added to the package at creation.
:jQuery: `volo add jquery`
:domReady: `volo add domReady`
:bootstrap: Downloaded directly from the Twitter Bootstrap project site
            ( http://twitter.github.com/bootstrap ). The archive
            contains three directories (`css`, `img` and `js`). The
            `css` and `img` directories were copied directly into this
            project's `www` directory. The `bootstrap.js` file was
            copied into `www/js/lib`. In all cases the minimized
            version of the file is used and the non-minimized version
            was discarded.
:UnderscoreJS: Downloaded directly from the underscoreJS project site
               ( http://underscorejs.org ).
:BackboneJS: Downloaded directly from the BackboneJS project site
             ( http://backbonejs.org ).
:text: Used a previously volo fetch version.
:mustache: Downloaded directly from the latest tag in the project
           ( https://github.com/janl/mustache.js ).

Legal Stuff
-----------

Michael Mulich, copyright (C) 2012 Rice University

This software is subject to the provisions of the GNU Lesser General
Public License Version 2.1 (LGPL).  See LICENSE.txt for details.
