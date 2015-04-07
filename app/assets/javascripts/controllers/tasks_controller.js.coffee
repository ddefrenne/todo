Todo.TasksController = Ember.ArrayController.extend({
  actions: {
    createTask: () ->
      description = @get('newDescription')

      task = @store.createRecord('task', {
        description: description
      })

      task.save()
      @set('newDescription', '')
  }
})
