class @AngularResource extends AngularObject
  @inject 'Restangular', '$log'

  @url: (baseUrl) ->
    @baseUrl = baseUrl

  constructor: (args...) ->
    super(args...)
    @base = @Restangular.all(@constructor.baseUrl)


  all: (params) =>
    @base.getList(params)

  by_id: (id, params) =>
    @Restangular.one(@constructor.baseUrl, id).get(params)




  objects: (params) =>
    @base.getList(params).$object

  create: (params) =>
    @base.post(params)

