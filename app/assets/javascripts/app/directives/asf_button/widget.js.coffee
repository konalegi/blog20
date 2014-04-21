angular.module('components')
.directive('asfButton',['$parse', '$compile', '$templateCache',($parse, $compile, $templateCache) ->
  link = ($scope, $element, $attrs, $parentCtrl) ->
    $scope.form = $parentCtrl.scope[$parentCtrl.form_name]
    $scope.model = $parentCtrl.model





  return {
    restrict: 'E',
    link: link,
    scope:{
      onAction: '&'
      disability: '@'
      label: '@'
    }
    replace: 'true'
    require: '^asfForm'
    controller: 'AsfButtonController'
    templateUrl: 'app/directives/asf_button/view'
  }
])
