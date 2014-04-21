class @PostIndexController extends AngularController
  @register App
  @inject '$log','PostResource'

  initialize: ->
    super
    @$scope.posts = @PostResource.objects()
    console.log @$scope

  delete: (post,index) =>
    post.remove().then () =>
      @$scope.posts.splice(index,1)
