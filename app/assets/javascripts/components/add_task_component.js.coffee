Todo.AddTaskComponent = Ember.Component.extend({
  actions: {
    createTask: () ->
      description = @get('newDescription')
      project = @get('project')

      task = @get('targetObject.store').createRecord('task', {
        description: description,
        project: project
      })

      task.save()
      @set('newDescription', '')
  }
})
