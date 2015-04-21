Todo.TasksShowRoute = Ember.Route.extend({
  model: (params) ->
    @store.find('task', params.task_id).then((task) ->
      task.get('project').then( (project) ->
        task.set('project', project)
      )
    )
})
