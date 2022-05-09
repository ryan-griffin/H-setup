$date = (Get-Date).AddDays(5-((Get-Date).DayOfWeek.value__))
$year = $date.addYears(-1).toString("yyyy") + "_" + $date.toString("yyyy")
$week = $date.toString("WE_MM_dd_yy")
Write-Host "1. Pro"
Write-Host "2. Web"
$type = Read-host "Enter week type"
while (($type -ne "1") -and ($type -ne "pro") -and ($type -ne "2") -and ($type -ne "web")) {
    Write-Host "Invalid type"
    $type = Read-Host "Enter week type"
}
foreach ($day in "Mon", "Tue", "Wed", "Thu", "Fri") {
    try {
        if (($type -eq "1") -or ($type -eq "pro")) {
            $null = mkdir "H:\$year\$week\Pro\$day" -ErrorAction Stop
        } elseif (($type -eq "2") -or ($type -eq "web")) {
            $null = mkdir "H:\$year\$week\Web\$day" -ErrorAction Stop
        }
    } catch {}
}
try {$null = mkdir "H:\$year\$week\ALE" -ErrorAction Stop}
catch {}
if (-not(Test-Path "H:\$year\$week\Worklog.docx")) {
    cp Worklog.docx "H:\$year\$week"
}
Write-Host "Done"
Read-Host "Press enter to exit"
