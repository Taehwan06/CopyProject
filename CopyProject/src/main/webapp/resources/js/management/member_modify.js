function modifyFn(nowPage, searchType, searchValue){
	$("#nowPage").val(nowPage);
	$("#searchType").val(searchType);
	$("#searchValue").val(searchValue);
	document.memberModifyFrm.method = "post";
	document.memberModifyFrm.action = "modifyMember.do";
	document.memberModifyFrm.submit();
}

function cancelFn(nowPage, searchType, searchValue){
	$("#nowPage").val(nowPage);
	$("#searchType").val(searchType);
	$("#searchValue").val(searchValue);
	document.memberModifyFrm.method = "get";
	document.memberModifyFrm.action = "member_view.do";
	document.memberModifyFrm.submit();
}

function imgDelFn(nowPage, searchType, searchValue, name){
	var result = confirm(name+" 회원님의 프로필 이미지를 삭제하시겠습니까?");
	if(result){
		$("#nowPage").val(nowPage);
		$("#searchType").val(searchType);
		$("#searchValue").val(searchValue);
		document.memberModifyFrm.method = "post";
		document.memberModifyFrm.action = "imgDelMember.do";
		document.memberModifyFrm.submit();
	}
}