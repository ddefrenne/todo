Todo.TasksController = Ember.ArrayController.extend({
  remaining: (->
    return @filterBy('completed', false).get('length')
  ).property('@each.completed'),

  inflection: (->
    remaining = @get('remaining')
    if remaining == 1 then 'task' else 'tasks'
  ).property('remaining')
})
