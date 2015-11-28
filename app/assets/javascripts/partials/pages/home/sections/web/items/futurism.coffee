class Partials.Pages.Home.Sections.Web.Items.Futurism extends Partials.Pages.Home.Sections.Web.Items.Base
    constructor: ->
        super('futurism')

    performAnimation: ->
        futurism = Snap.select("[data-src='futurism']")
        content = Snap.select("[data-src='futurism'] .content")
        mask = Snap.select("#futurism_mask .mask")

        futurism.attr(transform: "translate(-100%,-60%) scale(.4) ")
        futurism.animate(transform: "translate(350%, -20%) scale(.6)", 2000, mina.easein)
        setTimeout ->
            futurism.animate(transform: "translate(0%, 0%) scale(1)", 2000, mina.easeout)
        ,2000
        setTimeout ->
            content.animate(transform:"translateY(0,-29px)", 2000, mina.easeout)
            mask.animate(y: 102, 2000, mina.easeout)
        ,4000
