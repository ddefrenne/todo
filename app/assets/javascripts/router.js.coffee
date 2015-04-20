Todo.Router.map ()->
  @resource('tasks', ->
    @route('show', { path: '/:task_id' })
  )
  @resource('projects', ->
    @route('show', { path: '/:project_id' })
  )

Todo.IndexRoute = Ember.Route.extend({
  model: ->
    @store.find('task', { completed: false })

  setupController: (controller, model) ->
    @_super(controller, model)
    @controllerFor('tasksIndex').set('model', model)

  renderTemplate: ->
    @render('tasks/index')
})

Todo.TasksIndexRoute = Ember.Route.extend({
  model: ->
    @store.find('task', { completed: false })
})

Todo.TasksShowRoute = Ember.Route.extend({
  model: (params) ->
    @store.find('task', params.task_id).then((task) ->
      task.get('project').then( (project) ->
        task.set('project', project)
      )
    )
})

Todo.ProjectsIndexRoute = Ember.Route.extend({
  model: ->
    @store.find('project')
})

Todo.ProjectsShowRoute = Ember.Route.extend({
  model: (params) ->
    @store.find('project', params.project_id)
})
