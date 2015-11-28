class Partials.Pages.Home.Sections.Web.Items.Base extends View
    constructor: (name)->
        super("#web-section .section-item.#{name}-item")

