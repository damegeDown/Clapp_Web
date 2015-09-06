$(document).ready(function() {

    $(window).bind('scroll', function() {
        if ($(window).scrollTop() > 60) {
            $('.subTopContainer').css("margin-top", -60);
            $('#subMenu').css("position", "fixed");
            $('#subMenu').css("top", 0);
            $('.subMTHeaderGraphicContainer').css("margin-top", 140);
            $('.subTAHeaderGraphicContainer').css("margin-top", 140);
            $('.subQAHeaderGraphicContainer').css("margin-top", 140);
            $('.subSIOneContainer').css("margin-top", 140);
            $('.subNoticeOneContainer').css("margin-top", 140);
        } else {
            $('.subTopContainer').css("margin-top", 0);
        }
    });
//클앱 자동화 다운로드 클릭
        var autoJnlpDownload = function(){
            var orgFileName = "Clapp_Automation.zip";
            location.href = "/common/fileDownload?path=download&orgFileName="+orgFileName;
            closePopup('#popCertification');

        };


    //$("iframe").each(function(){
    //    var ifr_source = $(this).attr('src');
    //    var wmode = "wmode=transparent";
    //    if(ifr_source.indexOf('?') != -1) $(this).attr('src',ifr_source+'&'+wmode);
    //    else $(this).attr('src',ifr_source+'?'+wmode);
    //});

//	/* Main Slider */
//	$('.mSliderRightArrow').click(function() {
//			$('.mSliderLayer1').css("display", "none");
//			$('.mSliderLayer2').css("display", "block");
//	});
//	$('.mSliderLeftArrow').click(function() {
//			$('.mSliderLayer2').css("display", "none");
//			$('.mSliderLayer1').css("display", "block");
//	});
//
//    /** Main Slider Text Box **/
//    $('.mSliderContent1').mouseover(function() {
//        //$('.mSliderTextBox1').css("display", "none");
//    });
//    $('.mSliderContent1 img').mouseout(function() {
//       // $('.mSliderTextBox1').css("display", "block");
//    });
//// 롤오버 텍스트 사라짐
//    $('.mSliderLayer2').mouseout(function() {
//        $(this).find('p').css("display", "block");
//    }).mouseover(function(){
//        $(this).find('p').css("display", "none");
//    });

    /** Main Slider Text Box **/

    $('.mSliderLayer2').mouseout(function() {
        $(this).find('p').css("display", "block");
    }).mouseover(function(){
        $(this).find('p').css("display", "none");
    });

    /** Main GNB Fixed **/
    /* Main Menu */
	$('.mGnbLi1').mouseover(function() {
			$('.mGnbSub1').css("display", "block");
			$('.mGnbSub1').css("width", "159");
			$('.mGnbSub1').css("height", "240");
			$('.mGnbSub1').css("position", "absolute");
			$('.mGnbSub1').css("margin-top", "1px");
			$('.mGnbSub1').fadeIn(1000);

	});

	$('.mGnbLi1').mouseout(function() {
		$('.mGnbSub1').hide();
	});

	$('.mGnbLi2').mouseover(function() {
			$('.mGnbSub2').css("display", "block");
			$('.mGnbSub2').css("width", "159");
			$('.mGnbSub2').css("height", "240");
			$('.mGnbSub2').css("position", "absolute");
			$('.mGnbSub2').css("margin-top", "1px");
			$('.mGnbSub2').fadeIn(1000);

	});
	$('.mGnbLi2').mouseout(function() {
		$('.mGnbSub2').hide();
	});

	$('.mGnbLi3').mouseover(function() {
			$('.mGnbSub3').css("display", "block");
			$('.mGnbSub3').css("width", "159");
			$('.mGnbSub3').css("height", "240");
			$('.mGnbSub3').css("position", "absolute");
			$('.mGnbSub3').css("margin-top", "1px");
			$('.mGnbSub3').fadeIn(1000);

	});
	$('.mGnbLi3').mouseout(function() {
		$('.mGnbSub3').hide();
	});

	$('.mGnbLi4').mouseover(function() {
			$('.mGnbSub4').css("display", "block");
			$('.mGnbSub4').css("width", "159");
			$('.mGnbSub4').css("height", "240");
			$('.mGnbSub4').css("position", "absolute");
			$('.mGnbSub4').css("margin-top", "1px");
			$('.mGnbSub4').fadeIn(1000);

	});
	$('.mGnbLi4').mouseout(function() {
		$('.mGnbSub4').hide();
	});

	$('.mGnbLi5').mouseover(function() {
			$('.mGnbSub5').css("display", "block");
			$('.mGnbSub5').css("width", "159");
			$('.mGnbSub5').css("height", "240");
			$('.mGnbSub5').css("position", "absolute");
			$('.mGnbSub5').css("margin-top", "1px");
			$('.mGnbSub5').fadeIn(1000);

	});
	$('.mGnbLi5').mouseout(function() {
		$('.mGnbSub5').hide();
	});

});

