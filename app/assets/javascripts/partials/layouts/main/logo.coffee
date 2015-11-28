class Partials.Layouts.Main.Logo extends View
    time = 200

    constructor: ->
        super('header .logo')
        @_towers = Snap.select("#{@selector} [data-src='logo_towers']")
        # @_logo_text = Snap.select("#{selector} [data-src='logo_text']")

    performAnimation: (callback) ->
        @_animateBackground()
        @_animateSecondTower()
        @_animateFirstTower()
        @_animateThirdTower()
        @_animateFoundation()
        @_animateText()
        setTimeout(callback, 30*time)

    _animateSecondTower: ->
        parts = (@_towers.select(".tower2 .part#{i}") for i in [1..5])
        top = @_towers.select('.tower2 .top')
        points = [
            [
                [482.8999939, 345.1000061, 572.5999756, 345.1000061, 566.5999756, 345.1000061, 488.8999939, 345.1000061]
                [482.8999939, 348.1000061, 572.5999756, 348.1000061, 569.5999756, 322.6000061, 485.8999939, 322.6000061]
                [482.899, 348.1,572.599, 348.1,572.599,313.7, 482.89, 313.7]
            ]
            [
                [482.8999939,313.7,572.5999756,313.7000122,566.5999756,313.7000122,488.8999939,313.7000122,                ]
                [482.8999939,314.7,572.5999756,314.7000122,569.5999756,290.3000183,485.8999939,290.3000183,                ]
                [482.89,314.7,572.59,314.7,572.599,281.2,482.899,281.2]
            ]
            [
                [482.8999939,281.3999939,572.5999756,281.3999939,566.5999756,281.3999939,488.8999939,281.3999939]
                [482.8999939,284.3999939,572.5999756,284.3999939,569.5999756,257.8999939,485.8999939,257.8999939]
                [482.899,284.399,572.599,284.399,572.5999,248,482.899,248]
            ]
            [
                [482.8999939,249,572.5999756,249,566.5999756,249,488.8999939,249]
                [482.8999939,251,572.5999756,251,569.5999756,225.6000061, 485.8999939,225.6000061]
                [482.899,251,572.599,251,572.599,215.9,482.899,215.9]
            ]
        ]

        parts[0].attr(x: 482.89, y: 375.1, width: 89.7, height: 0)
        parts[0].animate(y: 345.81, height: 30, 2*time, mina.easeout)

        parts[1].attr(points: points[0][0],opacity: .5)
        setTimeout =>
            parts[1].animate( points: points[0][1], opacity:.8,  time, mina.linear)
        , 2*time
        setTimeout =>
            parts[1].animate( points: points[0][2], opacity: 1,  time, mina.linear)
        , 3*time

        parts[2].attr(points: points[1][0],opacity: .5)
        setTimeout =>
            parts[2].animate( points: points[1][1], opacity:.8,  time, mina.linear)
        , 4*time
        setTimeout =>
            parts[2].animate( points: points[1][2], opacity: 1,  time, mina.linear)
        , 5*time

        parts[3].attr(points: points[2][0],opacity: .5)
        setTimeout =>
            parts[3].animate( points: points[2][1], opacity:.8,  time, mina.linear)
        , 6*time
        setTimeout =>
            parts[3].animate( points: points[2][2], opacity: 1,  time, mina.linear)
        , 7*time

        parts[4].attr(points: points[3][0],opacity: .5)
        setTimeout =>
            parts[4].animate( points: points[3][1], opacity:.8,  time, mina.linear)
        , 8*time
        setTimeout =>
            parts[4].animate( points: points[3][2], opacity: 1,  time, mina.linear)
        , 9*time

        top.attr(d: 'M482.8999939,216.6999969L482.8999939,216.6999969c0,0,26.7000122,0,89.8999939,0 l0,0H482.8999939L482.8999939,216.6999969z')
        setTimeout =>
           top.animate(d:"M482.8999939,216.5v-96.1999969c0,0,26.5,70.1999969,89.6999817,89.6999969v6.5H482.8999939z",  2*time, mina.linear)
        , 10*time

    _animateFirstTower: ->
        part1 = @_towers.select('.tower1 .part')
        top1 = @_towers.select('.tower1 .top')
        
        part1.attr(x: '336.1',y: '375.89',width: '77.6999817',height: 0)
        setTimeout =>
            part1.animate(y: '344.89',height: '30.0', 2 * time, mina.linear)
        , 12*time
        setTimeout =>
            top1.attr(d: 'M336.1000061,346.1000061c0,0,43.5,0,77.6999817,0l0,0H336.1000061 L336.1000061,346.1000061z')
            top1.animate(d: 'M336.1000061,329.6000061c0,0,43.5,0.6000061,77.6999817-44.6000061v61.1000061h-77.7000122v-16.5H336.1000061z', 2 * time, mina.easeout)
        , 14*time

    _animateThirdTower: ->
        part3 = @_towers.select('.tower3 .part')
        top3 = @_towers.select('.tower3 .top')
        
        part3.attr(x:'593.0999756', y:'374.91', width:'73.0999756', height: 0)
        setTimeout =>
            part3.animate(y: '345.3',height: 29.2, 2 * time, mina.linear)
        , 16*time
        setTimeout =>
            top3.attr(d: 'M593.0999756,346.1000061L593.0999756,346.1000061c0,0,21.9000244,0,73.0999756,0 l0,0H593.0999756z')
            top3.animate(d:"M593.0999756,346.1000061v-48.7999878c0,0,21.9000244,39.7000122,73.0999756,44.7999878v4H593.0999756z", 2 * time, mina.easeout)
        , 18*time

    _animateFoundation: ->
        found = @_towers.select('.foundation')

        found.attr( x: '526.2000122',y: '374.2000122',width: 0,height: '3.1000061',opacity: 0)
        setTimeout =>
            found.animate(opacity: 1 , 0.5 * time, mina.easeout)
        , 20*time
        setTimeout =>
            found.animate( x: '336.1',y: '374.2',height: '3.1',width: '330', 3 * time, mina.easeout)
        , 20.5*time
        
    _animateText: ->
        setTimeout =>            
            $("[data-src='logo_text']").attr('class','active')
        , 23.5*time

    _animateBackground: ->
        background = Snap.select("[data-src='logo_background']")
        background.attr(opacity: 0)
        setTimeout =>
            background.animate(opacity: .6, 4*time, mina.easeout)
        , 26 * time
