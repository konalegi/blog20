angular.module('components')
.directive('asfInput',['$log','$compile','$templateCache',
($log, $compile, $templateCache) ->
  link = ($scope, $element, $attrs, $parentCtrl) ->
    $scope.type = $attrs.type || "text"
    theme =  if $attrs.theme? then $attrs.theme else "default"
    elementType =  if $attrs.elementType? then $attrs.elementType else "input"
    tpl = $templateCache.get("app/directives/asf_input/templates/#{theme}/#{elementType}")
    $element.replaceWith($compile(tpl)($scope))





    $scope.model = if $parentCtrl.scope.model? then $parentCtrl.scope.model[$attrs.name] else ""
    $scope.model = "" unless $scope.model?

    parent_form = $parentCtrl.scope[$parentCtrl.form_name]
    forms = [$scope.form.input, parent_form ]

    validations = if $parentCtrl.form && $parentCtrl.form[$attrs.name]? then $parentCtrl.form[$attrs.name].validations else {}


    $scope.validations = validations

    $parentCtrl.scope.$watch 'model', () ->
      $scope.model = if $parentCtrl.scope.model? then $parentCtrl.scope.model[$attrs.name] else ""
      $scope.model = "" unless $scope.model?

    $scope.$watch 'model', (newValue, oldValue) =>

      $parentCtrl.scope.model[$attrs.name] = newValue
      parent_form.$setDirty true if newValue != oldValue


      if validations.presence_validator?
        change_validity forms, 'required', !!$scope.model

      if validations.length_validator?
        validate_length validations.length_validator.value, $scope.model, forms

      if validations.numericality_validator?
        valiadte_numericality validations.numericality_validator.value, $scope.model, forms

      if validations.format_validator?
        validate_format validations.format_validator.value, $scope.model, forms

  change_validity = (forms, field, value) =>
    for key,form of forms
      form.$setValidity(field, value)

  validate_length = (validator, model, forms) ->
    if validator.is?
      change_validity forms, 'length',  model.length == validator.is

    if validator.maximum?
      change_validity forms, 'length',  model.length <= validator.maximum

  valiadte_numericality = (validator, model, forms) ->
    if validator.only_integer?
      change_validity forms, 'numericality', /^[0-9]+$/.test model

  validate_format = (validator, model, forms) ->
    if validator?
      regexp = new RegExp validator
      change_validity forms, 'format', regexp.test(model)

  return {
    restrict: 'E',
    link: link,
    scope: {
      name: '@'
      label: '@'
      placeholder: '@'
      list: '='
    }
    require: '^asfForm'
    replace: 'true',
    controller: 'AsfInputController',
  }
])