/** Main GNB Fixed **/
	$(window).bind('scroll', function() {
		 if ($(window).scrollTop() > 500) {
			 $('#wrapBgGnb').addClass('fixed');
			 $('#wrapBgGnb').css('top', -8);
			 $('#wrapBgGnb').css('z-index', 99);
			 $('.GnbStartButton').css('margin-top', 10);
			 $('.mSliderTextBox1').css('margin-top', -100);
			 $('.mSliderTextBox2').css('margin-top', -100);
			 $('.mSliderTextBox3').css('margin-top', -100);
			 $('.mSliderTextBox4').css('margin-top', -100);
			 $('.mSliderTextBox5').css('margin-top', -100);
			 $('.mSliderTextBox6').css('margin-top', -100);
			 $('.mSliderTextBox7').css('margin-top', -100);
			 $('.mSliderTextBox8').css('margin-top', -100);
			 $('.mSliderTextBox9').css('margin-top', -100);
			 $('.mSliderTextBox10').css('margin-top', -100);
			 $('.mSliderTextBox11').css('margin-top', -100);
		 }
		 else {
			 $('#wrapBgGnb').removeClass('fixed');
			 $('#wrapBgGnb').css('top', 500);
			 $('.GnbStartButton').css('margin-top', -28);
			 $('.mSliderTextBox1').css('margin-top', 0);
			 $('.mSliderTextBox2').css('margin-top', 0);
			 $('.mSliderTextBox3').css('margin-top', 0);
			 $('.mSliderTextBox4').css('margin-top', 0);
			 $('.mSliderTextBox5').css('margin-top', 0);
			 $('.mSliderTextBox6').css('margin-top', 0);
			 $('.mSliderTextBox7').css('margin-top', 0);
			 $('.mSliderTextBox8').css('margin-top', 0);
			 $('.mSliderTextBox9').css('margin-top', 0);
			 $('.mSliderTextBox10').css('margin-top', 0);
			 $('.mSliderTextBox11').css('margin-top', 0);
		 }
	});

/** floating  **/

	$(window).bind('scroll', function() {
		 if ($(window).scrollTop() > 160) {
			 $('.floating').css("display", "block");
			 if ($(window).width() > 1800) {
			 	 $('.floating').css("right", 300);
			 }
			 if ($(window).width() < 960) {
			 	 $('.floating').css("display", "none");
			 }
		}
		else {
			 $('.floating').css("display", "none");
		}
	});


/** Mobile Testing Slider **/

	$('.mtSliderRightArrow').click(function() {
			$('.subMTSliderLayer1').css("display", "none");
			$('.subMTSliderLayer2').css("display", "block");
	});
	$('.mtSliderLeftArrow').click(function() {
			$('.subMTSliderLayer2').css("display", "none");
			$('.subMTSliderLayer1').css("display", "block");
	});


	$('.sMSL1LBLeft').mouseover(function() {
		$('.mtSliderTextBox1').css("display", "block");
	});
	$('.sMSL1LBLeft').mouseout(function() {
		$('.mtSliderTextBox1').css("display", "none");
	});
	$('.sMSL1LBRight').mouseover(function() {
		$('.mtSliderTextBox2').css("display", "block");
	});
	$('.sMSL1LBRight').mouseout(function() {
		$('.mtSliderTextBox2').css("display", "none");
	});
	$('.sMSL1RTLeft').mouseover(function() {
		$('.mtSliderTextBox3').css("display", "block");
	});
	$('.sMSL1RTLeft').mouseout(function() {
		$('.mtSliderTextBox3').css("display", "none");
	});
	$('.sMSL1RTRight').mouseover(function() {
		$('.mtSliderTextBox4').css("display", "block");
	});
	$('.sMSL1RTRight').mouseout(function() {
		$('.mtSliderTextBox4').css("display", "none");
	});
	$('.sMSL1RBLeft').mouseover(function() {
		$('.mtSliderTextBox5').css("display", "block");
	});
	$('.sMSL1RBLeft').mouseout(function() {
		$('.mtSliderTextBox5').css("display", "none");
	});

	$('.sMSL2LBLeft').mouseover(function() {
		$('.mtSliderTextBox6').css("display", "block");
	});
	$('.sMSL2LBLeft').mouseout(function() {
		$('.mtSliderTextBox6').css("display", "none");
	});
	$('.sMSL2LBRight').mouseover(function() {
		$('.mtSliderTextBox7').css("display", "block");
	});
	$('.sMSL2LBRight').mouseout(function() {
		$('.mtSliderTextBox7').css("display", "none");
	});
	$('.sMSL2RTLeft').mouseover(function() {
		$('.mtSliderTextBox8').css("display", "block");
	});
	$('.sMSL2RTLeft').mouseout(function() {
		$('.mtSliderTextBox8').css("display", "none");
	});
	$('.sMSL2RTRight').mouseover(function() {
		$('.mtSliderTextBox9').css("display", "block");
	});
	$('.sMSL2RTRight').mouseout(function() {
		$('.mtSliderTextBox9').css("display", "none");
	});
	$('.sMSL2RBLeft').mouseover(function() {
		$('.mtSliderTextBox10').css("display", "block");
	});
	$('.sMSL2RBLeft').mouseout(function() {
		$('.mtSliderTextBox10').css("display", "none");
	});





