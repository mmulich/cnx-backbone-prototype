// Generated by CoffeeScript 1.3.3

/*
  main - The applications main logic file that is triggered by js/app.js
         on page load. This sets up the application environment based on the
         current URL.

  Author: Michael Mulich
  (C) 2012 Rice University
 
  This software is subject to the provisions of the GNU Lesser General
  Public License Version 2.1 (LGPL).  See LICENSE.txt for details.
*/


(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['backbone', 'app/views', 'app/models', 'domReady!'], function(Backbone, views, models) {
    /*
        A singleton for routing to our views based on path location.
    */

    var AppRouter, app;
    AppRouter = (function(_super) {

      __extends(AppRouter, _super);

      function AppRouter() {
        return AppRouter.__super__.constructor.apply(this, arguments);
      }

      AppRouter.prototype.initialize = function() {
        return Backbone.history.start({
          pushState: true
        });
      };

      AppRouter.prototype.routes = {
        '': 'casa',
        'module/:id/edit': 'edit'
      };

      /*
            Route handlers
      */


      AppRouter.prototype.casa = function() {
        return console.log("Home again!");
      };

      AppRouter.prototype.edit = function(id) {
        var module, view;
        console.log("Time to write some copy for the " + id + " module");
        module = new models.Module({
          title: 'Kanban Boards',
          content: '<h1>Kanban boards are cool<h1>'
        });
        return view = new views.EditModule({
          model: module
        });
      };

      return AppRouter;

    })(Backbone.Router);
    return app = new AppRouter();
  });

}).call(this);
