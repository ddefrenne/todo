Todo.ProjectDropdownComponent = Ember.Component.extend({
  getAllProjects: ( ->
    @get('targetObject.store').find('project')
      .then((projects) =>
        @set('allProjects', projects)
      )
  ).on("init")

  allProjects: (->
    []
  ).property()
})
