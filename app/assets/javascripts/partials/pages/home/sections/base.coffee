class Partials.Pages.Home.Sections.Base extends View
    constructor: (sectionName)->
        super(".pages.home ##{sectionName}-section")

        @name = sectionName
        @container = @find('.section-items-container')
        @items = @_initializeItems()

        app.withInterval 200, =>
            @_updateBackground()

        window.on 'resize', =>
            @_updateBackground()

    update: (callback)->
        if @_isVisible(@)
            @find('.section-header').removeClass('hidden')
            if @_onMobile()
                @_showVisibleItems()
            else
                callback?()

    prepareForTransformations: ->
        @find('.section-item, .section-header').addClass('hidden')

    _showVisibleItems: ->
        for i in @items
            if @_isVisible(i) and not @hasClass('ready')
                i.removeClass('hidden').addClass('ready')

    _initializeItems: ->
        $(i) for i in @find('.section-item')

    _rotateItem: (item, axis, direction, callback)->
        item = @items[item]

        if item.hasClass('ready')
            callback?()
        else if not item.hasClass('moving') and @_isVisible(item)
            perspective = 'perspective(1000px)'
            item.addClass('moving')
            item.removeClass('hidden')

            # Doesn't work in IE 11 with 90 degrees
            item.transition transform: "#{perspective} rotate#{axis}(#{direction}91deg)", 0, ->
                item.transition transform: "#{perspective} rotate#{axis}(0deg)", 1000, 'ease', ->
                    item.css(transform: 'none')
                    item.removeClass('moving')
                    item.addClass('ready')
                    callback?()

    _isVisible: (element)->
        top = element.offset().top - $(window).scrollTop()
        $(window).height() - top > $(window).height() / 5

    _onSameLevel: (elements)->
        for e, i in elements
            if i > 0 and e.offset().top != elements[i-1].offset().top
                return false
        true

    _onMobile: ->
        items = $('#web-section .section-item')
        not @_onSameLevel [$(items[0]), $(items[1])]

    _updateBackground: ->
        angle = Math.atan(@container.height() / @container.width())

        for item in @items
            x1   = item.offset().left
            y1   = item.offset().top - @container.offset().top + item.height()
            x2   = x1 + item.width()
            y2   = y1 - item.height()
            rgb1 = @_calculateColor(x1, y1, angle)
            rgb2 = @_calculateColor(x2, y2, angle)

            $(item).css(background: "linear-gradient(#{angle * 180 / Math.PI}deg, #{rgb1}, #{rgb2})")

    _calculateColor: (xi, yi, angle)->
        result      = {}
        startColor  = r: 72, g: 183, b: 168
        endColor    = r: 5,  g: 81,  b: 159
        w           = @container.width()
        h           = @container.height()
        x           = (h*w + xi*w*Math.tan(angle) - w*yi) / (w*Math.tan(angle) + h)
        y           = h - (x*h) / w
        diagonal    = Math.sqrt(w*w + h*h)
        distance    = Math.sqrt(x*x + (y-h)*(y-h))
        percent     = distance / diagonal

        for color in ['r', 'g', 'b']
            result[color] = Math.round(startColor[color] + percent * (endColor[color] - startColor[color]))

        "rgb(#{result.r}, #{result.g}, #{result.b})"
