function apri(scelta)
{
	document.getElementById("scelta"+scelta).classList.remove("red");
	document.getElementById("scelta"+scelta).classList.add("green");
	switch(scelta)
	{
		case 0:
			WshShell = new ActiveXObject("WScript.Shell");
			WshShell.Run("init.sh");
		break;
		
		case 1:
			WshShell = new ActiveXObject("WScript.Shell");
			WshShell.Run("forward.sh");
		break;
	}
}