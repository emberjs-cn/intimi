Intimi.Router.map ->
  @route 'sign-in'

  @resource 'contacts', ->
    @resource 'contact', path: '/:contact_id'

  @resource 'sender', path: '/sender'
