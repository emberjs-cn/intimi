Intimi.ApplicationController = Ember.ArrayController.extend Intimi.NewMessageMixin,
  title: 'Intimi'

  availableSidebar: (->
    menus = []
    user = Intimi.Auth.get('user')
    @get('sidebar.menus').forEach (menu) ->
      if user.hasRole(menu.roles, 'any')
        newMenu = Ember.merge {}, menu
        menus.push newMenu

        items = []
        menu.items.forEach (item) ->
          items.push item if Intimi.Auth.get('user').hasRole(item.roles, 'any')

        newMenu.items = items

    { menus: menus, starterItems: @get('sidebar.starterItems') }
  ).property().volatile()

  sidebar: {
    menus: [{
      icon: 'images/mins.png',
      url: '#即时通知',
      text: '即时通知',
      roles: ['admin', 'user']
      items: [{
        icon: 'images/contacts.png',
        url: '#/conversations',
        text: '最新消息',
        roles: ['admin', 'user']
      }, {
        icon: 'images/surveys.png',
        url: '#/surveys',
        text: '问卷调查',
        roles: ['admin', 'user']
      }]
    }, {
      icon: 'images/email.png',
      url: '#邮件通知',
      text: '邮件通知',
      roles: ['admin', 'user']
      items: [{
        icon: 'images/compose.png',
        url: '#/emails/compose',
        text: '写邮件',
        roles: ['admin', 'user']
      }]
    }, {
      icon: 'images/settings.png',
      url: '#系统管理',
      text: '系统管理',
      roles: ['admin', 'user']
      items: [{
        icon: 'images/users.png',
        url: '#/users',
        text: '用户管理',
        roles: ['admin']
      }, {
        icon: 'images/profile.png',
        url: '#/settings',
        text: '个人设置',
        roles: ['admin', 'user']
      }]
    }],

    starterItems: [{
      icon: 'icon-wrench',
      url: '#/settings',
      text: '个人设置'
    }, {
      icon: 'icon-off',
      url: '#/sign_out',
      text: '注销'
    }]
  }

  updateCurrentPath: (->
    Intimi.set('currentPath', @get('currentPath'))
  ).observes('currentPath')

  authenticate: (login, password) ->
    Intimi.User.find(name: login).then (users) ->
      return Notifier.error('您输入的用户名不存在') if users.get('length') == 0

      user = users.get('firstObject')
      if user.get('password') == password
        Intimi.Auth.createSession '{ "user_id": "' + user.get('id') + '", "auth_token": "uvwxyz" }'
      else
        Notifier.error('您输入的密码不正确')
