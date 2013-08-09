Intimi.Router.map ->
  @route 'sign_in'
  @route 'sign_out'

  @resource 'contacts', ->
    @resource 'contact', path: '/:contact_id'

  @resource 'sender', path: '/sender'
