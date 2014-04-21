class SessionResource extends AngularResource
  @register App
  @url 'session'

  delete: =>
    @base.remove()