for object in [window, document]
    do (object)->
        $object = $(object)
        object.on = (events, selector, data, handler)->
            events = ("#{e}.application" for e in events.split(/\s+/)).join(' ')
            $object.on(events, selector, data, handler)
