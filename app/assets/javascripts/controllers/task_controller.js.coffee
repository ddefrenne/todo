Todo.TaskController = Ember.ObjectController.extend({
  actions: {
    removeTask: () ->
      todo = @get('model')
      todo.deleteRecord()
      todo.save()

    completeTask: ->
      todo = @get('model')
      todo.set('completed', true)
      todo.save()
  },

  isCompleted: (->
    task = @get('model');
    return task.get('completed')
  ).property('model.completed')
})
