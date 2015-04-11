Todo.Router.map ()->
  @resource('tasks', { path: '/' } )
  @resource('projects', ->
    @route('show', { path: '/:project_id' })
  )

Todo.TasksRoute = Ember.Route.extend({
  model: ->
    return @store.find('task')
})

Todo.ProjectsIndexRoute = Ember.Route.extend({
  model: ->
    return @store.find('project')
})

Todo.ProjectsShowRoute = Ember.Route.extend({
  model: (params) ->
    return @store.find('project', params.project_id)
})
