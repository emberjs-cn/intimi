Intimi.Router.map ->
  @route 'sign_in'

  @resource 'contacts', ->
    @resource 'contact', path: '/:contact_id'

  @resource 'sender', path: '/sender'
