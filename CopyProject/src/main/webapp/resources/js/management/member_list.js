function selChange(nowPage) {
	/*var sel = document.getElementById("cntPerPage").value;
	location.href="member_list.do?nowPage="+nowPage+"&cntPerPage="+sel;*/
	document.sectionSearchFrm.method = "get";
	document.sectionSearchFrm.action = "member_list.do";
	document.sectionSearchFrm.submit();
}