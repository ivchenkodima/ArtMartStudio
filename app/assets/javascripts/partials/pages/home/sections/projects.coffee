class Partials.Pages.Home.Sections.Projects extends Partials.Pages.Home.Sections.Base
    constructor: ->
        super('projects')

    update: ->
        super =>
            for item in @items
                if @_isVisible(item) and !item.hasClass('moving') and !item.hasClass('ready')
                    item.removeClass('hidden').addClass('moving')
                    item.transition transform: 'translateX(-100%)', 0, ->
                        item.transition transform: '', 800, ->
                            item.css(transform: 'none')
                            item.removeClass('moving').addClass('ready')