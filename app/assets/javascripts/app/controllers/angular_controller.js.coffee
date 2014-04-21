class @AngularController extends AngularObject
  @inject '$scope','$log','AuthService'
  initialize: ->
    @AuthService.feel_scope @$scope


