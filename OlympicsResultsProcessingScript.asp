<form><input type="button" value=" &lt;-- FORM " onclick="history.go(-1);return false;" /></form>
<%
'declares the character fields that will be entered
Dim YearOfGames, CityOfGames, CommenceDate, EndDate, return
Dim CompetitorName
Dim CountryList
dim Events
Dim MedalWon
Dim WorldRecord

Dim arrErrorReport()
Redim arrErrorReport(i + 0)

dim arrOutPut()
redim arrOutPut(i + 0)

Dim arrCompetitorName()
redim arrCompetitorName(i + 0)

Dim arrCountryList()
redim arrCountryList(i + 0)

Dim arrEvents()
redim arrEvents(i + 0)

Dim arrMedalWon()
redim arrMedalWon(i + 0)

Dim arrWorldRecord()
redim arrWorldRecord(i + 0)

'------------------------------------------------------------------------
'------------------------------------------------------------------------
'create required vbscript object for year of games

dim YearFormat
Set YearFormat = createObject ("Vbscript.regexp")
YearFormat.Pattern = "[19|20]{2}[0-9]{2}"

Set myRegExp = New RegExp

myRegExp.ignoreCase = True
myRegExp.Global = TRUE
myRegExp.Pattern = YearFormat.Pattern

'checks if year is numerical between 1900 and 2999

	YearOfGames=Request.Form("YearOfGames")
If not YearFormat.test (YearOfGames) Then
	Redim Preserve arrErrorReport((Ubound(arrErrorReport)) +1)
	arrErrorReport(UBound(arrErrorReport)) = "<br/>*year provided is not a numerical value between years 1900-2999 <br/>"
	end if
'check if year is blank
	if (trim(YearOfGames) ="") then
	Redim Preserve arrErrorReport((Ubound(arrErrorReport)) +1)
	arrErrorReport(UBound(arrErrorReport)) = "<br/>*please provide year of games<br/>"
	else 'sends year to output screen
Redim Preserve arrOutPut((Ubound(arrOutPut)) +1)
	arrOutPut(Ubound(arrOutPut)) = "Year Of Games: " & YearOfGames & "<br/>"
	end if
	  
'------------------------------------------------------------------------
'------------------------------------------------------------------------
'create required vbscript object for city of games

dim CityFormat
Set CityFormat = createObject ("Vbscript.regexp")
CityFormat.Pattern = "[a-zA-Z]"

Set myRegExp = New RegExp

myRegExp.ignoreCase = True
myRegExp.Global = TRUE
myRegExp.Pattern = CityFormat.Pattern

'checks if city of Games is alphabetic then spits out

 CityOfGames=Request.form("CityOfGames")
if not CityFormat.test (CityOfGames) Then
	Redim Preserve arrErrorReport((Ubound(arrErrorReport)) +1)
	arrErrorReport(UBound(arrErrorReport)) = "</br>*City of games field contains non text characters<br/>"
	end if
'checks if city of games is blank
IF (trim(CityOfGames)="") THEN
	Redim Preserve arrErrorReport((Ubound(arrErrorReport)) +1)
	arrErrorReport(UBound(arrErrorReport)) = "</br>*City of Games field cannot be left blank<br/>"
	else  ' sends city to output screen
Redim Preserve arrOutPut((Ubound(arrOutPut)) +1)
	arrOutPut(Ubound(arrOutPut)) = "City Of Games: " & CityOfGames & "</br>"
	end if	

'------------------------------------------------------------------------
'------------------------------------------------------------------------
'create required vbscript object for date of commencement

 dim DateCommFormat	
 Set DateCommFormat = createObject ("Vbscript.regexp")
 DateCommFormat.Pattern = "(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$"
	
 Set myRegExp = New RegExp	
	
 myRegExp.ignoreCase = True
 myRegExp.Global = TRUE
 myRegExp.Pattern = DateCommFormat.Pattern
