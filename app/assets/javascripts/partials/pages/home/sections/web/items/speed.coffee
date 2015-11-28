class Partials.Pages.Home.Sections.Web.Items.Speed extends Partials.Pages.Home.Sections.Web.Items.Base
    constructor: ->
        super('speed')

        @_arrow = @find("[data-src='speedometer_arrow']")
        @_arrowLocked = true

        @mouseenter =>
            unless @_arrowLocked
                @_arrowDown =>
                    @performAnimation()

    performAnimation: (callback)->
        @_arrowLocked = true
        @_arrow.attr('class', 'active')
        setTimeout (=>
            @_arrow.css(transform: 'rotateZ(0)')
            @_arrow.attr('class', '')
            @_arrowLocked = false
            callback?()
        ), 2*1500 + 500

    _arrowDown: (callback)->
        time = 500

        @_arrowLocked = true
        @_arrow.css
            transition: "#{time / 1000}s"
            transform: 'rotateZ(-225deg)'

        setTimeout (=>
            @_arrow.removeAttr('style')
            @_arrowLocked = false
            callback?()
        ), time
