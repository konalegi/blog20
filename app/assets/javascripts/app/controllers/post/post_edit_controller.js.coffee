class @PostEditController extends AngularController
  @register App
  @inject '$log','PostResource', '$routeParams'

  initialize: ->

    @$scope.post = {}
    super
    @PostResource.by_id(@$routeParams.id).then (post) =>
      @$scope.post = post


  edit: (post) ->
    post.put().then () =>
      console.log 'updated'


