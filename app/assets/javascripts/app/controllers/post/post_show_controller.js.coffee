class @PostShowController extends AngularController
  @register App
  @inject '$log','PostResource', '$routeParams'

  initialize: ->
    super
    @PostResource.by_id(@$routeParams.id).then (post) =>
      @$scope.post = post
      @$scope.comments = post.getList('comments').$object

  create_comment: ->
    promise = @$scope.post.post('comments',{ text: @$scope.comment_text })
    promise.then (result) =>
      @$scope.comments.push result
      @$scope.comment_text = ""

  delete_comment: (comment,index)->
    comment.remove().then () =>
      @$scope.comments.splice(index,1)


