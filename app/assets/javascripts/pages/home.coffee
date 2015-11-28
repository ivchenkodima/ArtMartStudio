#= require partials/pages/home/sections/base
#= require partials/pages/home/sections/web/base
#= require partials/pages/home/sections/style
#= require partials/pages/home/sections/other
#= require partials/pages/home/sections/projects

class Pages.Home extends Layouts.Main
    constructor: ->
        super()

        @addClass('compact')

        setTimeout (=>
            @find('.preloader').show()
        ), 1000

        document.on 'svg:ready', =>
            @find('.preloader').remove()

            @_sections = [
                new Partials.Pages.Home.Sections.Web.Base()
                new Partials.Pages.Home.Sections.Style()
                new Partials.Pages.Home.Sections.Other()
                new Partials.Pages.Home.Sections.Projects()
            ]

            @_prepareSections()
            @_performAnimations()

    _performAnimations: ->
        @logo.performAnimation =>
            @removeClass('compact')
            app.withInterval 200, => @_updateSections()

    _prepareSections: ->
        s.prepareForTransformations() for s in @_sections

    _updateSections: ->
        s.update() for s in @_sections
