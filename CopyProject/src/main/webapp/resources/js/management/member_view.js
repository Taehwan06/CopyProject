function withdrawFn(midx,name,nowPage,searchType,searchValue){
	var result = confirm(name+" 회원님을 강제 탈퇴하시겠습니까?");
	if(result){
		$("#midx").val(midx);
		$("#nowPage").val(nowPage);
		$("#searchType").val(searchType);
		$("#searchValue").val(searchValue);
		document.inifoFrm.method="post";
		document.inifoFrm.action="withdrawMember.do";
		document.inifoFrm.submit();
	}
}

function restoreFn(midx,name,nowPage,searchType,searchValue){
	var result = confirm(name+" 회원님을 탈퇴 복구하시겠습니까?");
	if(result){
		$("#midx").val(midx);
		$("#nowPage").val(nowPage);
		$("#searchType").val(searchType);
		$("#searchValue").val(searchValue);
		document.inifoFrm.method="post";
		document.inifoFrm.action="restoreMember.do";
		document.inifoFrm.submit();
	}
}

function modifyFn(midx,nowPage,searchType,searchValue){
	$("#midx").val(midx);
	$("#nowPage").val(nowPage);
	$("#searchType").val(searchType);
	$("#searchValue").val(searchValue);
	document.inifoFrm.method="post";
	document.inifoFrm.action="member_modify.do";
	document.inifoFrm.submit();
}

function listFn(midx,nowPage,searchType,searchValue){
	$("#midx").val(midx);
	$("#nowPage").val(nowPage);
	$("#searchType").val(searchType);
	$("#searchValue").val(searchValue);
	document.inifoFrm.method="get";
	document.inifoFrm.action="member_list.do";
	document.inifoFrm.submit();
}