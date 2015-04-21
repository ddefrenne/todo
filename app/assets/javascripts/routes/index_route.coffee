Todo.IndexRoute = Ember.Route.extend({
  model: ->
    @store.find('task', { completed: false })

  setupController: (controller, model) ->
    @_super(controller, model)
    @controllerFor('tasksIndex').set('model', model)

  renderTemplate: ->
    @render('tasks/index')
})
