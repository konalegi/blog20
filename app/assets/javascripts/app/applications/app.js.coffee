

window.App = angular.module 'App',
[
  'ng-rails-csrf'
  'ngResource'
  'ivpusic.cookie'
  'restangular'
  'ngRoute'
  'dateRangePicker'
  'ngAnimate'
  'ui.select2'
  'Temaplates'
  'components'
]

window.App.config [
  '$routeProvider'
  ($routeProvider) ->
    $routeProvider

    .when '/posts',
      templateUrl: 'app/views/posts/index'
      controller: 'PostIndexController'
    .when '/posts/edit/:id',
      templateUrl: 'app/views/posts/edit'
      controller: 'PostEditController'
    .when '/posts/create',
      templateUrl: 'app/views/posts/create'
      controller: 'PostCreateController'

    .when '/posts/:id',
      templateUrl: 'app/views/posts/show'
      controller: 'PostShowController'

    .when '/login',
      templateUrl: 'app/views/sessions/create'
      controller: 'SessionsController'

    .when '/logout',
      controller: 'SessionsController'
      template: ' '
    .otherwise
      redirectTo: '/posts'
]


# window.App.run [
#   '$rootScope'
#   '$location'
#   'AuthService'
#   ($rootScope, $location, AuthService) ->
#     $rootScope.$on '$routeChangeStart', (event, next, current) ->
#       next.requireLogin = next.requireLogin || true
#       if next.requireLogin && !AuthService.isLogged()
#         event.preventDefault()
#         $location.path('/login')
# ]


App.config (RestangularProvider) ->
  RestangularProvider.setRequestSuffix('.json')
  RestangularProvider.setBaseUrl('api/v1/')
  RestangularProvider.setResponseExtractor (response, operation, what, url) ->
    if operation is "getList"
      if response.data?
        newResponse = response.data
      else
        newResponse = response
      newResponse.meta = response.meta if response.meta?
      newResponse

    else
        response
