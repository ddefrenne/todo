Todo.ProjectDropdownComponent = Ember.Component.extend({
  getAllProjects: ( ->
    @get('targetObject.store').find('project')
      .then((projects) =>
        @set('allProjects', projects)
      )
  ).on("init")

  currentProject: ( ->
    @get('currentTask.project')
  ).property()

  allProjects: (->
    []
  ).property()

  currentProjectDidChange: ( ->
    task = @get('currentTask')
    task.set('project', @get('currentProject'))
    task.save()
  ).observes('currentProject')
})
