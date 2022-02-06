
var patternNumber = new RegExp(".*[0-9]+$");
var patternAlpha = new RegExp('^[a-zA-Z]+$');
var patterenValid = new RegExp(/\d+\d+\/+\d+\d/);
var patterenCvv = new RegExp(".*[0-9]+$");
var nameText = document.getElementById("cardName");

if(nameText)
{
	
	nameText.addEventListener("input",function()
	{
		var nameValue = document.getElementById("cardName").value;
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

var numberText = document.getElementById("cardNumber");
if(numberText)
{
	
	numberText.addEventListener("input",function()
	{
		var numberValue = document.getElementById("cardNumber").value;
		if(!patternNumber.test(numberValue))
			{
				numberText.setCustomValidity("Numbers only allowed");
				numberText.reportValidity();``
				return;
			}
		else
		{
			numberText.setCustomValidity("");
			numberText.reportValidity();
			return;
		}
	});
}

var validText = document.getElementById("valid");
if(validText)
{
	
	validText.addEventListener("input",function()
	{
		var validValue = document.getElementById("valid").value;
		if(!patterenValid.test(validValue))
			{
				validText.setCustomValidity("Enter mm/yy format");
				validText.reportValidity();``
				return;
			}
		else
		{
			validText.setCustomValidity("");
			validText.reportValidity();
			return;
		}
	});
}


var cvvText = document.getElementById("cvv");
if(cvvText)
{
	
	cvvText.addEventListener("input",function()
	{
		var cvvValue = document.getElementById("cvv").value;
		if(!patterenCvv.test(cvvValue))
			{
				cvvText.setCustomValidity("Only Numbers Allowed");
				cvvText.reportValidity();``
				return;
			}
		else
		{
			cvvText.setCustomValidity("");
			cvvText.reportValidity();
			return;
		}
	});
}
