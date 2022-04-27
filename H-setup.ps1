$date = (Get-Date).AddDays(5-((Get-Date).DayOfWeek.value__))
$yearDir = $date.addYears(-1).toString("yyyy") + "_" + $date.toString("yyyy")
$weekDir = $date.toString("WE_MM_dd_yy")
foreach ($subject in "Pro", "Web") {
    foreach ($day in "Mon", "Tue", "Wed", "Thu", "Fri") {
        New-Item "H:\$yearDir\$weekDir\$subject\$day" -ItemType "directory"
    }
}
New-Item "H:\$yearDir\$weekDir\ALE" -ItemType "directory"
if (-not(Test-Path "H:\$yearDir\$weekDir\Worklog.docx")) {
    Copy-Item Worklog.docx "H:\$yearDir\$weekDir"
}
