function settimer()
{
	setInterval("intervaltxt()",1000);
	setTimeout("nextques()",10000);
	window.status=10;
}
function intervaltxt()
{
	window.status=window.status-1;
}
function nextques()
{
	
	var ques=document.getElementById("quesno").innerHTML;
	var quesno=Number(ques);
	var answer=document.getElementById("ans").value;
	var choose=document.getElementsByName("gr");
	var val=document.getElementById("score").value;
	var hdTotQues=document.getElementById("hdTotQues").value;

	var choosen;
	for(var i=0;i<choose.length;i++)
	{
		if(choose[i].checked)
		choosen=choose[i].value;
	}
	if(answer==choosen)val++;
	else val--;
	quesno++;
	if(quesno<=hdTotQues)
	{
		location.href="exam.aspx?ques=" + quesno + "&val=" + val;
	}
	else
	{
		location.href="end.aspx?val=" + val;
	}
	
	//location.href=
}
function checkstat()
{
	var selcheck=document.getElementsByName("gr_" + document.getElementById("but").value);
	var spantxt=document.getElementById("chklst");
	spantxt.innerHTML="<font color=red>You have Selected: <br>";
	for(var i=0;i<selcheck.length;i++)
	{
		if(selcheck[i].checked)
		spantxt.innerHTML +=selcheck[i].value;
		
	}
}

