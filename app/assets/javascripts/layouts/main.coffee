#= require partials/layouts/main/logo

class Layouts.Main extends View
    constructor: ->
        super('body')

        document.on 'svg:ready', =>
            @logo = new Partials.Layouts.Main.Logo()
