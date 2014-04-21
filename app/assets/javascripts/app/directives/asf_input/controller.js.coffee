"use strict"
angular.module('components')
.controller('AsfInputController', [
  '$scope', '$attrs', '$log'

  ($scope, $attrs, $log) ->
    $scope.input_name = $attrs.name
])