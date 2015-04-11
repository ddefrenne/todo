Todo.Router.map ()->
  @resource('tasks', { path: '/' } )
  @resource('projects', ->
    @route('show', { path: '/projects/:id' })
  )

Todo.TasksRoute = Ember.Route.extend({
  model: ->
    return @store.find('task', { completed: false })
})

Todo.ProjectsIndexRoute = Ember.Route.extend({
  model: ->
    return @store.find('project')
})
