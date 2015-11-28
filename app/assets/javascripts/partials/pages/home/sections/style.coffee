class Partials.Pages.Home.Sections.Style extends Partials.Pages.Home.Sections.Base
    constructor: ->
        super('style')

    update: ->
        super =>
            if @_onSameLevel(@items)
                @_rotateItem 0, 'Y', '+'
                @_rotateItem 1, 'Y', '-'
            else
                @_rotateItem 0, 'X', '-', =>
                    @_rotateItem 1, 'X', '-'
