Todo.TaskController = Ember.ObjectController.extend({
  actions: {
    removeTask: () ->
      task = @get('model')
      task.deleteRecord()
      task.save()

    completeTask: ->
      task = @get('model')
      task.set('completed', true)
      task.save()
  },

  isCompleted: (->
    return @get('model.completed')
  ).property('model.completed')
})
