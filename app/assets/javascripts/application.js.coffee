#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require ember
#= require ember-data
#= require_self
#= require todo

# for more details see: http://emberjs.com/guides/application/
window.Todo = Ember.Application.create({
  LOG_TRANSITIONS: true
})

$('body').on('mouseenter', '#tasks-list li', (event) ->
  $(event.target).find('button').show()
)

$('body').on('mouseleave', '#tasks-list li', (event) ->
  $(event.target).find('button').hide()
)
