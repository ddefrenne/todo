Todo.Router.map ()->
  @resource('tasks', { path: '/' } )
  @resource('projects', { path: '/projects' } )

Todo.TasksRoute = Ember.Route.extend({
  model: ->
    return @store.find('task', { completed: false })
})

Todo.ProjectsRoute = Ember.Route.extend({
  model: ->
    return @store.find('project')
})
