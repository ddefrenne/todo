Todo.TaskController = Ember.ObjectController.extend({
  actions: {
    removeTodo: () ->
      todo = @get('model')
      todo.deleteRecord()
      todo.save()
  }
})
