Todo.ProjectsIndexRoute = Ember.Route.extend({
  model: ->
    @store.find('project')
})
