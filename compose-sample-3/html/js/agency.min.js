/*!
 * Start Bootstrap - Agency v4.0.0-alpha (http://startbootstrap.com/template-overviews/agency)
 * Copyright 2013-2017 Start Bootstrap
 * Licensed under MIT (https://github.com/BlackrockDigital/startbootstrap/blob/gh-pages/LICENSE)
 */
!function(a){"use strict";a("a.page-scroll").bind("click",function(n){var o=a(this);a("html, body").stop().animate({scrollTop:a(o.attr("href")).offset().top-54},1250,"easeInOutExpo"),n.preventDefault()}),a("body").scrollspy({target:"#mainNav",offset:54}),a(".navbar-collapse>ul>li>a").click(function(){a(".navbar-collapse").collapse("hide")}),a(window).scroll(function(){a("#mainNav").offset().top>100?a("#mainNav").addClass("navbar-shrink"):a("#mainNav").removeClass("navbar-shrink")})}(jQuery);