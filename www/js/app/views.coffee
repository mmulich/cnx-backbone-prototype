###
  views - This module contains the finite layout classes (views)
          and their controlling logic (e.g. button clicks). These views can
          be used to display a specific contextual layout.

  Author: Michael Mulich
  (C) 2012 Rice University

  This software is subject to the provisions of the GNU Lesser General
  Public License Version 2.1 (LGPL).  See LICENSE.txt for details.
###

define ['jquery', 'underscore', 'backbone', 'mustache', 'text!app/templates/tools-viewlet.html', 'text!app/templates/metadata-modal.html', 'bootstrap'], ($, _, Backbone, Mustache, tools_viewlet, metadata_modal) ->

  ###
    View - top level views that work on the body element.
  ###

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
      # $('<li class="dropdown">
      #     <a id="tools-selection" class="dropdown-toggle" role="button">Tools<b class="caret"></b></a>
      #     <ul class="dropdown-menu" role="menu">
      #       <li><a tabindex="-1" href="#">Import</a></li>
      #       <li><a tabindex="-1" href="#">Preview ...</a></li>
      #       <li><a tabindex="-1" href="#">Publish</a></li>
      #       <li><a tabindex="-1" href="#">Sharing and Access Management</a></li>
      #       <li>
      #         <a tabindex="-1" href="#metadata-modal"
      #            id="metadata-link"
      #            data-toggle="modal"
      #            data-target="#metadata-modal">Metadata</a>
      #       </li>
      #     </ul></li>')
      tools = new ToolsViewlet()
      tools.$el
        .appendTo('[role=hud] ul.nav')
        .find('.dropdown-toggle').dropdown()
      # If the content isn't already on the page
      #   (from a previous module view state, perhaps because we loaded
      #   the generic module view before the edit view?),
      #   then initialize the content into the page from the model
      $("<div class=\"row-fluid\">
           <div class=\"span12\">
             <textarea class=\"editable-content\" name=\"content\">#{@model.get('content')}</textarea>
           </div>
         </div>")
        .appendTo('[role=main]')
        # Initialize the Aloha Editor over the content
        ##.find('.editable-content').aloha()
      # Populate the Module's help area with super helpful text!
      # Initialize the edit action buttons (e.g. save and cancel).
      $('<div><button type="submit" name="save" class="btn btn-primary">Save</button><button type="button" name="cancel" class="btn">Cancel</button>')
        .appendTo('[role=main]')
      return @


  ###
    Viewlets - Small chunks of view code used by top level views.
  ###

  class ToolsViewlet extends Backbone.View
    initialize: ->
      _.bindAll(@)
      @render()
    events:
      'click .dropdown-menu li:eq(4)': 'metadata'
    render: ->
      @setElement($(tools_viewlet))
      return @
    metadata: ->
      console.log('metadata hit')
      view = new MetadataModal()
      view.show()

  ###
    ModalViews
  ###

  class MetadataModal extends Backbone.View
    initialize: ->
      _.bindAll(@)
      @render()
    events:
      'click .close': 'close'
    render: ->
      @setElement($(metadata_modal))
      return @
    show: ->
      $(document.body).append(@el)
      return @
    close: ->
      @remove()

  exports =
    Casa: Casa
    EditModule: EditModule
  return exports
