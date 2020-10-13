<form><input type="button" value=" &lt;-- FORM " onclick="history.go(-1);return false;" /></form>
<?php

	$YearOfGames = $_POST["YearOfGames"];
	$CityOfGames = $_POST["CityOfGames"];
	$CommenceDate = $_POST["CommenceDate"];
	$EndDate = $_POST["EndDate"];


//----------------------------------------------------------------
//----------------------------------------------------------------
{
$ErrorReport = "";
$OutPut	= "";

// unmatching characters for Year

if (!preg_match("/[19|20]{2}[0-9]{2}/",$YearOfGames) || $YearOfGames=="")
{
	$ErrorReport = $ErrorReport."*year provided must be a numerical value between years 1900-2999 .<br>";
}	
// matching characters for Year
if (preg_match("/[19|20]{2}[0-9]{2}/",$YearOfGames))
{
	$OutPut = $OutPut. "Year Of Games: " .$YearOfGames."<br>";
}

// unmatching characters for CityOfGames
if (!preg_match("/^[a-zA-Z'-]*$/",$CityOfGames) || $CityOfGames=="")
{	
	$ErrorReport = $ErrorReport."<br>"."*City Of Games is either empty or not valid (must consist of letters only).<br>";
}	
// matching characters for CityOfGames
if (preg_match("/^[a-zA-Z'-]*$/",$CityOfGames))
{	
	$OutPut = $OutPut."<br>". "City Of Games: " .$CityOfGames."<br>";
}	
//-------------------------------------------------------------------------------
//-------------------------------------------------------------------------------
//commencement date validation

if (date("d/M/Y",strtotime($CommenceDate)) == "01/Jan/1970")
{
	$ErrorReport = $ErrorReport. "<br>"."*Invalid commencement date, format: 01Jan2000.<br>";
}

if (date("d/M/Y",strtotime($EndDate)) == "01/Jan/1970")
{
	$ErrorReport = $ErrorReport. "<br>"."*Invalid End date, format: 01Jan2000.<br>";
}

if (strtotime($CommenceDate)> 0)
{
	$OutPut = $OutPut."<br>". "Commence Date: " .date("d/M/Y",strtotime($CommenceDate)) . "<br>";
}

if(strtotime($EndDate)>0)
{
	$OutPut = $OutPut."<br>". "End Date: " .date("d/M/Y",strtotime($EndDate)) . "<br>";
}
//-------------------------------------------------------------------------------
//-------------------------------------------------------------------------------
// commence date cannot be later than end date


$diff = (strtotime($EndDate) - strtotime($CommenceDate));

if  ($diff < 0)
{
	$ErrorReport = $ErrorReport."<br>"."*Commence Date cannot be later than End date.<br>";
}
}
//-------------------------------------------------------------------------------
//-------------------------------------------------------------------------------
//lower fields declaration(Competitor Name...)

$arrCompetitorName = "";
$arrCountryList = "";
$arrEvents = "";
$arrMedalWon = "";
$arrWorldRecord = "";
$medalTally = "";
$rowsResults = "";
$recordTally = "";
$rowsRecordTally = "";

$Competitor = array();
$Country = array();
$Event = array();
$arrBronze = array();
$arrSilver = array();
$arrGold = array();
$arrWorldRec = array();
$arrTotal = array();
$arrG =	(sizeof($arrGold));
$arrS = (sizeof($arrSilver));
$arrB = (sizeof($arrBronze));		
$arrRows = array( array( $Country, $arrG, $arrS, $arrB, $arrTotal, $arrWorldRec, $Event, $Competitor)
				);		 

for ($h= 1; $h <= 24;	$h++)

