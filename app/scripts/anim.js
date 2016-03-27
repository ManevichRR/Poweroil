$(function (){
  var tslider=1;
  var si=0;
  var animateClasses = 'flash bounce shake tada swing wobble pulse flip flipInX flipOutX flipInY flipOutY fadeIn fadeInUp fadeInDown fadeInLeft fadeInRight fadeInUpBig fadeInDownBig fadeInLeftBig fadeInRightBig fadeOut fadeOutUp fadeOutDown fadeOutLeft fadeOutRight fadeOutUpBig fadeOutDownBig fadeOutLeftBig fadeOutRightBig bounceIn bounceInDown bounceInUp bounceInLeft bounceInRight bounceOut bounceOutDown bounceOutUp bounceOutLeft bounceOutRight rotateIn rotateInDownLeft rotateInDownRight rotateInUpLeft rotateInUpRight rotateOut rotateOutDownLeft rotateOutDownRight rotateOutUpLeft rotateOutUpRight hinge rollIn rollOut';

var slider_content=[
        {'h1':"GET N100 From Every Purchase", 'p':'Shop Now', 'hain':'flipInY', 'haout':'wobble', 'pain':'bounceInDown', 'paout':'bounceOutDown'},
        {'h1':"We deliver at your door step.", 'p':'Within Lagos only', 'hain':'bounceInRight', 'haout':'flipOutY', 'pain':'bounceInDown', 'paout':'hinge'},

    ]
 setInterval(function () {
        $('.slider').empty();
        $hi= $("<h1 />", {"class": 'glow in tlt'}).text(slider_content[si].h1 );
        $p= $("<p />", {"class":'tlt'}).text(slider_content[si].p );
        $('.slider').append($hi, $p)

      $('.slider h1')
        .fitText(1.5)
        .textillate({ in: { effect: slider_content[si].hain },
                     out: { effect: slider_content[si].haout} ,
                    loop: true
                 });

      $('.slider p')
        .fitText(3.2, { maxFontSize: 18 })
        .textillate({ initialDelay: 1000,
            in: {effect: slider_content[si].pain , delay: 3, shuffle: true },
            out: {effect:slider_content[si].paout},
            loop: true
        }

        );
        si++;
        if(si>1)si=0;
}, 7000)
});
