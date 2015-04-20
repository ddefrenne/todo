Todo.TaskController = Ember.Controller.extend({
  actions: {
    removeTask: () ->
      task = @get('model')
      task.destroyRecord()

    completeTask: ->
      task = @get('model')
      task.set('completed', true)
      task.save()
  },

  isCompleted: (->
    return @get('model.completed')
  ).property('model.completed')
})
