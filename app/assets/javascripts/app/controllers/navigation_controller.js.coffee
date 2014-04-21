class @NavigationController extends AngularController
  @register App
  @inject '$log','$location'

  initialize: ->
    super
    @$scope.$on 'onAuthStatusChange', (event, value) =>
      @AuthService.feel_scope @$scope
      @$scope.isAuth = value
      @$scope.user = @AuthService.getUser()

  isActive: (viewLocation) ->
    viewLocation == @$location.path()