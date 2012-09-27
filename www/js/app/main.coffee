###
  main - The applications main logic file that is triggered by js/app.js
         on page load. This sets up the application environment based on the
         current URL.

  Author: Michael Mulich
  (C) 2012 Rice University
 
  This software is subject to the provisions of the GNU Lesser General
  Public License Version 2.1 (LGPL).  See LICENSE.txt for details.
###

define ['backbone', 'app/views', 'app/models', 'domReady!'], (Backbone, views, models) ->

  ###
    A singleton for routing to our views based on path location.
  ###
  class AppRouter extends Backbone.Router
    initialize: ->
      Backbone.history.start(pushState: true)
    routes:
      '': 'casa'
      'module/:id/edit': 'edit'
    ###
      Route handlers
    ###
    casa: ->
      console.log("Home again!")
    edit: (id) ->
      console.log("Time to write some copy for the #{id} module")
      module = new models.Module(title: 'Kanban Boards')
      view = new views.EditModule(model: module)

  app = new AppRouter()
