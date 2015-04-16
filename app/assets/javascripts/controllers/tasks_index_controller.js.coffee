Todo.TasksIndexController = Ember.ArrayController.extend({
  remaining: (->
    return @filterBy('completed', false).get('length')
  ).property('@each.completed'),

  inflection: (->
    remaining = @get('remaining')
    if remaining == 1 then 'task' else 'tasks'
  ).property('remaining')

  allDone: (->
    remaining = @get('remaining')
    if remaining == 0 then true else false
  ).property('remaining')
})
