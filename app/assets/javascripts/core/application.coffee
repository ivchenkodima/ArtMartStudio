#= require ./modules_definition
#= require ./extensions
#= require ./global_objects
#= require ./view

class Core.Application
    constructor: ->
        @_intervals = []
        @_pageLoads = 0

        $ =>
            @_pageLoads++
            @_reset()

    firstLoad: ->
        @_pageLoads is 1

    withInterval: (time, action, options = {})->
        interval = setInterval(action, time)
        action() unless options.performImmediately is false
        @_intervals.push interval unless options.clear is false

    _reset: ->
        @_destroyGlobalEvents()
        @_clearIntervals()
        @action = new (@_parseActionClass())

    _destroyGlobalEvents: ->
        $(window).off('.application')
        $(document).off('.application')

    _clearIntervals: ->
        clearInterval(i) for i in @_intervals
        @_intervals = []

    _parseActionClass: ->
        modules = $('body').attr('class').split(/\s+/)
        className = (m.camelize() for m in modules).join('.')
        eval className

@app = new Core.Application()
