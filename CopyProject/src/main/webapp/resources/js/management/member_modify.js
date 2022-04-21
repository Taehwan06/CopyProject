function modifyFn(nowPage, searchType, searchValue, cntPerPage){
	$("#nowPage").val(nowPage);
	$("#searchType").val(searchType);
	$("#searchValue").val(searchValue);
	$("#cntPerPage").val(cntPerPage);
	document.memberModifyFrm.method = "post";
	document.memberModifyFrm.action = "modifyMember.do";
	document.memberModifyFrm.submit();
}

function cancelFn(nowPage, searchType, searchValue, cntPerPage){
	$("#nowPage").val(nowPage);
	$("#searchType").val(searchType);
	$("#searchValue").val(searchValue);
	$("#cntPerPage").val(cntPerPage);
	document.memberModifyFrm.method = "get";
	document.memberModifyFrm.action = "member_view.do";
	document.memberModifyFrm.submit();
}

function imgDelFn(nowPage, searchType, searchValue, name, cntPerPage){
	
	swal({
		text: name+" 회원님의 프로필 이미지를 삭제하시겠습니까?",
		icon: "warning",
		buttons: [" 취소 ", " 확인 "],
		dangerMode: false,
	})
	.then((willDelete) => {
		if (willDelete) {
			$("#nowPage").val(nowPage);
			$("#searchType").val(searchType);
			$("#searchValue").val(searchValue);
			$("#cntPerPage").val(cntPerPage);
			document.memberModifyFrm.method = "post";
			document.memberModifyFrm.action = "imgDelMember.do";
			document.memberModifyFrm.submit();
		}
	});
}