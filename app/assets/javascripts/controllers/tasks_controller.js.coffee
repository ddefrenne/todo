Todo.TasksController = Ember.ArrayController.extend({
  actions: {
    createTask: () ->
      description = @.get('newDescription');

      task = @.store.createRecord('task', {
        description: description
      });

      @.set('newDescription', '')

      task.save()
  }
})