function selChange(nowPage) {
	var sel = document.getElementById("cntPerPage").value;
	location.href="member_list.do?nowPage="+nowPage+"&cntPerPage="+sel;
}