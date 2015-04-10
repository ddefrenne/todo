Todo.Task = DS.Model.extend({
    description: DS.attr('string'),
    completed: DS.attr('boolean', { defaultValue: false })
});