' checks if commence Date is correct format	
	   CommenceDate=Request.Form("CommenceDate")
	   CommenceDate = Cdate(CommenceDate)
 IF NOT DateCommFormat.Test(CommenceDate) Then
	   Redim Preserve arrErrorReport((Ubound(arrErrorReport)) +1)
	   arrErrorReport(UBound(arrErrorReport)) = "<br/>*Date provided is not in the format DD/MM/YYYY <br/>"
	   end if
' checks if Commence Date is blank
	IF (trim(CommenceDate)="") THEN
	   Redim Preserve arrErrorReport((Ubound(arrErrorReport)) +1)
	   arrErrorReport(UBound(arrErrorReport)) = "<br/>*Commence Date field cannot be left blank <br/><br/>"
	else
	   'sends Commence Date to output screen if validation is passed
	   Redim Preserve arrOutPut((Ubound(arrOutPut)) +1)
	   arrOutPut(Ubound(arrOutPut)) = "Commence Date: " & CommenceDate & "<br/>"
	   end if

'------------------------------------------------------------------------
'------------------------------------------------------------------------
'create required vbscript object for end date

dim EndDateFormat
Set EndDateFormat = createObject ("Vbscript.regexp")
EndDateFormat.Pattern = "(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$"

Set myRegExp = New RegExp

myRegExp.ignoreCase = True
myRegExp.Global = TRUE
myRegExp.Pattern = EndDateFormat.Pattern
' checks if end Date is correct format
	   EndDate=Request.Form("EndDate")
	   
IF NOT EndDateFormat.Test(EndDate) Then
	   Redim Preserve arrErrorReport((Ubound(arrErrorReport)) +1)
	   arrErrorReport(UBound(arrErrorReport)) = "<br/>*End Date provided is not in the format DD/MM/YYYY <br/>"
	   else
'commence date cannot be later than end date
if DateDiff("yyyy",CommenceDate,EndDate) < 0  then
	   Redim Preserve arrErrorReport((Ubound(arrErrorReport)) +1)
	   arrErrorReport(UBound(arrErrorReport)) = "<br/>*Commence year cannot be later than end date <br/>"
	   end if
if DateDiff("m",CommenceDate,EndDate) < 0  then
	   Redim Preserve arrErrorReport((Ubound(arrErrorReport)) +1)
	   arrErrorReport(UBound(arrErrorReport)) = "<br/>*Commence month cannot be later than end date <br/>"
	   end if
if DateDiff("d",CommenceDate,EndDate) < 0  then
	   Redim Preserve arrErrorReport((Ubound(arrErrorReport)) +1)
	   arrErrorReport(UBound(arrErrorReport)) = "<br/>*Commence Date cannot be later than end date <br/>"
	   end if	
	   end if
' if not DateDiff("yyyy",CommenceDate,YearOfGames) = 0 then
	   ' Redim Preserve arrErrorReport((Ubound(arrErrorReport)) +1)
	   ' arrErrorReport(UBound(arrErrorReport)) = "<br/>*Year of games and Commence Date must be the same <br/>"
	   ' end if
'checks if end date is blank
	IF (trim(EndDate)="") THEN
	   Redim Preserve arrErrorReport((Ubound(arrErrorReport)) +1)
	   arrErrorReport(UBound(arrErrorReport)) = "<br/>*End Date field cannot be left blank <br/><br/>"
	else
		'sends end date to output screen
		Redim Preserve arrOutPut((Ubound(arrOutPut)) +1)
		arrOutPut(Ubound(arrOutPut)) = "End Date: " & EndDate & "<br/>"
		end if
'------------------------------------------------------------------------
'------------------------------------------------------------------------
'requests for lower fields CompetitorName, Events, CountryList....
	
