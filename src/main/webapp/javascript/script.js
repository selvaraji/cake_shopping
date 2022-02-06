
//hide all category
function listhide() {
    var categoryCount = document.getElementById("categoryCount").value;
    for(let i=0; i<categoryCount;i++)
    {
		   	var functionid = document.getElementById("cat"+i);
		    functionid.style.display = 'none';
	}
}

//login
function login() {
    var email = document.getElementById("email").value;
    var pass = document.getElementById("Pass").value;
    if(email == "admin" && pass == "admin") 
        window.location.href = "admin.html";
    else if(email =="" || pass == "")
    {
        //
    }
    else
    {
        window.location.href = "user.html";
    }
}

//signup
function signup() {
    alert("Account Successfully Created");
    window.location.href = "login.html";
}

//patterns
var patternSmall = new RegExp("(?=.*[a-z])");
var patternAlpha = new RegExp("^[a-zA-Z]+$");
var patternCab = new RegExp("(?=.*[A-Z])");
var patternSpecial = new RegExp("(?=.*[!@#$%^&*])");
var patternNumber = new RegExp("(?=.*[0-9])");
//var patternEmail = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
var patternPNO = new RegExp("^[6-9]+[0-9]+$");
	  
//name validate
var nameText = document.getElementById("name");
if(nameText)
{
	nameText.addEventListener("input", function(){
		var nameValue = document.getElementById("name").value;
		if(!patternAlpha.test(nameValue))
			{
				nameText.setCustomValidity("Alphabet characters only allowed");
				nameText.reportValidity();``
				return;
			}
		else
		{
			nameText.setCustomValidity("");
			nameText.reportValidity();
			return;
		}
	});
	
}


//phone number validate
var phone = document.getElementById("phoneNumber");
if(phone)
{
	
	phone.addEventListener("input",function()
	{
		var phoneNumber = document.getElementById("phoneNumber").value;
		if(!patternPNO.test(phoneNumber))
			{
				phone.setCustomValidity("Enter a valid phone number");
				phone.reportValidity();
				return;
			}
		else
		{
			phone.setCustomValidity("");
			phone.reportValidity();
			return;
		}
	});
}


//


//password validate
var pass = document.getElementById("Pass");
if(pass)
	
	pass.addEventListener("input",function()
	{
		pass.setCustomValidity("");
		//pass.reportValidity();
		var password =document.getElementById("Pass").value;
		console.log(password);
		
	if(!patternSmall.test(password))
	 {
		pass.setCustomValidity("Password must contain atleast one small character");
		pass.reportValidity();
		return;
	 }
	 else
	 {
		if(!patternCab.test(password))
		 {
			pass.setCustomValidity("Password must contain atleast one capital character");
		 	pass.reportValidity();
		 	return;
		 }
		 else
		 {
			if(!patternSpecial.test(password))
	 			{
				pass.setCustomValidity("Password must contain atleast one special character");
				pass.reportValidity();
				return;
				}
				else
				{
					if(!patternNumber.test(password))
	 					{
							pass.setCustomValidity("Password must contain atleast one number");
							pass.reportValidity();
							return;
						}
						else
						{
							/*if(!patternLength.test(password))
								{
								pass.setCustomValidity("Password must be 8 or more characters long");
								pass.reportValidity();
								return;
								}*/
								pass.setCustomValidity("");
								pass.reportValidity();
								return;
						}
				}
		}
	}
	});
	
// password match
var pass2 = document.getElementById("Pass2");
if(pass2)
{
	pass2.addEventListener("input", function(){
    var passwordOne = document.getElementById("Pass").value;
	var passwordTwo = document.getElementById("Pass2").value;
	
	if(passwordOne == passwordTwo)
	{
		pass2.setCustomValidity("");
		pass2.reportValidity();
		return;
	}
	else
	{
		pass2.setCustomValidity("Password mismatch");
		pass2.reportValidity();
		return;
	}
	});
}

 
//design page
function design() {
    window.location.href = "design.html";
}



function addcake()
{
	var category = document.getElementById("category").value;
	
	if(category== "none")
	{
		alert("Select Category type");
		return false;
	}
	else
	{
		alert("new Cake model successfully added");
		return true;
	}
}

function updatecake()
{
	var id = document.getElementById("id").value;
	
	if(id== "none")
	{
		alert("Select product ID");
		return false;
	}
	else
	{
		alert("Cake model Updated");
		return true;
	}
}


