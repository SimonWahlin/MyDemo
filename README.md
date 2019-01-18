## MyDemo
This is just some demo repository

```PowerShell
Function Move-Printer {
	#functions called will throw from inside function if errors occur
param(
	[Parameter(Mandatory=$true)]
	[string]$printer,
	[Parameter(Mandatory=$true)]
	[string]$network
)
	if ($printer -match '^SEP\d{5}$' -and $network -match '^([0-9]{1,3}\.){3}[0-9]{1,3}\/24$') 
	{ 
	Write-Host will attempt to move $printer to $network ...
	} 
	else 
	{
	 throw "bad name or network specified" 
	}

		Write-host looking for available ips in $network.... `n 
		[string]$targetip = Get-Freeip $network

		Write-Host Removing $printer A/PTR and moving it to $targetip
		Remove-Printer $printer
		Write-Host `nnow recreating A/PTR in target network
		New-Printer $printer $targetip
}
```
