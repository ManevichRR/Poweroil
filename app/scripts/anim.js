$(function (){
  var tslider=1;
  var si=0;
  var animateClasses = 'flash bounce shake tada swing wobble pulse flip flipInX flipOutX flipInY flipOutY fadeIn fadeInUp fadeInDown fadeInLeft fadeInRight fadeInUpBig fadeInDownBig fadeInLeftBig fadeInRightBig fadeOut fadeOutUp fadeOutDown fadeOutLeft fadeOutRight fadeOutUpBig fadeOutDownBig fadeOutLeftBig fadeOutRightBig bounceIn bounceInDown bounceInUp bounceInLeft bounceInRight bounceOut bounceOutDown bounceOutUp bounceOutLeft bounceOutRight rotateIn rotateInDownLeft rotateInDownRight rotateInUpLeft rotateInUpRight rotateOut rotateOutDownLeft rotateOutDownRight rotateOutUpLeft rotateOutUpRight hinge rollIn rollOut';

var slider_content=[
        {'h2':"Get reward points from every buy", 'p':'Poweroil Bottles only', 'hain':'flipInY', 'haout':'wobble', 'pain':'bounceInDown', 'paout':'swing'},
        {'h2':"FREE Delivery to your doorstep.", 'p':'Within Lagos only', 'hain':'tada', 'haout':'flipOutY', 'pain':'bounceInDown', 'paout':'pulse'},

    ]
 setInterval(function () {
        $('.po-slider').empty();
        $hi= $("<h2 />", {"class": 'glow in tlt'}).text(slider_content[si].h2 );
        $p= $("<p />", {"class":'tlt'}).text(slider_content[si].p );
        $('.po-slider').append($hi, $p)

      $('.po-slider h2')
        .fitText(1.9)
        .textillate({ in: { effect: slider_content[si].hain },
                     out: { effect: slider_content[si].haout} ,
                    loop: true
                 });

      $('.po-slider p')
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
