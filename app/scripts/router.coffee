Intimi.Router.map ->
  @resource 'contacts', ->
    @resource 'contact', path: '/:contact_id'
  @resource 'sender', path: '/sender'