for h = 0 to 24
	
	CompetitorName = request.form("CompName_R_" & h) 
	
	CountryList = request.form("CountryList_R_" & h)
	
	Events = request.form("Event_R_" & h)
	
	MedalWon = request.form("MedalWon_R_" & h)
	
	WorldRecord = request.form("WorldRecord_R_"& h)
	
	' when the entire row is blank...
	if CompetitorName = ""  and MedalWon = "" and WorldRecord = "" Then 
	'... do nothing
	else
	
'------------------------------------------------------------------------
'------------------------------------------------------------------------
'Create the required vbscript object for Competitor name

Dim CompNameFormat

Set CompNameFormat = CreateObject ("vbscript.regexp")
CompNameFormat.pattern = "^[A-Z a-z]{5,20}"

Set myRegExp = New RegExp

myRegExp.ignoreCase = True
myRegExp.Global = TRUE
myRegExp.Pattern = CompNameFormat.Pattern
' if Competitor Name is wrong format
IF NOT CompNameFormat.Test (CompetitorName) Then
Redim preserve arrErrorReport(Ubound(arrErrorReport) +1)
arrErrorReport(Ubound(arrErrorReport)) = " <br/> Competitor Name does not match required characters Aa-Zz on row " & h & "<br/>"
end if
IF (trim(CompetitorName)="") Then
Redim preserve arrErrorReport(Ubound(arrErrorReport) +1)
arrErrorReport(Ubound(arrErrorReport)) = " <br/> Enter Competitor Name in row " & h & "<br/>"
end if
'Otherwise send the Competitors Name to the output screen
Redim Preserve arrCompetitorName((Ubound(arrCompetitorName)) +1)
arrCompetitorName(Ubound(arrCompetitorName)) = CompetitorName

'-----------------------------------------------------------------------------------
'-----------------------------------------------------------------------------------
'No validation required for Country List and Events

Redim Preserve arrCountryList((Ubound(arrCountryList)) +1)
arrCountryList(Ubound(arrCountryList)) = CountryList
	
Redim Preserve arrEvents((Ubound(arrEvents)) +1)
arrEvents(Ubound(arrEvents)) = Events

'-----------------------------------------------------------------------------------
'-----------------------------------------------------------------------------------
'Create the required vbscript object for Medal Won

Dim MedalWonFormat

Set MedalWonFormat = CreateObject ("vbscript.regexp")
MedalWonFormat.pattern = "^[GSB]{1}"

Set myRegExp = New RegExp
myRegExp.ignoreCase = False
myRegExp.Global = True
myRegExp.Pattern = MedalWonFormat.pattern
' if Medal Won is wrong format
IF NOT MedalWonFormat.Test (MedalWon) Then
Redim preserve arrErrorReport(Ubound(arrErrorReport) +1)
arrErrorReport(Ubound(arrErrorReport)) = " <br/>*Enter G (Gold) S (Silver) B (Bronze) in caps for Medal in row " & h & "<br/>"
end if
IF (trim(MedalWon)="") Then
Redim preserve arrErrorReport(Ubound(arrErrorReport) +1)
arrErrorReport(Ubound(arrErrorReport)) = " <br/> Medal column is empty in row " & h & "<br/>"
end if
'Otherwise send the Medal Won to the output screen
Redim Preserve arrMedalWon((Ubound(arrMedalWon)) +1)
arrMedalWon(Ubound(arrMedalWon)) = MedalWon

'-----------------------------------------------------------------------------------
'-----------------------------------------------------------------------------------
'Create the required vbscript object for World Record

Dim WorldRecFormat

Set WorldRecFormat = CreateObject ("vbscript.regexp")
WorldRecFormat.pattern = "^[YN]{1}"
	 