{
$CompetitorName = trim($_POST["CompName_R_".$h]);
$CountryList = trim($_POST["CountryList_R_".$h]);
$Events = trim($_POST["Event_R_".$h]);
$MedalWon = trim($_POST["MedalWon_R_" . $h]);
$WorldRecord = trim($_POST["WorldRecord_R_".$h]);



if(($CompetitorName == "") && ($MedalWon == "") && ($WorldRecord == ""))
	{
	}
else
{
//if format a-zA-Z for Competitor Name does not match 	 
if((!(preg_match("/[a-zA-Z'-]{5,20}$/",$CompetitorName))) || (($CompetitorName == "")))
		{			
		$ErrorReport = $ErrorReport.'<br/>'. "*Competitor Name entered in row". $h ." is blank or  does not match required characters Aa-Zz"."<br>";
		}
//if format a-zA-Z for Competitor Name does match 	 
if(preg_match("/[a-zA-Z'-]{5,20}$/",$CompetitorName))
		{		 	
		$arrCompetitorName = $arrCompetitorName. $CompetitorName.'<br/>';
		array_push($Competitor,$CompetitorName);
		}
//No validation required for Country List and Events		
$arrCountryList = $arrCountryList. $CountryList.'<br/>';
array_push($Country, $CountryList);
$arrEvents = $arrEvents. $Events.'<br/>';
array_push($Event, $Events);

//if format G, S or B for Medal Won does not match
if((!(preg_match("/[GSB]{1}/",$MedalWon))) || (($MedalWon == "")))
		{			
		$ErrorReport = $ErrorReport."<br>". "*Enter G (Gold) S (Silver) B (Bronze) in caps for Medal in row ". $h ."<br>";
		}
//if format G, S or B for Medal Won is a match
if(preg_match("/[GSB]{1}/",$MedalWon))
		{			
		$arrMedalWon = $arrMedalWon. $MedalWon.'<br/>';
		
		}
if ($MedalWon == "G")
		{

array_push($arrGold, $MedalWon);
//array_push ($Country, $MedalWon);
		}
		else

if ($MedalWon == "S")
		{
		
array_push($arrSilver, $MedalWon);
//array_push ($Country, $MedalWon);
		}
		else

if ($MedalWon == "B")
		{
array_push($arrBronze, $MedalWon);
//array_push ($Country, $MedalWon);
		}		
//if format Y or N for MedalWon does not match		
if((!(preg_match("/[YN]{1}/",$WorldRecord))) || (($WorldRecord == "")))
		{			
		$ErrorReport = $ErrorReport."<br>"."*Enter Y (Yes) N (No) in caps for Medal in row ". $h ."<br>";
		}
if ($WorldRecord == "Y")
		{
array_push($arrWorldRec, $WorldRecord);
		}
//if format Y or N for MedalWon is a match	
if(preg_match("/[YN]{1}/",$WorldRecord))
		{
		$arrWorldRecord = $arrWorldRecord. $WorldRecord.'<br/>';
		
		}
}
}
//-------------------------------------------------------------------------------
//-------------------------------------------------------------------------------
//output all errors	
echo $ErrorReport.'<br/>';

// if there are no error out put form input	
if (!($ErrorReport))
	{
	echo $OutPut.'<br/>';
	}
	



	
?><br>	

<?php  if (!($ErrorReport)) 
{
?>

 <TABLE border=0>
<TR><TD>CompetitorName</TD>
<TD><TD><TD>Country</TD><TD><TD><TD>Event</TD><TD><TD><TD>Medal<TD><TD><TD><TD>World Record</TD></TD></TR>

<TD><?php echo $arrCompetitorName; ?> </TD>
<TD><TD><TD><?php echo $arrCountryList; ?> </TD>
<TD><TD><TD><?php echo $arrEvents; ?> </TD>
<TD><TD><TD><?php echo $arrMedalWon; ?></TD>
<TD><TD><TD><TD><?php echo $arrWorldRecord; ?></TD></TR>


<?php
$arrTotal = sizeof(array_merge($arrGold,$arrSilver,$arrBronze));






/* foreach($arrG as $value)
{
	echo "$value <br>";
	
} */
?>
 <TABLE border=0>
<TR><TR><TR><TR><TR><TR><TR><TR><TR><TR><TR><TR><TR><TR><TD>Country</TD>
<TD><TD><TD>Gold</TD><TD><TD><TD>Silver</TD><TD><TD><TD>Bronze<TD><TD><TD><TD>TotalMedals<TD><TD><TD><TD>WorldRecord<TD><TD><TD><TD>Event<TD><TD><TD><TD>Competitor</TD></TD></TR>

<TD><?php foreach($Country as $value){echo "$value <br>";}?> </TD>
<TD><TD><TD><?php echo sizeof($arrGold);?> </TD>
<TD><TD><TD><?php echo sizeof($arrSilver); ?> </TD>
<TD><TD><TD><?php echo sizeof($arrBronze); ?></TD>
<TD><TD><TD><TD><?php echo($arrTotal); ?></TD>
<TD><TD><TD><TD><?php echo sizeof($arrWorldRec); ?></TD>
<TD><TD><TD><TD><?php foreach($Event as $v){echo "$v <br>";}?> </TD>
<TD><TD><TD><TD><?php echo $Competitor; ?></TD></TR>
	
<?php	//}	

echo "<h1>TALLY RESULTS</h1>"
?>	
<?php	


}
?>
