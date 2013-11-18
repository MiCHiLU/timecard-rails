class Timecard.Views.IssuesShow extends Backbone.View

  template: JST['issues/show']

  events:
    'click .js-close-issue-button': 'closeIssue'
    'click .js-reopen-issue-button': 'reopenIssue'
    'click .js-postpone-issue-button': 'postponeIssue'
    'click .js-do-today-issue-button': 'doTodayIssue'

  className: 'media issue'

  initialize: (@options) ->
    @issue = @options.issue

  render: ->
    @$el.html(@template(issue: @issue))
    @

  closeIssue: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @issue.save {},
      url: @issue.urlRoot+'/'+@issue.id+'/close'
      patch: true
      success: (model) ->
        $(e.target).closest('.issue').hide()

  reopenIssue: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @issue.save {},
      url: @issue.urlRoot+'/'+@issue.id+'/reopen'
      patch: true
      success: (model) ->
        $(e.target).closest('.issue').hide()

  postponeIssue: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @issue.save {},
      url: @issue.urlRoot+'/'+@issue.id+'/postpone'
      patch: true
      success: (model) ->
        $(e.target).closest('.issue').hide()

  doTodayIssue: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @issue.save {},
      url: @issue.urlRoot+'/'+@issue.id+'/do_today'
      patch: true
      success: (model) ->
        $(e.target).closest('.issue').hide()
