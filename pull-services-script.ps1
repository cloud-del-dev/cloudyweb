#list & save the output of roles to a json file
aws iam list-roles | Out-File -FilePath .\output.json

#Set output to a readable file
$s = Get-Content -Raw "output.json" | ConvertFrom-Json 

foreach ($role in $s.roles) {
  $effect = $role.AssumeRolePolicyDocument.Statement.Effect
  $serviceid = $role.AssumeRolePolicyDocument.Statement.Principal.Service
  $service = "$($serviceid)".TrimEnd(".amazonaws.com")
  ForEach-Object {
    Write-Output "## $service  "
    Write-Output "  "
    Write-Output "Description = TBD  "
    Write-Output "  "
    Write-Output "Effect = $effect"
    Write-Output "  "
  } | Out-File -FilePath .\"$($service)".md -encoding utf8
}




