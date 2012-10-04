// Generated by CoffeeScript 1.3.3

/*
  views - This module contains the finite layout classes (views)
          and their controlling logic (e.g. button clicks). These views can
          be used to display a specific contextual layout.

  Author: Michael Mulich
  (C) 2012 Rice University

  This software is subject to the provisions of the GNU Lesser General
  Public License Version 2.1 (LGPL).  See LICENSE.txt for details.
*/


(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'underscore', 'backbone', 'mustache', 'text!app/templates/tools-viewlet.html', 'text!app/templates/metadata-modal.html', 'bootstrap'], function($, _, Backbone, Mustache, tools_viewlet, metadata_modal) {
    /*
        View - top level views that work on the body element.
    */

    var Casa, EditModule, MetadataModal, ToolsViewlet, exports;
    Casa = (function(_super) {

      __extends(Casa, _super);

      function Casa() {
        return Casa.__super__.constructor.apply(this, arguments);
      }

      Casa.prototype.el = $('body');

      Casa.prototype.initialize = function() {
        _.bindAll(this);
        return this.render();
      };

      Casa.prototype.render = function() {
        return this;
      };

      return Casa;

    })(Backbone.View);
    EditModule = (function(_super) {

      __extends(EditModule, _super);

      function EditModule() {
        return EditModule.__super__.constructor.apply(this, arguments);
      }

      EditModule.prototype.el = $('body');

      EditModule.prototype.initialize = function() {
        _.bindAll(this);
        return this.render();
      };

      EditModule.prototype.render = function() {
        var tools;
        tools = new ToolsViewlet();
        tools.$el.appendTo('[role=hud] ul.nav').find('.dropdown-toggle').dropdown();
        $("<div class=\"row-fluid\">           <div class=\"span12\">             <textarea class=\"editable-content\" name=\"content\">" + (this.model.get('content')) + "</textarea>           </div>         </div>").appendTo('[role=main]');
        $('<div><button type="submit" name="save" class="btn btn-primary">Save</button><button type="button" name="cancel" class="btn">Cancel</button>').appendTo('[role=main]');
        return this;
      };

      return EditModule;

    })(Backbone.View);
    /*
        Viewlets - Small chunks of view code used by top level views.
    */

    ToolsViewlet = (function(_super) {

      __extends(ToolsViewlet, _super);

      function ToolsViewlet() {
        return ToolsViewlet.__super__.constructor.apply(this, arguments);
      }

      ToolsViewlet.prototype.initialize = function() {
        _.bindAll(this);
        return this.render();
      };

      ToolsViewlet.prototype.events = {
        'click .dropdown-menu li:eq(4)': 'metadata'
      };

      ToolsViewlet.prototype.render = function() {
        this.setElement($(tools_viewlet));
        return this;
      };

      ToolsViewlet.prototype.metadata = function() {
        /*
                XXX Ideally we also want to push state
                    (e.g. /module/d2a5c1/edit/metadata) and have the router handle
                    the view initialization. This gets tricky because we want the
                    edit view to render first. I think what we are looking for is a
                    SubRouter implementation, which does not exist in the base
                    Backbone library. This would also allow us to pass the model into
                    subviews (aka modals) without looking up the object each time.
        */

        var view;
        view = new MetadataModal();
        return view.show();
      };

      return ToolsViewlet;

    })(Backbone.View);
    /*
        ModalViews
    */

    MetadataModal = (function(_super) {

      __extends(MetadataModal, _super);

      function MetadataModal() {
        return MetadataModal.__super__.constructor.apply(this, arguments);
      }

      MetadataModal.prototype.initialize = function() {
        _.bindAll(this);
        return this.render();
      };

      MetadataModal.prototype.events = {
        'click .close': 'close'
      };

      MetadataModal.prototype.render = function() {
        this.setElement($(metadata_modal));
        this.$el.appendTo(document.body).modal({
          show: false
        });
        return this;
      };

      MetadataModal.prototype.show = function() {
        this.$el.modal('toggle');
        return this;
      };

      MetadataModal.prototype.close = function() {
        return this.remove();
      };

      return MetadataModal;

    })(Backbone.View);
    exports = {
      Casa: Casa,
      EditModule: EditModule
    };
    return exports;
  });

}).call(this);