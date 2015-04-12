Todo.TasksController = Ember.ArrayController.extend({
  actions: {
    createTask: () ->
      description = @get('newDescription')

      task = @store.createRecord('task', {
        description: description
      })

      task.save()
      @set('newDescription', '')
  },

  remaining: (->
    return @filterBy('completed', false).get('length')
  ).property('@each.completed'),

  inflection: (->
    remaining = @get('remaining')
    if remaining == 1 then 'task' else 'tasks'
  ).property('remaining')
})
