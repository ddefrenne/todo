# For more information see: http://emberjs.com/guides/routing/

Todo.Router.map ()->
  @resource('tasks', { path: '/' } )

Todo.TasksRoute = Ember.Route.extend({
  model: () ->
    return @.store.find('task', { completed: false })
})
