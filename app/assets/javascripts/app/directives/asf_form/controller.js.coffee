"use strict"
angular.module('components')
.controller('AsfController', [
  '$scope','$attrs','$log'

  ($scope, $attrs, $log) ->

    $scope.close = $scope.$parent.close
    $scope.create = $scope.$parent.create
    console.log $scope.model
    $scope.model = {} unless $scope.model?

    return { model: $scope.model, form: window.Forms[$attrs.formName], scope : $scope, form_name: $attrs.name }
])