class SessionsController extends AngularController
  @register App
  @inject '$log','$location', 'SessionResource', '$rootScope'

  initialize: ->
    @$scope.errors = ""
    @logout() if "/logout" == @$location.$$path

  logout: () =>

    promise = @SessionResource.delete()
    promise.then () =>
      @AuthService.updateUser(null, @$rootScope)
      @$location.path('/login')
  login: (obj) =>
    promise = @SessionResource.create obj
    promise.then (result) =>
      @AuthService.updateUser(result, @$rootScope)
      @$location.path('/posts')
    ,(result)=>
      @$scope.errors = result.data.errors