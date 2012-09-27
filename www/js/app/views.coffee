###
  views - This module contains the finite layout classes (views)
          and their controlling logic (e.g. button clicks). These views can
          be used to display a specific contextual layout.

  Author: Michael Mulich
  (C) 2012 Rice University

  This software is subject to the provisions of the GNU Lesser General
  Public License Version 2.1 (LGPL).  See LICENSE.txt for details.
###

define ['jquery', 'underscore', 'backbone', 'bootstrap'], ($, _, Backbone) ->

  class Casa extends Backbone.View
    el: $('body')
    initialize: ->
      _.bindAll(@)
      @render()
    render: ->
      # We would probably initialize a few viewlets for:
      # - recently edited modules
      # - activity on modules I manage (e.g. modified by, published state)
      # - etc.
      return @

  class EditModule extends Backbone.View
    el: $('body')
    initialize: ->
      _.bindAll(@)
      @render()
    render: ->
      # Render the Tools Viewlet into the navigation area.
      $('<li class="dropdown">
          <a id="tools-selection" class="dropdown-toggle" role="button">Tools<b class="caret"></b></a>
          <ul class="dropdown-menu" role="menu">
            <li><a tabindex="-1" href="#">Import</a></li>
            <li><a tabindex="-1" href="#">Preview ...</a></li>
            <li><a tabindex="-1" href="#">Publish</a></li>
            <li><a tabindex="-1" href="#">Sharing and Access Management</a></li>
            <li>
              <a tabindex="-1" href="#metadata-modal"
                 id="metadata-link"
                 data-toggle="modal"
                 data-target="#metadata-modal">Metadata</a>
            </li>
          </ul></li>')
        .appendTo('[role=hud] ul.nav')
        .find('.dropdown-toggle')
        .dropdown()
      # If the content isn't already on the page
      #   (from a previous module view state perhaps), then initialize
      #   the content into the page from the model
      # Initialize the Aloha Editor over the content
      # Populate the Module's help area with super helpful text!
      # Initialize the edit action buttons (e.g. save and cancel).
      return @


  ###
    Viewlets
  ###

  class ToolsActionsViewlet extends Backbone.View
    initialize: ->
      _.bindAll(@)
      if not @el?
        throw new Error("An element must be defined, otherwise we don't know where to put the contents of the viewlet.")
      @render()
    render: ->
      return @



  exports =
    Casa: Casa
    EditModule: EditModule
  return exports
