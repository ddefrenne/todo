Todo.TaskController = Ember.ObjectController.extend({
  actions: {
    removeTask: () ->
      todo = @get('model')
      todo.deleteRecord()
      todo.save()
  }
})
