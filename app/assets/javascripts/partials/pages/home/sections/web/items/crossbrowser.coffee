class Partials.Pages.Home.Sections.Web.Items.Crossbrowser extends Partials.Pages.Home.Sections.Web.Items.Base
    constructor: ->
        super('crossbrowser')

        # document.on ''

     
    performAnimation: ->
     
        @_brousers = Snap.select("[data-src='browsers']")

        safari = @_brousers.select('.safari')
        firefox = @_brousers.select('.firefox')
        ie = @_brousers.select('.IE')
        chrome = @_brousers.select('.chrome')

        chrome.attr( transform: 'translate(-800,0)')
        ie.attr(transform: 'translate(-750,0)')
        firefox.attr(transform: 'translate(-600,0)')
        safari.attr(transform: 'translate(-250,0)')

        cubicBezier = (x1, y1, x2, y2, epsilon) ->

          curveX = (t) ->
            v = 1 - t
            3 * v * v * t * x1 + 3 * v * t * t * x2 + t * t * t

          curveY = (t) ->
            v = 1 - t
            3 * v * v * t * y1 + 3 * v * t * t * y2 + t * t * t

          derivativeCurveX = (t) ->
            v = 1 - t
            3 * (2 * (t - 1) * t + v * v) * x1 + 3 * (-t * t * t + 2 * v * t) * x2

          (t) ->
            `var x2`
            x = t
            t0 = undefined
            t1 = undefined
            t2 = undefined
            x2 = undefined
            d2 = undefined
            i = undefined
            # First try a few iterations of Newton's method -- normally very fast.
            while i < 8
              x2 = curveX(t2) - x
              if Math.abs(x2) < epsilon
                return curveY(t2)
              d2 = derivativeCurveX(t2)
              if Math.abs(d2) < 1e-6
                break
              t2 = t2 - (x2 / d2)
              i++
            t0 = 0
            t1 = 1
            t2 = x
            if t2 < t0
              return curveY(t0)
            if t2 > t1
              return curveY(t1)
            # Fallback to the bisection method for reliability.
            while t0 < t1
              x2 = curveX(t2)
              if Math.abs(x2 - x) < epsilon
                return curveY(t2)
              if x > x2
                t0 = t2
              else
                t1 = t2
              t2 = (t1 - t0) * .5 + t0
            # Failure
            curveY t2

        duration = 1000
        epsilon = 1000 / 60 / duration / 4
        timingFunction = cubicBezier(1, 0.74, 0.79, 1.57, epsilon)

        setTimeout ->
          chrome.animate(transform: 'translate(0,0) rotate(720deg)', 2000, mina.easein)
        ,1000
        setTimeout ->
          ie.animate(transform: 'translate(0,0) rotate(720deg)', 2000, timingFunction)
        ,3000

        setTimeout ->
          firefox.animate(transform: 'translate(0,0) rotate(360deg)', 2000, timingFunction)
        ,5000
        setTimeout ->
          safari.animate(transform: 'translate(0,0) rotate(360deg)', 2000, timingFunction)
        ,7000