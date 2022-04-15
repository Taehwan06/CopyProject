function selChange(nowPage) {
	var sel = document.getElementById("cntPerPage").value;
	location.href="stats.do?nowPage="+nowPage+"&cntPerPage="+sel;
}