Todo.Router.map ()->
  @resource('tasks', ->
    @route('show', { path: '/:task_id' })
  )
  @resource('projects', ->
    @route('show', { path: '/:project_id' })
  )

Todo.IndexRoute = Ember.Route.extend({
  model: ->
    @store.find('task')

  setupController: (controller, model) ->
    @_super(controller, model)
    @controllerFor('tasksIndex').set('model', model)

  renderTemplate: ->
    @render('tasks/index')
})

Todo.TasksIndexRoute = Ember.Route.extend({
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
