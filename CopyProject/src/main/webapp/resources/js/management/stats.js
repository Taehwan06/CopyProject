function selChange(nowPage) {
	/*var sel = document.getElementById("cntPerPage").value;
	location.href="stats.do?nowPage="+nowPage+"&cntPerPage="+sel;*/
	document.sectionSearchFrm.method = "get";
	document.sectionSearchFrm.action = "stats.do";
	document.sectionSearchFrm.submit();
}

function periodChange() {
	document.sectionSearchFrm.method = "get";
	document.sectionSearchFrm.action = "stats.do";
	document.sectionSearchFrm.submit();
}