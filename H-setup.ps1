$date = (Get-Date).AddDays(5-((Get-Date).DayOfWeek.value__))
$yearDir = $date.addYears(-1).toString("yyyy") + "_" + $date.toString("yyyy")
$weekDir = $date.toString("WE_MM_dd_yy")
$subject = Read-host "Enter week type as 'Pro' or 'Web'"
try {
    foreach ($day in "Mon", "Tue", "Wed", "Thu", "Fri") {
        if ($subject -eq "Pro") {
            mkdir "H:\$yearDir\$weekDir\Pro\$day" -ErrorAction Stop
        } elseif ($subject -eq "Web") {
            mkdir "H:\$yearDir\$weekDir\Web\$day" -ErrorAction Stop
        }
    }
} catch {"Directories already exist"}
if (-not(Test-Path "H:\$yearDir\$weekDir\ALE")) {
    ni "H:\$yearDir\$weekDir\ALE" -ItemType "directory"
}
if (-not(Test-Path "H:\$yearDir\$weekDir\Worklog.docx")) {
    cp Worklog.docx "H:\$yearDir\$weekDir"
}
