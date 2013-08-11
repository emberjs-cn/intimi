class Intimi.Factory
  @factories: {}

  @define: (name, builder) ->
    Intimi[name].FIXTURES = [] if !Intimi[name].FIXTURES
    @factories[name] = builder

  @associate: (name) ->
    @fake(name, { association: true })

  @fake: (name, options = {}) ->
    new Intimi.Factory(name, options)

  constructor: (name, options) ->
    @name = name
    @builder = Intimi.Factory.factories[name]
    @store = Intimi[@name].FIXTURES
    @association = options.association
    @withAttrs = {}

  build: (times = 1) ->
    result = []

    for i in [1..times]
      hash = @builder.call(@)
      for key, value in @withAttrs
        hahs[i] = value

      @save(hash)

      if @association
        tmp = hash.id
      else
        tmp = hash

      result.push(tmp)

    result

  currentId: () ->
    @store.length + 1

  save: (hash) ->
    hash.id = @currentId()
    @store.push hash

  with: (hash) ->
    for k, v in hash
      @withAttrs[k] = v

    @

  get: (id) ->
    id = Math.floor(Math.random() * @store.length) if !id

    @store[id - 1]
