angular.module('components')
.directive('asfForm', () ->
  return {
    restrict: 'E'
    scope:{
      model: '=ngModel'
      name: '@'
    }
    transclude: true

    replace: 'true'
    controller: 'AsfController'
    templateUrl: 'app/directives/asf_form/view'
  }
)