Set myRegExp = New RegExp
myRegExp.ignoreCase = False
myRegExp.Global = True
myRegExp.Pattern = WorldRecFormat.pattern
'If World record entered is wrong format
IF NOT WorldRecFormat.Test (WorldRecord) Then
Redim preserve arrErrorReport(Ubound(arrErrorReport) +1)
arrErrorReport(Ubound(arrErrorReport)) = " <br/>*Enter Y for Yes or N for No in caps for WorldRecord in row " & h & "<br/>"
end if
IF (trim(WorldRecord)="") Then
Redim preserve arrErrorReport(Ubound(arrErrorReport) +1)
arrErrorReport(Ubound(arrErrorReport)) = " <br/> World Record is empty in row " & h & "<br/>"
end if
'Otherwise send the WorldRecord to the output screen
	 Redim Preserve arrWorldRecord((Ubound(arrWorldRecord)) +1)
	 arrWorldRecord(Ubound(arrWorldRecord)) = WorldRecord
	 
'---------------------------------------------------------------------------------
'---------------------------------------------------------------------------------	 
'Ending blank row condition from line 176

end if	

'---------------------------------------------------------------------------------
'---------------------------------------------------------------------------------
'Looping through error list

next 
	for j = 0 to UBound(arrErrorReport)
	response.write arrErrorReport(j) & "<br/>"
	
Next

'if there are no errors 		
	if UBound(arrErrorReport) = 0 then
'then output upper fields array (City & ...)
	for i = 0 to UBound(arrOutPut)	
	response.write(arrOutPut(i) & "<br/>")
	next
	
'---------------------------------------------------------------------------------
'---------------------------------------------------------------------------------
'looping through the bottom field arrays (Competitor Name & ...)
	
Response.Write(" <TABLE border=0>")
Response.Write("<TR><TD>CompetitorName</TD>")
Response.Write("<TD><TD><TD>Country</TD><TD><TD><TD>Event</TD><TD><TD><TD>Medal<TD><TD><TD><TD>World Record</TD></TD></TR>")

For i = 1 to UBound(arrCompetitorName)
Response.Write("<TD>" & arrCompetitorName(i) & "</TD>")
Response.Write("<TD><TD><TD>" & arrCountryList(i) & "</TD>")
Response.Write("<TD><TD><TD>" & arrEvents(i) & "</TD>")
Response.Write("<TD><TD><TD>" & arrMedalWon(i) & "</TD>")
Response.Write("<TD><TD><TD><TD>" & arrWorldRecord(i) & "</TD></TR>")

next
end if
 
'---------------------------------------------------------------------------------
'---------------------------------------------------------------------------------
' Tallying up the results

	



Dim PreCountry

Dim arrGold()
Redim arrGold(j + 0)


Dim arrSilver()
Redim arrSilver(j + 0)


Dim arrBronze()
Redim arrBronze(j + 0)


Dim Total()
Redim arrTotal(j + 0)

if UBound(arrErrorReport) = 0 then
Response.Write(" <TABLE border=0>")
Response.Write("<br /><TR><TD>Country</TD>")
Response.Write("<TD>Gold</TD><TD><TD>Silver</TD><TD><TD>Bronze<TD>Total</TD></TR>")

'----------------------------------------------------------------------------------------
'----------------------------------------------------------------------------------------


PreCountry = ""

if Medalwon = "G"  then
 Redim Preserve arrGold((Ubound(arrGold)) +1)
 arrGold(Ubound(arrGold)) = j
 
 end if

for each CountryList in arrCountryList
if not CountryList = PreCountry Then
	
	PreCountry = CountryList



 



Response.Write("<TD>" & CountryList &"<br/>"&"</TD>")

For j = 0 to UBound(arrGold)
Response.Write("<TD>" & Ubound(arrGold) & "</TD>")
'Response.Write("<TD><TD>" & Ubound(arrSilver) & "</TD>")
' Response.Write("<TD><TD>" & Ubound(arrBronze) & "</TD>")
' Response.Write("<TD>" & Ubound(arrTotal) & "</TD></TR>")

next
Response.Write("</TABLE>") 

end if
'next
Next
end if
response.end()
%>
