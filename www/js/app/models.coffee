###
  models - This module contains the models and collections that make up
           the application. 

  Author: Michael Mulich
  (C) 2012 Rice University

  This software is subject to the provisions of the GNU Lesser General
  Public License Version 2.1 (LGPL).  See LICENSE.txt for details.
###

define ['backbone'], (Backbone) ->

  ###
    A module containing content on a specific topic or subject.
  ###
  class Module extends Backbone.Model
    defaults:
      title: 'Unknown'
      content: ''
      metadata: {}

  ###
    A collection of modules.
  ###
  class Collection extends Backbone.Collection
    model: Module

  exports =
    Module: Module
    Collection: Collection

  return exports
