###
  main - The applications main logic file that is triggered by js/app.js
         on page load. This sets up the application environment based on the
         current URL.

  Author: Michael Mulich
  (C) 2012 Rice University
 
  This software is subject to the provisions of the GNU Lesser General
  Public License Version 2.1 (LGPL).  See LICENSE.txt for details.
###

define ['backbone', 'underscore', 'app/views', 'app/models', 'domReady!'], (Backbone, _, views, models) ->

  ###
    A singleton for routing to our views based on path location.
  ###
  class AppRouter extends Backbone.Router
    initialize: ->
      _.bindAll(@)
      Backbone.history.start(pushState: true)
    routes:
      '': 'casa'
      'module/:id/edit': 'edit'
      'module/:id/edit/metadata': 'edit_metadata'
    ###
      Route handlers
    ###
    casa: ->
      console.log("Home again!")
    edit: (id) ->
      console.log("Time to write some copy for the #{id} module")
      module = new models.Module(title: 'Kanban Boards', content: '<h1>Kanban boards are cool<h1>')
      view = new views.EditModule(model: module)
    edit_metadata: (id) ->
      console.log("Edit some metadata. Woohoo!")
      # XXX Module information would be retrieved from somewhere.
      module = new models.Module(title: 'If I had a hammer', content: '<p>I would hammer every day and every night</p>')
      view = new views.EditModuleMetadata(model: module)

  window.app = new AppRouter()
