# For more information see: http://emberjs.com/guides/routing/

Todo.Router.map ()->
  # @resource('posts')

Todo.TasksRoute = Ember.Route.extend({
  setupController: (controller, model) ->
    controller.set('model', model);

  model: () ->
    return this.store.find('task');
});
