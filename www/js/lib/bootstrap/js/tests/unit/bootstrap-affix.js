//Wrapped in an outer function to preserve global this
(function (root) { var amdExports; define(['jquery'], function () { (function () {

$(function () {

    module("bootstrap-affix")

      test("should be defined on jquery object", function () {
        ok($(document.body).affix, 'affix method is defined')
      })

      test("should return element", function () {
        ok($(document.body).affix()[0] == document.body, 'document.body returned')
      })

      test("should exit early if element is not visible", function () {
        var $affix = $('<div style="display: none"></div>').affix()
        $affix.data('affix').checkPosition()
        ok(!$affix.hasClass('affix'), 'affix class was not added')
      })

})


}.call(root));
    return amdExports;
}); }(this));
