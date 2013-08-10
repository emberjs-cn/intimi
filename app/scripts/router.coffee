Intimi.Router.map ->
  @route 'sign_in'
  @route 'sign_out'

  @resource 'contacts', ->
    @resource 'contact', path: '/:contact_id'

  @resource 'settings', ->
    @resource 'profile'
    @resource 'password'

  @resource 'users', ->
    @route 'new'
    @resource 'user', path: '/:user_id'
