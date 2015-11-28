class @View extends jQuery
    constructor: (selector)->
        $.extend(true, this, $(selector))
        @selector = selector
