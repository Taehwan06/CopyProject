function searchFn(){
	document.searchFrm.method = "GET";
	document.searchFrm.action = contextPath+"/search.do";
	document.searchFrm.submit();
}

function modalSearchFn(){
	document.modalSearchFrm.method = "GET";
	document.modalSearchFrm.action = contextPath+"/search.do";
	document.modalSearchFrm.submit();
}

function colorFn(obj){
   $(".abtn").not(".collapsed").css("color", "white");
   $(".collapsed").css("color", "black");
   
   if($(obj).hasClass("collapsed") === true) {
      $(obj).css("color", "#ffb6c1");
   }
   
   $(obj).not(".collapsed").mouseover(function(){
      $(obj).css("color", "white");
   });

   $(obj).not(".collapsed").mouseleave(function(){
      $(obj).css("color", "white");
   });
   
   $(".collapsed").mouseover(function(){
      $(this).css("color", "#ffb6c1");
   });

   $(".collapsed").mouseleave(function(){
      $(this).css("color", "black");
   });
   
   $(".abtn").not(obj).mouseover(function(){
      $(this).not(obj).css("color", "#ffb6c1");
   });

   $(".abtn").not(obj).mouseleave(function(){
      $(this).not(obj).css("color", "black");
   });
}

/*function colorFn2(){
	$("#abtn1").css("color", "black");
	$("#abtn2").css("color", "white");
	
	$("#abtn2").mouseover(function(){
		$("#abtn2").css("color", "white");
	});

	$("#abtn2").mouseleave(function(){
		$("#abtn2").css("color", "white");
	});
	
	$("#abtn1").mouseover(function(){
		$("#abtn1").css("color", "#ffb6c1");
	});

	$("#abtn1").mouseleave(function(){
		$("#abtn1").css("color", "black");
	});
}*/