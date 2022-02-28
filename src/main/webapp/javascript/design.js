
/**function shapeClick(num)
{
	document.getElementById("shape").src = num;
}**/

function sideClick(num)
{
	document.getElementById("side").src = num;
}

function topClick(num)
{
	document.getElementById("upper").src = num;
}


function buy()
{
	let side = document.getElementById("side").src;
	let upper = document.getElementById("upper").src
	
	window.location.href = "designBuy.jsp?pic="+upper+"~"+side;
	
}