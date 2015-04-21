Todo.Router.map ()->
  @resource('tasks', ->
    @route('show', { path: '/:task_id' })
  )
  @resource('projects', ->
    @route('show', { path: '/:project_id' })
  )
