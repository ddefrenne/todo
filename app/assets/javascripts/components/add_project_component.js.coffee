Todo.AddProjectComponent = Ember.Component.extend({
  actions: {
    createProject: () ->
      name = @get('newName')

      project = @get('targetObject.store').createRecord('project', {
        name: name,
      })

      project.save()
      @set('newName', '')
  }
})
