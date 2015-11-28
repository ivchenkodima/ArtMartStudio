class Partials.Pages.Home.Sections.Other extends Partials.Pages.Home.Sections.Base
    constructor: ->
        super('other')

    update: ->
        super =>
            if @_onSameLevel [@items[0], @items[1]]
                @_rotateItem 0, 'Y', '+'
                @_rotateItem 1, 'Y', '-', =>
                    @_rotateItem 2, 'X', '-'
