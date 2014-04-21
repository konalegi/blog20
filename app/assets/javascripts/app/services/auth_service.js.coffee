class AuthService extends AngularObject
  @register App
  @inject 'ipCookie', '$location'

  initialize: =>
    if @ipCookie('current_user')?
      user = @ipCookie('current_user')
    @updateUser user

  isLogged: =>
    @user?

  getUserId: =>
    @user.id

  getUser: =>
    @user

  feel_scope: (scope) =>
    scope.acl = {}
    return unless @user?

    scope.isAuth = @isLogged()
    scope.user = @user

    for key,role of @user.roles
      for resource_key, resource of window.Acl.acl
        for action_key, action of resource
          if action[role]?
            scope.acl[resource_key] = scope.acl[resource_key] || { }
            scope.acl[resource_key]["#{action_key}_allowed"] = true


  updateUser: (user, rootScope) =>
    @user = user
    rootScope.$broadcast('onAuthStatusChange', @isLogged() ) if rootScope?


