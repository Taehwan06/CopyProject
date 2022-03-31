function searchFn(){
	document.searchFrm.method = "GET";
	document.searchFrm.action = "/controller/search.do";
	document.searchFrm.submit();
}

function modalSearchFn(){
	document.modalSearchFrm.method = "GET";
	document.modalSearchFrm.action = "/controller/search.do";
	document.modalSearchFrm.submit();
}
