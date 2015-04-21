Todo.TasksIndexRoute = Ember.Route.extend({
  model: ->
    @store.find('task', { completed: false })
})
