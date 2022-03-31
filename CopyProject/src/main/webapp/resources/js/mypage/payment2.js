var productAmount = document.getElementById("productAmount");
var proPrice1 = parseInt(document.getElementById("proPrice1").value);
var proPrice2 = parseInt(document.getElementById("proPrice2").value);
var proPrice3 = parseInt(document.getElementById("proPrice3").value);
var proCnt1 = parseInt(document.getElementById("proCnt1").value);
var proCnt2 = parseInt(document.getElementById("proCnt2").value);
var proCnt3 = parseInt(document.getElementById("proCnt3").value);
var amount = document.getElementById("amount");
productAmount.value = (proPrice1*proCnt1) + (proPrice2*proCnt2) + (proPrice3*proCnt3);
amount.value = productAmount.value;
	