Intimi.Router.map ->
  @resource 'contacts', ->
    @resource 'contact', path: '/:contact_id'

  @route 'sign-in'
