const item1 = document.getElementById("text1");
const item2 = document.getElementById("text2");
const item3 = document.getElementById("text3");
const item4 = document.getElementById("text4");
const item5 = document.getElementById("text5");
const item6 = document.getElementById("text6");
const item7 = document.getElementById("text7");
const item8 = document.getElementById("text8");
const pop = document.getElementById("pop");

setInterval(() => {
	const randomColor = Math.floor(Math.random()*16777215).toString(16);
	item1.style.color = "#"+randomColor;
	item2.style.color = "#"+randomColor;
	item3.style.color = "#"+randomColor;
	item4.style.color = "#"+randomColor;
	item5.style.color = "#"+randomColor;
	item6.style.color = "#"+randomColor;
	item7.style.color = "#"+randomColor;
	item8.style.color = "#"+randomColor;
	pop.style.background = "#"+randomColor;
	}, 1000);
	
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length)
   {
	slideIndex = 1;
	}    
  slides[slideIndex-1].style.display = "block";  
  setTimeout(showSlides, 2000);
}

function show(search)
{
	//hideothers(-1);
}



function search()
{
	var item = document.getElementById("search").value;
	window.location.href = "../html/search.jsp?search="+item;
	
}