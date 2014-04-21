class @PostCreateController extends AngularController
  @register App
  @inject '$log','PostResource', '$location'

  initialize: ->
    super
    # @PostResource.by_id(@$routeParams.id).then (post) =>
    #   @$scope.post = post
    #   @$scope.comments = post.getList('comments').$object
  create: (obj) =>
    @PostResource.create(obj).then () =>
      console.log @$location
      @$location.path '/posts'





