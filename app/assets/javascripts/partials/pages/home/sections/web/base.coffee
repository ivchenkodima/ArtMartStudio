#= require partials/pages/home/sections/web/items/base
#= require partials/pages/home/sections/web/items/speed
#= require partials/pages/home/sections/web/items/responsiveness
#= require partials/pages/home/sections/web/items/safety
#= require partials/pages/home/sections/web/items/crossbrowser
#= require partials/pages/home/sections/web/items/futurism

class Partials.Pages.Home.Sections.Web.Base extends Partials.Pages.Home.Sections.Base
    constructor: ->
        super('web')

    update: ->
        super =>
            if @_onSameLevel [@items[0], @items[1]]
                @_rotateItem 0, 'Y', '+', =>
#                    @_animateItems()
                    @_rotateItem 1, 'Y', '+', =>
                        if @_onSameLevel [@items[0], @items[1], @items[2]]
                            @_rotateItem 2, 'Y', '+', =>
                                @_rotateItem 3, 'Y', '+'
                                @_rotateItem 4, 'Y', '-', =>
                                    @_animateItems()
                        else
                            @_rotateItem 2, 'Y', '+'
                            @_rotateItem 4, 'Y', '-', =>
                                @_rotateItem 3, 'X', '-', =>
                                    @_animateItems()

    _initializeItems: ->
        [new Partials.Pages.Home.Sections.Web.Items.Speed()
         new Partials.Pages.Home.Sections.Web.Items.Responsiveness()
         new Partials.Pages.Home.Sections.Web.Items.Safety()
         new Partials.Pages.Home.Sections.Web.Items.Crossbrowser()
         new Partials.Pages.Home.Sections.Web.Items.Futurism()]

    _animateItems: ->
        unless @_itemAnimationsStarted
            @_itemAnimationsStarted = true
            i.performAnimation() for i in @items
#            @items[0].performAnimation =>
#                @items[1].performAnimation()
