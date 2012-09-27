//Wrapped in an outer function to preserve global this
(function (root) { var amdExports; define(['jquery'], function () { (function () {

$(function () {

    module("bootstrap-transition")

      test("should be defined on jquery support object", function () {
        ok($.support.transition !== undefined, 'transition object is defined')
      })

      test("should provide an end object", function () {
        ok($.support.transition ? $.support.transition.end : true, 'end string is defined')
      })

})


}.call(root));
    return amdExports;
}); }(this));
