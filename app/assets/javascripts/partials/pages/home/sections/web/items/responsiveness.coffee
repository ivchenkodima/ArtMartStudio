class Partials.Pages.Home.Sections.Web.Items.Responsiveness extends Partials.Pages.Home.Sections.Web.Items.Base
    constructor: ->
        super('responsiveness')

        @_svg = Snap.select("#{@selector} svg")

    performAnimation: ->

        blocks = @_svg.select('.blocks')
        keyb = @_svg.select('.keyboard_bottom')
        keyb2 = @_svg.select('.keyboard')
        screen1 = @_svg.select('.screen')
        content = @_svg.select('.content')
        button = @_svg.select('.button')
        image = @_svg.select('.image')
        header = @_svg.select('.header')

        lines = (@_svg.select(".line#{i}") for i in [1..5])
        flag = false

        keyb.attr(opacity: 1)
        keyb2.attr(opacity: 1)
        screen1.attr(opacity:1)
        button.attr(fill: '#EFEEED',cx: '55',cy: '80',r: '0',opacity: 0, transform:'translate(-10%,50%)')

        lines[0].attr( opacity: 1)
        lines[2].attr( opacity: 1)
        lines[3].attr(x: '130',y: '92',fill: '#FFFFFF',width: '53.0094948',height: '2', opacity:0)
        lines[4].attr(x: '130',y: '82.25',fill: '#FFFFFF',width: '53.0094948',height: '2', opacity:0)    
        
        keyb.animate(opacity:0, 500, mina.easein)
        keyb2.animate(opacity:0, 500, mina.easein)
        screen1.animate(d: 'M197.7404785,20.3402863H52.2595215C48.2501984,20.3402863,45,23.5904846,45,27.5998077v105.0482635c0,3.8724213,3.1392212,7.0116425,7.0116463,7.0116425h145.9767151c3.8724213,0,7.0116425-3.1392212,7.0116425-7.0116425V27.5998077C205,23.5904846,201.7498016,20.3402863,197.7404785,20.3402863zM188.0126953,131.445694H61.9873047V28.3263798h126.0253906V131.445694z' , 1000)
        button.animate(opacity: 1,r: '5', transform: 'scale(1)', 1000)
        content.animate(opacity: 0, 500)

        lines[0].animate(x: '130',y: '121',fill: '#FFFFFF',width: '53.0094948',height: '2',opacity:1, 1000, mina.easein)
        lines[1].animate(x: '130',y: '111.25',fill: '#FFFFFF',width: '53.0094948',height: '2',opacity:1, 1000, mina.easein)
        lines[2].animate(x: '130',y: '101.5415039',fill: '#FFFFFF',width: '53.0094948',height: '2',opacity:1, 1000, mina.easein)
        lines[3].animate(x: '130',y: '92',fill: '#FFFFFF',width: '53.0094948',height: '2',opacity:1, 1000, mina.easein)
        lines[4].animate(x: '130',y: '82.25',fill: '#FFFFFF',width: '53.0094948',height: '2',opacity:1, 1000, mina.easein)
        image.animate(x: '66.8333359',y: '80', fill: '#F0A512',width: '57.944912',height: '46',opacity:1, 1000, mina.easein)
        header.animate(x: '66.8333282',y: '33.8333321',fill: '#79B72C',width:'116.2086563',opacity:1,height: '39.5', 1000, mina.easein)


        second = ->
            screen1.animate( d: 'M65.3402863,7.2595215v145.480957c0,4.0093231,3.2501984,7.2595215,7.2595215,7.2595215h105.0482635c3.8724213,0,7.0116425-3.1392212,7.0116425-7.0116425V7.0116477C184.6597137,3.1392214,181.5204926,0,177.6480713,0L72.5998077,0C68.5904846,0,65.3402863,3.2501984,65.3402863,7.2595215z M176.445694,16.9873047v126.0253906H73.3263779V16.9873047H176.445694z', 1000)
            button.animate(cx: '125',cy: '150', r:'5',1000)

            blocks.animate(opacity: 0, 100)

            setTimeout ->
                blocks.animate(opacity:1, 500)
            ,1000

            lines[0].animate(x: '79.0833359',y: '122',fill: '#FFFFFF',width: '91.3538513',height: '2',500, mina.easeout)
            lines[1].animate(x: '79.0833359',y: '112.25',fill: '#FFFFFF',width: '91.3538513',height: '2',500, mina.easeout)
            lines[2].animate(x: '79.0833359',y: '131.5415039',width: '91.3538513', 500, mina.easeout)
            lines[3].animate( opacity: 0, 500, mina.easeout)
            lines[4].animate( opacity: 0, 500, mina.easeout)

            image.animate(x: '79.0833282',y: '57',fill: '#F0A512',width: '91.3538513',height: '47', 500, mina.easeout)
            header.animate(x: '79.0833282',y: '22.8333321',fill: '#79B72C',width: '91.7086563',height: '26.833334', 500, mina.easeout)


        last = ->
            screen1.animate( d: 'M82.0139084,7.2595215v145.480957c0,4.0093231,3.2501984,7.2595215,7.2595215,7.2595215h71.9289474c3.8724213,0,7.0116425-3.1392212,7.0116425-7.0116425V7.0116477C168.2140198,3.1392214,165.0747986,0,161.2023773,0L89.2734299,0C85.2641068,0,82.0139084,3.2501984,82.0139084,7.2595215zM160,16.9873047v126.0253906H90V16.9873047H160z' , 1000)
            button.animate(cx: '125',cy: '150',r: '5',1000)
            lines[0].animate(x: '94.75',y: '122',width: '60.1417389',1000)
            lines[1].animate(x: '94.75',y: '112.25',width: '60.1417389',1000)
            lines[2].animate(x: '94.75',y: '131.5415039',fill: '#FFFFFF',width: '60.1417389',height: '2',1000)
            image.animate(x: '94.75',y: '57',fill: '#F0A512',width: '60.1417389',1000)
            header.animate(x: '94.75',y: '22.8333321',fill: '#79B72C',width: '60.3753242',height: '26.833334',1000)

        setTimeout second, 1500
        setTimeout last, 5000
        flag = true
