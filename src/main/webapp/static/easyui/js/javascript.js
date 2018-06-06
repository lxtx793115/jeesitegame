// JavaScript Document
/*----左侧导航特效-------*/
$(function(){
	/*-----以下是导航标题下的小标题显示-----*/
	$('.as span').click(function(e) {
		if($(this).siblings().css('display')=='none'){
                $(this).siblings().css('display','block')

        } else{$(this).siblings().css('display','none')}               

    });
	/*-------以下是点击小标题特效-----------*/
	$('.close1 li').click(function(e) {
		
    	$(this).addClass('current').siblings().removeClass()
		$('.close2 li').removeClass()
		$('.close3 li').removeClass()
		$('.close4 li').removeClass()
    });
	$('.close2 li').click(function(e) {
		
    	$(this).addClass('current').siblings().removeClass();
		$('.close1 li').removeClass()
		$('.close3 li').removeClass()
		$('.close4 li').removeClass()
    });
	$('.close3 li').click(function(e) {
		
    	$(this).addClass('current').siblings().removeClass();
		$('.close1 li').removeClass()
		$('.close2 li').removeClass()
		$('.close4 li').removeClass()
    });
	$('.close4 li').click(function(e) {
		
    	$(this).addClass('current').siblings().removeClass();
		$('.close1 li').removeClass()
		$('.close2 li').removeClass()
		$('.close3 li').removeClass()
    });
	/*--------表格样式-----------------*/
	$('table tr').mouseover(function(e) {
		$(this).css("background","#ececec")
        
    });
	$('table tr').mouseout(function(e) {
		$(this).css("background","#fff")
        
    });
	/*--------------下面是副标题（tab标签）切换特效---------------*/
	$('.title1 span').click(function(e) {
        $(this).addClass('current4').siblings().removeClass();
   		$('.max li').eq($(this).index()).addClass('display').siblings().removeClass();
		
    });
	/*---------------下面是大标题特效------------------*/

	$('.h2_c li').click(function(e) {
        $(this).addClass('current3').siblings().removeClass();
		$('.max li').eq($(this).index()).addClass('display').siblings().removeClass();
    });









})
