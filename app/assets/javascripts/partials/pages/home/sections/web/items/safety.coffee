class Partials.Pages.Home.Sections.Web.Items.Safety extends Partials.Pages.Home.Sections.Web.Items.Base
    constructor: ->
        super('safety')

        @_svg = Snap.select("[data-src='safety']")

    performAnimation: ->
        windw = @_svg.select('.window')
        guard = @_svg.select('.guard')
        check = @_svg.select('.check')


        windw.attr(opacity: 0)
        guard.attr(opacity:0, transform: 'translate(125,80) scale(.0)')

        windw.animate(opacity: 1, 2000, mina.easeout)
        guard.animate(opacity: 1, 2000)

        setTimeout ->
            guard.animate(transform: ' translate(-25, -17) scale(1.2)', 1000, mina.easeout)
        , 2000
        setTimeout ->
            guard.animate(transform: 'translate(0,0) scale(1)', 500, mina.easeout)
        , 3000
        setTimeout ->
            check.attr('stroke-dashoffset': 1000, display: 'block')
            check.animate('stroke-dashoffset': 0, 5000)
        , 3500