/**Test Auto Slider**/

	$('.mtSliderRightArrow').click(function() {
			$('.subTASliderLayer1').css("display", "none");
			$('.subTASliderLayer2').css("display", "block");
	});
	$('.mtSliderLeftArrow').click(function() {
			$('.subTASliderLayer2').css("display", "none");
			$('.subTASliderLayer1').css("display", "block");
	});

	/** TA Slider **/
	$('.sTASL1LBLeft').mouseover(function() {
		$('.taSliderTextBox1').css("display", "block");
	});
	$('.sTASL1LBLeft').mouseout(function() {
		$('.taSliderTextBox1').css("display", "none");
	});
	$('.sTASL1LBRight').mouseover(function() {
		$('.taSliderTextBox2').css("display", "block");
	});
	$('.sTASL1LBRight').mouseout(function() {
		$('.taSliderTextBox2').css("display", "none");
	});
	$('.sTASL1RTLeft').mouseover(function() {
		$('.taSliderTextBox3').css("display", "block");
	});
	$('.sTASL1RTLeft').mouseout(function() {
		$('.taSliderTextBox3').css("display", "none");
	});
	$('.sTASL1RTRight').mouseover(function() {
		$('.taSliderTextBox4').css("display", "block");
	});
	$('.sTASL1RTRight').mouseout(function() {
		$('.taSliderTextBox4').css("display", "none");
	});
	$('.sTASL1RBLeft').mouseover(function() {
		$('.taSliderTextBox5').css("display", "block");
	});
	$('.sTASL1RBLeft').mouseout(function() {
		$('.taSliderTextBox5').css("display", "none");
	});

	$('.sTASL2LBLeft').mouseover(function() {
		$('.taSliderTextBox6').css("display", "block");
	});
	$('.sTASL2LBLeft').mouseout(function() {
		$('.taSliderTextBox6').css("display", "none");
	});
	$('.sTASL2LBRight').mouseover(function() {
		$('.taSliderTextBox7').css("display", "block");
	});
	$('.sTASL2LBRight').mouseout(function() {
		$('.taSliderTextBox7').css("display", "none");
	});
	$('.sTASL2RTLeft').mouseover(function() {
		$('.taSliderTextBox8').css("display", "block");
	});
	$('.sTASL2RTLeft').mouseout(function() {
		$('.taSliderTextBox8').css("display", "none");
	});
	$('.sTASL2RTRight').mouseover(function() {
		$('.taSliderTextBox9').css("display", "block");
	});
	$('.sTASL2RTRight').mouseout(function() {
		$('.taSliderTextBox9').css("display", "none");
	});
	$('.sTASL2RBLeft').mouseover(function() {
		$('.taSliderTextBox10').css("display", "block");
	});
	$('.sTASL2RBLeft').mouseout(function() {
		$('.taSliderTextBox10').css("display", "none");
	});


    $(document).on("scroll", onScroll);


    $('a[href^="#"]').on('click', function (e) {
        e.preventDefault();
        $(document).off("scroll");

        $('a').each(function () {
            $(this).removeClass('active');
        })
        $(this).addClass('active');

        var target = this.hash,
            menu = target;
        $target = $(target);
        $('html, body').stop().animate({'scrollTop': $target.offset().top}, 500, 'swing', function () {
            window.location.hash = target;
            $(document).on("scroll", onScroll);
        });
    });


function onScroll(event){
    var scrollPos = $(document).scrollTop()
    $('.subMTGnbBottom a').each(function () {
        var currLink = $(this);
        var refElement = $(currLink.attr("href"));
        if (refElement.position().top <= scrollPos && refElement.position().top + refElement.height() > scrollPos) {
            $('.subMTGnbBottom ul li.smtgbItem a').removeClass("active");
            currLink.addClass("active");
        }
        else{
            currLink.removeClass("active");
        }
    });
}


