<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<script>
var ReviewPageLocale = {	
	'data':{
		"edit":"Edit",
		"gender":[
			"<fmt:message key="label.male" bundle="${msg}" />",
			"<fmt:message key="label.female" bundle="${msg}" />"
		],
		"marital_status":[
			"<fmt:message key="option.martial.status.single" bundle="${msg}" />",
			"<fmt:message key="option.martial.status.married" bundle="${msg}" />",
			"<fmt:message key="option.martial.status.divorced" bundle="${msg}" />",
			"<fmt:message key="option.martial.status.widowed" bundle="${msg}" />"
		],
		"dependents":[
			"<fmt:message key="option.no.of.dependents.nil" bundle="${msg}" />", 
			"<fmt:message key="option.no.of.dependents.1to3" bundle="${msg}" />", 
			"<fmt:message key="option.no.of.dependents.4to6" bundle="${msg}" />", 
			"<fmt:message key="option.no.of.dependents.7orabove" bundle="${msg}" />"
		],
		"education": [
			"Primary or below",
			"Secondary / Matriculation",
			"Vocational Training / Technical Institute / Business Institute",
			"Post-secondary / University or above"
		],
		"occupation_others_empty":"Please specify your occupation",
		"select":"- - - Please Select - - -",
		"select_empty":"Please select your occupation",
		"q1_empty":"Please tick one or more",
		"q1_others":"Please specify other objective",
		"q2_empty":"Please tick one or more",
		"q3_empty":"Please tick one",
		"q4_a_empty":"Please tick one",
		"q4_a_others":"Please input specific amount",
		"q4_b_empty":"Please tick one or more",
		"q4_b_others":"Please specify liquid assets",
		"q4_b_amount":"Please input total amount",
		"number":"Please input valid amount",
		"q4_e_empty":"Please tick one",
		"q4_f_empty":"Please tick one",
		"q4_g_empty":"Please tick one",
		"q4_g_others":"Please specify other sources of funds",
	}
}


var FNAQuestion ={
	"data":[{
		  "id": "q1",
		  "num": "1",
		  "title": "<fmt:message key="fna.question.q1" bundle="${msg}" /><span><fmt:message key="fna.question.choose.multiple" bundle="${msg}" /></span>",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q1.option1" bundle="${msg}" />",
		    "caption": "<fmt:message key="fna.question.q1.option1example" bundle="${msg}" />"
		  }, {
		    "id": 1,
		    "title": "<fmt:message key="fna.question.q1.option2" bundle="${msg}" />",
		    "caption": "<fmt:message key="fna.question.q1.option2example" bundle="${msg}" />"
		  }, {
		    "id": 2,
		    "title": "<fmt:message key="fna.question.q1.option3" bundle="${msg}" />",
		    "caption": "<fmt:message key="fna.question.q1.option3example" bundle="${msg}" />"
		  }, {
		    "id": 3,
		    "title": "<fmt:message key="fna.question.q1.option4" bundle="${msg}" />",
		    "caption": "<fmt:message key="fna.question.q1.option4example" bundle="${msg}" />"
		  }, {
		    "id": 4,
		    "title": "<fmt:message key="fna.question.q1.option5" bundle="${msg}" />",
		    "caption": "",
		    "popup": true
		  }, {
		  	"id": 5,
		    "title": "<fmt:message key="fna.question.others" bundle="${msg}" />",
		    "caption": "",
		    "popup": true
		  }]
		}, {
		  "id": "q2",
		  "num": "2",
		  "title": "<fmt:message key="fna.question.q2" bundle="${msg}" /><span><fmt:message key="fna.question.choose.multiple" bundle="${msg}" /></span>",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q2.option1" bundle="${msg}" />",
		    "caption": "-<fmt:message key="fna.question.q2.option1remark" bundle="${msg}" /> <fmt:message key="fna.question.q2.option1example" bundle="${msg}" />"
		  }, {
		    "id": 1,
		    "title": "<fmt:message key="fna.question.q2.option2" bundle="${msg}" />",
		    "caption": "-<fmt:message key="fna.question.q2.option2remark" bundle="${msg}" /> <fmt:message key="fna.question.q2.option2example" bundle="${msg}" />"
		  }, {
		    "id": 2,
		    "title": "<fmt:message key="fna.question.q2.option3" bundle="${msg}" />",
		    "caption": "-<fmt:message key="fna.question.q2.option3remark" bundle="${msg}" /> <fmt:message key="fna.question.q2.option3example" bundle="${msg}" />"
		  }, {
		    "id": 3,
		    "title": "<fmt:message key="fna.question.q2.option4" bundle="${msg}" />",
		    "caption": "-<fmt:message key="fna.question.q2.option4remark" bundle="${msg}" /> <fmt:message key="fna.question.q2.option4example" bundle="${msg}" />"
		  }, {
		    "id": 4,
		    "title": "<fmt:message key="fna.question.others" bundle="${msg}" />",
		    "caption": "",
		    "popup": true
		  }]
		}, {
		  "id": "q3",
		  "num": "3",
		  "title": "<fmt:message key="fna.question.q3" bundle="${msg}" /> <span><fmt:message key="fna.question.choose.one" bundle="${msg}" /></span>",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q3.option1" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "<fmt:message key="fna.question.q3.option2" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "<fmt:message key="fna.question.q3.option3" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "<fmt:message key="fna.question.q3.option4" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "<fmt:message key="fna.question.q3.option5" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 5,
		    "title": "<fmt:message key="fna.question.q3.option6" bundle="${msg}" />",
		    "caption": ""
		  }]
		}, {
		  "id": "q4",
		  "num": "4",
		  "title": "<fmt:message key="fna.question.q4" bundle="${msg}" />",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="label.yes" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "<fmt:message key="label.no" bundle="${msg}" />",
		    "caption": ""
		  }]
		}, {
		  "id": "q4_a",
		  "num": "4a",
		  "title": "<fmt:message key="fna.question.q4a" bundle="${msg}" /> <span><fmt:message key="fna.question.choose.multiple" bundle="${msg}" /></span>",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q4a.amount" bundle="${msg}" /> <br><fmt:message key="fna.question.q4a.lessthan" bundle="${msg}" /> {0} <fmt:message key="fna.question.q4a.month" bundle="${msg}" />",
		    "caption": "",
		    "other": "q4_a_others"
		  }, {
		    "id": 1,
		    "title": "<fmt:message key="fna.question.q4a.option1" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "<fmt:message key="fna.question.q4a.option2" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "<fmt:message key="fna.question.q4a.option3" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "<fmt:message key="fna.question.q4a.option4" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 5,
		    "title": "<fmt:message key="fna.question.q4a.option5" bundle="${msg}" />",
		    "caption": ""
		  }]
		}, {
		  "id": "q4_b",
		  "num": "4b",
		  "title": "<fmt:message key="fna.question.q4b" bundle="${msg}" />  <span><fmt:message key="fna.question.q4b.specify" bundle="${msg}" /></span>",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q4b.option1" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "<fmt:message key="fna.question.q4b.option2" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "<fmt:message key="fna.question.q4b.option3" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "<fmt:message key="fna.question.q4b.option4" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "<fmt:message key="fna.question.q4b.option5" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 5,
		    "title": "<fmt:message key="fna.question.q4b.option6" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 6,
		    "title": "<fmt:message key="fna.question.others" bundle="${msg}" />",
		    "caption": "",
		    "popup": true
		  }, {
		    "id": 7,
		    "title": "<fmt:message key="fna.question.q4b.amount" bundle="${msg}" /> HK$ {0}",
		    "caption": " Note: Liquid assets are assets which may be easily turned into cash. <br>Real estate, coin collection and arkwork are not considered to be liquid assets.",
		    "other": "q4_b_amount"
		  }]
		}, {
		  "id": "q4_c",
		  "num": "4c",
		  "title": "<fmt:message key="fna.question.q4c" bundle="${msg}" />",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q4c.totallessthen" bundle="${msg}" />",
		    "caption": "<fmt:message key="fna.question.q4c.month" bundle="${msg}" /> {0} <fmt:message key="fna.question.q4c.hkd" bundle="${msg}" />",
		    "other":"q4_c_others"
		  }]
		}, {
		  "id": "q4_d_1",
		  "num": "4d (i)",
		  "title": "<fmt:message key="fna.question.q4di" bundle="${msg}" /> ",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q4di.lessthan" bundle="${msg}" /> <fmt:message key="fna.question.q4di.hkd" bundle="${msg}" /> {0}",
		    "caption": "",
		    "other":"q4_d_1_others"
		  }]
		}, {
		  "id": "q4_d_2",
		  "num": "4d (iI)",
		  "title": "<fmt:message key="fna.question.q4dii" bundle="${msg}" /> ",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q4dii.leanthan" bundle="${msg}" /> <fmt:message key="fna.question.q4dii.hkd" bundle="${msg}" /> {0}",
		    "caption": "",
		    "other":"q4_d_2_others"
		  }]
		}, {
		  "id": "q4_e",
		  "num": "4e",
		  "title": "<fmt:message key="fna.question.q4e" bundle="${msg}" /><span><fmt:message key="fna.question.choose.one" bundle="${msg}" /></span>",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q4e.option1" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "<fmt:message key="fna.question.q4e.option2" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "<fmt:message key="fna.question.q4e.option3" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "<fmt:message key="fna.question.q4e.option4" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "<fmt:message key="fna.question.q4e.option5" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 5,
		    "title": "<fmt:message key="fna.question.q4e.option6" bundle="${msg}" />",
		    "caption": ""
		  }]
		}, {
		  "id": "q4_f",
		  "num": "4f",
		  "title": "<fmt:message key="fna.question.q4f" bundle="${msg}" /> <span><fmt:message key="fna.question.choose.one" bundle="${msg}" /></span>",
		  "option": [{
		    "id": 0,
		    "title": "&lt;10%",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "10% - 20%",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "21% - 30%",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "31% - 40%",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "41% - 50%",
		    "caption": ""
		  }, {
		    "id": 5,
		    "title": "&gt;50%",
		    "caption": ""
		  }]
		}, {
		  "id": "q4_g",
		  "num": "4g",
		  "title": "<fmt:message key="fna.question.q4g" bundle="${msg}" /> <span><fmt:message key="fna.question.choose.multiple" bundle="${msg}" /></span>",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q4g.option1" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "<fmt:message key="fna.question.q4g.option2" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "<fmt:message key="fna.question.q4g.option3" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "<fmt:message key="fna.question.q4g.option4" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "<fmt:message key="fna.question.others" bundle="${msg}" />",
		    "caption": "",
		    "popup": true
		  }]
		}]
}




var Status = {
	"data": [{
			"name": "Full Time Employed",
			"id": "ES1",
			"disable":false
		}, {
			"name": "Part Time Employed",
			"id": "ES2",
			"disable":false
		}, {
			"name": "Self Employed",
			"id": "ES3",
			"disable":false
		},{
			"name": "Unemployed",
			"id": "ES4",
			"disable":true
		}, {
			"name": "Retired",
			"id": "ES5",
			"disable":true
		}, {
			"name": "Student",
			"id": "ES6",
			"disable":true
		}, {
			"name": "Housewife",
			"id": "ES7",
			"disable":true
	}]
}




var Occupation = {
	"data": [{
		"id": "NoB1",
		"nob": "Agriculture & Fisheries",
		"position": [{
			"id": "NoBD1",
			"name": "Farmer -- General Farming"
		}, {
			"id": "NoBD2",
			"name": "Farmer -- Poultry"
		}, {
			"id": "NoBD3",
			"name": "Fisherman -- Pond, Lake & River"
		}, {
			"id": "NoBD4",
			"name": "Fisherman -- Coming Ashore Daily"
		}, {
			"id": "NoBD5",
			"name": "Fisherman -- Not Coming Ashore Daily"
		}, {
			"id": "NoBD6",
			"name": "Gardener"
		}, {
			"id": "NoBD7",
			"name": "Labourer -- Farm"
		}, {
			"id": "NoBD8",
			"name": "Proprietor -- Farm"
		}]
	}, {
		"id": "NoB2",
		"nob": "Aviation",
		"position": [{
			"id": "NoBD1",
			"name": "Clerk, Other Office Admin. Personnel -- Office Duties"
		}, {
			"id": "NoBD2",
			"name": "Aviation Inspector"
		}, {
			"id": "NoBD3",
			"name": "Baggage / Freight Handler"
		}, {
			"id": "NoBD4",
			"name": "Engineer -- Ground Duties"
		}, {
			"id": "NoBD5",
			"name": "Flight/Traffic Superintendent & Supervisor"
		}, {
			"id": "NoBD6",
			"name": "Food Deliveryman"
		}, {
			"id": "NoBD7",
			"name": "Fueling Attendant"
		}, {
			"id": "NoBD8",
			"name": "Ground Hostess"
		}, {
			"id": "NoBD9",
			"name": "Helicopter"
		}, {
			"id": "NoBD10",
			"name": "Hostess, Steward"
		}, {
			"id": "NoBD11",
			"name": "Maintenance"
		}, {
			"id": "NoBD12",
			"name": "Mechanic"
		}, {
			"id": "NoBD13",
			"name": "Pilot -- Commercial Airlines"
		}, {
			"id": "NoBD14",
			"name": "Pilot -- Non Commercial Airlines (Complete Aviation Questionnaire)"
		}, {
			"id": "NoBD15",
			"name": "Plane Cleaner -- Inside Aircraft"
		}, {
			"id": "NoBD16",
			"name": "Plane Cleaner -- Outside Aircraft"
		}, {
			"id": "NoBD17",
			"name": "Radio Operator"
		}, {
			"id": "NoBD18",
			"name": "Ticket Office"
		}, {
			"id": "NoBD19",
			"name": "Traffic Director"
		}, {
			"id": "NoBD20",
			"name": "Weather Observer -- Ground Duties"
		}]
	}, {
		"id": "NoB3",
		"nob": "Broadcasting (Radio & TV), Media, Printing & Publishing",
		"position": [{
			"id": "NoBD1",
			"name": "Account/marketing Executive"
		}, {
			"id": "NoBD2",
			"name": "Clerk, Other Office Admin. Personnel -- Office Duties"
		}, {
			"id": "NoBD3",
			"name": "Antenna Erector -- Inside House & Office"
		}, {
			"id": "NoBD4",
			"name": "Coordinator -- Office Duties"
		}, {
			"id": "NoBD5",
			"name": "Copy Writer"
		}, {
			"id": "NoBD6",
			"name": "D.J."
		}, {
			"id": "NoBD7",
			"name": "Designer"
		}, {
			"id": "NoBD8",
			"name": "Editor"
		}, {
			"id": "NoBD9",
			"name": "Engineer -- Office Duties"
		}, {
			"id": "NoBD10",
			"name": "Newspaper Deliveryman"
		}, {
			"id": "NoBD11",
			"name": "Photographer -- Indoor Duties"
		}, {
			"id": "NoBD12",
			"name": "Printing & Publishing Labourer"
		}, {
			"id": "NoBD13",
			"name": "Production & Program Assistant"
		}, {
			"id": "NoBD14",
			"name": "Reporter -- General"
		}, {
			"id": "NoBD15",
			"name": "Reporter -- In War Countries"
		}, {
			"id": "NoBD16",
			"name": "Studio & Station Director"
		}, {
			"id": "NoBD17",
			"name": "Switchboard Controller"
		}, {
			"id": "NoBD18",
			"name": "Transmitter & Maintenance Man -- Outside & High Level Duties"
		}, {
			"id": "NoBD19",
			"name": "TV Repairman"
		}, {
			"id": "NoBD20",
			"name": "Wirer"
		}]
	}, {
		"id": "NoB4",
		"nob": "Building Construction, Maintenance & Management",
		"position": [{
			"id": "NoBD1",
			"name": "Clerk, Other Office Admin. Personnel -- Office Duties"
		}, {
			"id": "NoBD2",
			"name": "Air Conditioning Installer & Repairman -- Inside Building Work"
		}, {
			"id": "NoBD3",
			"name": "Air Conditioning Installer & Repairman -- Outside, High Level Work"
		}, {
			"id": "NoBD4",
			"name": "Air Hammer Operator"
		}, {
			"id": "NoBD5",
			"name": "Alarm System Installer"
		}, {
			"id": "NoBD6",
			"name": "Aluminium Window Frame Installer -- Inside Building Work"
		}, {
			"id": "NoBD7",
			"name": "Aluminium Window Frame Worker -- Outside, High Level Work"
		}, {
			"id": "NoBD8",
			"name": "Architect -- Office Duties"
		}, {
			"id": "NoBD9",
			"name": "Asphalt Layer"
		}, {
			"id": "NoBD10",
			"name": "Blaster & Others Handling Explosives"
		}, {
			"id": "NoBD11",
			"name": "Bricklayer -- At Construction Site"
		}, {
			"id": "NoBD12",
			"name": "Bricklayer -- Dam, Lock, Reservoir, Tunnels Construction"
		}, {
			"id": "NoBD13",
			"name": "Building Demolition Worker"
		}, {
			"id": "NoBD14",
			"name": "Bulldozer Operator"
		}, {
			"id": "NoBD15",
			"name": "Caisson Worker"
		}, {
			"id": "NoBD16",
			"name": "Caster Mover"
		}, {
			"id": "NoBD17",
			"name": "Carpenter -- Inside Building Work"
		}, {
			"id": "NoBD18",
			"name": "Carpenter -- Outside, High Level Work"
		}, {
			"id": "NoBD19",
			"name": "Cement Worker -- Inside Building Work"
		}, {
			"id": "NoBD17",
			"name": "Cement Worker -- Outside, High Level Work"
		}, {
			"id": "NoBD18",
			"name": "Chainman"
		}, {
			"id": "NoBD19",
			"name": "Civil Engineer -- Construction Site Inspection"
		}, {
			"id": "NoBD20",
			"name": "Cleaner -- Inside Building"
		}, {
			"id": "NoBD21",
			"name": "Cleaner - Outside Building & Curtain Walls"
		}, {
			"id": "NoBD22",
			"name": "Concrete Mixer Operator"
		}, {
			"id": "NoBD23",
			"name": "Contractor & Sub-contractor -- Construction Site Inspection"
		}, {
			"id": "NoBD24",
			"name": "Contractor & Sub-contractor -- Office Duties"
		}, {
			"id": "NoBD25",
			"name": "Iron Tightening Worker"
		}, {
			"id": "NoBD26",
			"name": "Janitor, Watchman"
		}, {
			"id": "NoBD27",
			"name": "Leveller"
		}, {
			"id": "NoBD28",
			"name": "Lift Attendant/operator -- Not in Construction Site"
		}, {
			"id": "NoBD29",
			"name": "Masons"
		}, {
			"id": "NoBD30",
			"name": "Odd Job Labourer -- No High Level Duties"
		}, {
			"id": "NoBD31",
			"name": "Odd Job Labourer"
		}, {
			"id": "NoBD32",
			"name": "Ovary Crane Operator -- Inside Control Room"
		}, {
			"id": "NoBD33",
			"name": "Painter -- Indoor Decoration"
		}, {
			"id": "NoBD34",
			"name": "Painter -- Outside, High Level Work"
		}, {
			"id": "NoBD35",
			"name": "Pile Operator"
		}, {
			"id": "NoBD36",
			"name": "Plumber -- Construction Site"
		}, {
			"id": "NoBD37",
			"name": "Plumber -- Domestic"
		}, {
			"id": "NoBD38",
			"name": "Quantity & Land Surveyor"
		}, {
			"id": "NoBD39",
			"name": "Repairman -- Tunnel & Subway Construction"
		}, {
			"id": "NoBD40",
			"name": "Rigger"
		}, {
			"id": "NoBD41",
			"name": "Safety Officer"
		}, {
			"id": "NoBD42",
			"name": "Sandblaster"
		}, {
			"id": "NoBD43",
			"name": "Scaffolding Worker"
		}, {
			"id": "NoBD44",
			"name": "Scrapper -- Highway, Road Construction"
		}, {
			"id": "NoBD45",
			"name": "Site Clerk"
		}, {
			"id": "NoBD46",
			"name": "Sprinkler / Fire Alarm Installer"
		}, {
			"id": "NoBD47",
			"name": "Steam-roller Driver"
		}, {
			"id": "NoBD48",
			"name": "Stone Crushman"
		}, {
			"id": "NoBD49",
			"name": "Stone Setter"
		}, {
			"id": "NoBD50",
			"name": "Structural Steel Erector"
		}, {
			"id": "NoBD51",
			"name": "Tractor Driver"
		}, {
			"id": "NoBD52",
			"name": "Traffic Lane Painter"
		}, {
			"id": "NoBD53",
			"name": "Tunnel Worker"
		}, {
			"id": "NoBD54",
			"name": "Underground Worker"
		}, {
			"id": "NoBD55",
			"name": "Welder & Cutter -- Indoor Duties"
		}, {
			"id": "NoBD56",
			"name": "Welder & Cutter -- Construction Sites, High Level Duties"
		}, {
			"id": "NoBD57",
			"name": "Crane Operator"
		}, {
			"id": "NoBD58",
			"name": "Curtain Wall Installer"
		}, {
			"id": "NoBD59",
			"name": "Decorator -- Indoor Duties"
		}, {
			"id": "NoBD60",
			"name": "Derrick Operator"
		}, {
			"id": "NoBD61",
			"name": "Demolition Worker"
		}, {
			"id": "NoBD62",
			"name": "Designer -- Indoor Duties"
		}, {
			"id": "NoBD63",
			"name": "Ditch Operator"
		}, {
			"id": "NoBD64",
			"name": "Draftman"
		}, {
			"id": "NoBD65",
			"name": "Driller"
		}, {
			"id": "NoBD66",
			"name": "Electrical Maintenance Man -- Office Buildings & Factories"
		}, {
			"id": "NoBD67",
			"name": "Electrician -- At Construction Site"
		}, {
			"id": "NoBD68",
			"name": "Electrician -- Indoor Duties"
		}, {
			"id": "NoBD69",
			"name": "Elevator / Escalator / Lift Repairman, Installer & Inspector"
		}, {
			"id": "NoBD70",
			"name": "Engineer -- Construction Site Inspection"
		}, {
			"id": "NoBD71",
			"name": "Engineer -- Office Duties"
		}, {
			"id": "NoBD72",
			"name": "Explosure Handler"
		}, {
			"id": "NoBD73",
			"name": "Fitter"
		}, {
			"id": "NoBD74",
			"name": "Foreman"
		}, {
			"id": "NoBD75",
			"name": "Grader"
		}, {
			"id": "NoBD76",
			"name": "Hoist Operator"
		}, {
			"id": "NoBD77",
			"name": "Insecticide Sprayers / Pest Controller"
		}]
	}, {
		"id": "NoB5",
		"nob": "Casino and Other Gambling Related Establishment",
		"position": [{
			"id": "NoBD1",
			"name": "Attendant -- Casino, Mahjong School"
		}, {
			"id": "NoBD2",
			"name": "Card Dealer -- Casino"
		}, {
			"id": "NoBD3",
			"name": "Cashier -- Casino, Mahjong School"
		}, {
			"id": "NoBD4",
			"name": "Manager -- Casino, Mahjong School"
		}, {
			"id": "NoBD5",
			"name": "Sole Proprietor -- Mahjong School"
		}, {
			"id": "NoBD6",
			"name": "Clerk, Other Office Admin. Personnel -- Office Duties"
		}, {
			"id": "NoBD7",
			"name": "Security Guard -- Armed"
		}]
	}, {
		"id": "NoB6",
		"nob": "Computer",
		"position": [{
			"id": "NoBD1",
			"name": "Clerk, Office Admin. Personnel -- Office Duties"
		}, {
			"id": "NoBD2",
			"name": "Hardware Maintenance Technician"
		}, {
			"id": "NoBD3",
			"name": "Programmer, Operator, System Analyst"
		}, {
			"id": "NoBD4",
			"name": "Sales -- Indoor"
		}, {
			"id": "NoBD5",
			"name": "Sales -- Outdoor"
		}]
	}, {
		"id": "NoB7",
		"nob": "Currency Exchange & Money Transmitter",
		"position": [{
			"id": "NoBD1",
			"name": "Owner"
		}, {
			"id": "NoBD2",
			"name": "Clerk, Other Office Admin. Personnel -- Office Duties"
		}, {
			"id": "NoBD3",
			"name": "Security Guard -- Armed"
		}]
	}, {
		"id": "NoB8",
		"nob": "Education",
		"position": [{
			"id": "NoBD1",
			"name": "Teacher, Lecturer, Tutor (Full Time), Professor -- Physical Education"
		}, {
			"id": "NoBD2",
			"name": "Clerk, Other Office Admin. Personnel -- Office Duties"
		}, {
			"id": "NoBD3",
			"name": "Librarian"
		}, {
			"id": "NoBD4",
			"name": "Principal"
		}, {
			"id": "NoBD5",
			"name": "Private Tutor"
		}, {
			"id": "NoBD6",
			"name": "Teacher, Lecturer, Tutor (Full Time), Professor -- General Subject"
		}, {
			"id": "NoBD7",
			"name": "Teacher, Lecturer, Tutor (Full Time), Professor -- Mechanical Engineering"
		}]
	}, {
		"id": "NoB9",
		"nob": "Entertainment, Tourism & Leisure",
		"position": [{
			"id": "NoBD1",
			"name": "Clerk, Office Admin. Personnel -- Office Duties"
		}, {
			"id": "NoBD2",
			"name": "Acrobat -- Circus"
		}, {
			"id": "NoBD3",
			"name": "Actor & Actress -- Involved In Martial Arts"
		}, {
			"id": "NoBD4",
			"name": "Actor & Actress -- Not Involved In Martial Arts"
		}, {
			"id": "NoBD5",
			"name": "Actor & Actress -- Sometimes Involved In Martial Arts"
		}, {
			"id": "NoBD6",
			"name": "Actor & Actress -- Temporary"
		}, {
			"id": "NoBD7",
			"name": "Aerobic Dance Instructor"
		}, {
			"id": "NoBD8",
			"name": "Animal Trainer"
		}, {
			"id": "NoBD9",
			"name": "Attendant -- Disco, Licensed Baths/masseur, Night Club, Snooker Centre, Tv Games Centre"
		}, {
			"id": "NoBD10",
			"name": "Bartender -- Disco, Night Club"
		}, {
			"id": "NoBD11",
			"name": "Beautician -- Not Working At Residence"
		}, {
			"id": "NoBD12",
			"name": "Beautician -- Working At Residence"
		}, {
			"id": "NoBD13",
			"name": "Cameraman"
		}, {
			"id": "NoBD14",
			"name": "Cashier -- Amusement Park, Bowling Alley"
		}, {
			"id": "NoBD15",
			"name": "Cashier -- Licenced Baths/masseur, Rhkjc, Snooker Centre, Tv Game Centre"
		}, {
			"id": "NoBD16",
			"name": "Cleaner -- Indoor"
		}, {
			"id": "NoBD17",
			"name": "Dancer -- Show Business (Not in Night Clubs & Bars)"
		}, {
			"id": "NoBD18",
			"name": "Darkroom Technician"
		}, {
			"id": "NoBD19",
			"name": "Director -- Film Production Industry"
		}, {
			"id": "NoBD20",
			"name": "Dubbing -- Film Production Industry"
		}, {
			"id": "NoBD21",
			"name": "Film Carpenter -- Work At Ground"
		}, {
			"id": "NoBD22",
			"name": "Film Carpenter -- Work At Height"
		}, {
			"id": "NoBD23",
			"name": "Fitness Instructor -- Health Club"
		}, {
			"id": "NoBD24",
			"name": "Game Operator -- Amusement Park"
		}, {
			"id": "NoBD25",
			"name": "Maintenance Man -- Amusement Park"
		}, {
			"id": "NoBD26",
			"name": "Make-up -- Film Production Industry"
		}, {
			"id": "NoBD27",
			"name": "Manager -- Bowling Alley, Cinema, Circus"
		}, {
			"id": "NoBD28",
			"name": "Manager -- Disco, Licensed Baths/masseur, Night Club, Snooker Centre, TV Games Centre"
		}, {
			"id": "NoBD29",
			"name": "Martial Arts Fighter -- Film Production Industry"
		}, {
			"id": "NoBD30",
			"name": "Martial Arts Instructor -- Film Production Industry"
		}, {
			"id": "NoBD31",
			"name": "Massage Girl -- Licenced Baths/masseur"
		}, {
			"id": "NoBD32",
			"name": "Masseur -- Hotel"
		}, {
			"id": "NoBD33",
			"name": "Musician -- Concert, Pop Group, Orchestra"
		}, {
			"id": "NoBD34",
			"name": "Musician -- Hotel, Disco, Restaurant, Night Club & Bar"
		}, {
			"id": "NoBD35",
			"name": "Public Relations Manageress -- Night Club"
		}, {
			"id": "NoBD36",
			"name": "Position Man -- Film Production Industry"
		}, {
			"id": "NoBD37",
			"name": "Producer -- Film Production Industry"
		}, {
			"id": "NoBD38",
			"name": "Projectionist -- Cinema"
		}, {
			"id": "NoBD39",
			"name": "Receptionist -- Licenced Baths/masseur, Night Club"
		}, {
			"id": "NoBD40",
			"name": "Repairman -- Bowling Alley, Cinema, TV Game Centre"
		}, {
			"id": "NoBD41",
			"name": "Security Guard -- Unarmed"
		}, {
			"id": "NoBD42",
			"name": "Singer -- Show Business"
		}, {
			"id": "NoBD43",
			"name": "Sole Proprietor -- Night Club"
		}, {
			"id": "NoBD44",
			"name": "Stuntman"
		}, {
			"id": "NoBD45",
			"name": "Ticket Seller"
		}, {
			"id": "NoBD46",
			"name": "Tour Escort - Travel Agency -- Local Duties"
		}, {
			"id": "NoBD47",
			"name": "Tour Escort - Travel Agency -- Overseas: China / South East Asia"
		}, {
			"id": "NoBD48",
			"name": "Tour Escort - Travel Agency -- Overseas: Europe / North America"
		}, {
			"id": "NoBD49",
			"name": "Usher -- Cinema"
		}, {
			"id": "NoBD50",
			"name": "Waiter, Watress -- Disco, Licenced Bath/masseur, Night Club"
		}, {
			"id": "NoBD51",
			"name": "D.J. -- Disco"
		}]
	}, {
		"id": "NoB10",
		"nob": "Finance & Banking",
		"position": [{
			"id": "NoBD1",
			"name": "Accountant -- Qualified"
		}, {
			"id": "NoBD2",
			"name": "Actuary"
		}, {
			"id": "NoBD3",
			"name": "Armoured Car Driver"
		}, {
			"id": "NoBD4",
			"name": "Clerk, Other Office Admin. Personnel -- Office Duties"
		}, {
			"id": "NoBD5",
			"name": "Insurance Agent"
		}, {
			"id": "NoBD6",
			"name": "Security Guard -- Armed"
		}, {
			"id": "NoBD7",
			"name": "Teller"
		}, {
			"id": "NoBD8",
			"name": "Underwriting/claims/customer Service Personnel"
		}]
	}, {
		"id": "NoB11",
		"nob": "Food, Beverages & Hotel",
		"position": [{
			"id": "NoBD1",
			"name": "Clerk, Other Office Admin. Personnel -- Office Duties"
		}, {
			"id": "NoBD2",
			"name": "Baker"
		}, {
			"id": "NoBD3",
			"name": "Bartender -- Bar, Disco, Hotel, Lounge, Karaoke, Restaurant"
		}, {
			"id": "NoBD4",
			"name": "Bell Boy, Bus Boy, Concierge -- Hotel"
		}, {
			"id": "NoBD5",
			"name": "Captain"
		}, {
			"id": "NoBD6",
			"name": "Cashier"
		}, {
			"id": "NoBD7",
			"name": "Chef, Cook -- Hotel, Restaurant"
		}, {
			"id": "NoBD8",
			"name": "Cleaner -- Indoor"
		}, {
			"id": "NoBD9",
			"name": "Dim Sum Seller"
		}, {
			"id": "NoBD10",
			"name": "Doorman -- Hotel"
		}, {
			"id": "NoBD11",
			"name": "Dough-mixer"
		}, {
			"id": "NoBD12",
			"name": "Housekeeper -- Hotel"
		}, {
			"id": "NoBD13",
			"name": "Kitchen Helper -- Hotel, Restaurant"
		}, {
			"id": "NoBD14",
			"name": "Laundry Worker -- Hotel"
		}, {
			"id": "NoBD15",
			"name": "Maintenanceman -- Electrician"
		}, {
			"id": "NoBD16",
			"name": "Manager -- Hotel"
		}, {
			"id": "NoBD17",
			"name": "Manager -- Restaurant"
		}, {
			"id": "NoBD18",
			"name": "Musician -- Lounge, Karaoke"
		}, {
			"id": "NoBD19",
			"name": "Room Attendent -- Hotel"
		}, {
			"id": "NoBD20",
			"name": "Receptionist -- Hotel, Restaurant"
		}, {
			"id": "NoBD21",
			"name": "Security Guard -- Hotel (Unarmed)"
		}, {
			"id": "NoBD22",
			"name": "Singer -- Hotel, Lounge"
		}, {
			"id": "NoBD23",
			"name": "Sole Proprietor, Owner -- Admin. Duties"
		}, {
			"id": "NoBD24",
			"name": "Waiter, Waitress -- Hotel, Karaoke, Lounge, Restaurant"
		}, {
			"id": "NoBD25",
			"name": "Wholesaler"
		}]
	}, {
		"id": "NoB12",
		"nob": "Governmental Departments",
		"position": [{
			"id": "NoBD1",
			"name": "Clerk, Other Office Admin. Personnel -- Office Duties"
		}, {
			"id": "NoBD2",
			"name": "Agriculture & Fisheries Department -- Operational Personnel"
		}, {
			"id": "NoBD3",
			"name": "Commercial Crime Officer"
		}, {
			"id": "NoBD4",
			"name": "Correctional Services Department -- Junior Officer"
		}, {
			"id": "NoBD5",
			"name": "Correctional Services Department -- Senior Officer"
		}, {
			"id": "NoBD6",
			"name": "Court/Magistrates Office -- Judge, Lawyer"
		}, {
			"id": "NoBD7",
			"name": "Customs & Excise Department -- Inspector"
		}, {
			"id": "NoBD8",
			"name": "Environment Protection Officer -- Office Duties"
		}, {
			"id": "NoBD9",
			"name": "Fire Services Department -- Ambulanceman"
		}, {
			"id": "NoBD10",
			"name": "Fire Services Department -- Driver"
		}, {
			"id": "NoBD11",
			"name": "Fire Services Department -- Fireman"
		}, {
			"id": "NoBD12",
			"name": "Fire Services Department -- Ventilation Officer (Indoor Duties)"
		}, {
			"id": "NoBD13",
			"name": "Government Staff - Office Duties"
		}, {
			"id": "NoBD14",
			"name": "Hawker Control Team"
		}, {
			"id": "NoBD15",
			"name": "Health Inspector"
		}, {
			"id": "NoBD16",
			"name": "ICAC -- Investigation Officer (Indoor Duties)"
		}, {
			"id": "NoBD17",
			"name": "ICAC -- Investigation Officer (Outdoor Duties)"
		}, {
			"id": "NoBD18",
			"name": "Immigration Department -- Officer"
		}, {
			"id": "NoBD19",
			"name": "Life Guard (Full Time) -- Public Beach And Pool"
		}, {
			"id": "NoBD20",
			"name": "Police -- Auxillary"
		}, {
			"id": "NoBD21",
			"name": "Police -- Cid"
		}, {
			"id": "NoBD22",
			"name": "Police -- Constable"
		}, {
			"id": "NoBD23",
			"name": "Police -- Inspector"
		}, {
			"id": "NoBD24",
			"name": "Police (Full Time) -- Interpretor"
		}, {
			"id": "NoBD25",
			"name": "Police -- Marine Division"
		}, {
			"id": "NoBD26",
			"name": "Police -- Motorcycle Man"
		}, {
			"id": "NoBD27",
			"name": "Police -- Sergeant"
		}, {
			"id": "NoBD28",
			"name": "Police -- Special Duties Unit (SDU)"
		}, {
			"id": "NoBD29",
			"name": "Post Office -- Counter Clerk"
		}, {
			"id": "NoBD30",
			"name": "Post Office -- Postman"
		}, {
			"id": "NoBD31",
			"name": "Social Worker -- Involved in Youth Functions, Community Development"
		}, {
			"id": "NoBD32",
			"name": "Social Worker -- Office Duties"
		}, {
			"id": "NoBD33",
			"name": "Traffic Warden"
		}]
	}, {
		"id": "NoB13",
		"nob": "Manufacturing",
		"position": [{
			"id": "NoBD1",
			"name": "Clerk, Other Office Admin. Personnel -- Office Duties"
		}, {
			"id": "NoBD2",
			"name": "Assembler -- Electronic"
		}, {
			"id": "NoBD3",
			"name": "Blower -- Glass & Mirror"
		}, {
			"id": "NoBD4",
			"name": "Blower -- Mattress & Pillow"
		}, {
			"id": "NoBD5",
			"name": "Box/paper Bag Maker -- Paper & Pulp"
		}, {
			"id": "NoBD6",
			"name": "Candle Maker"
		}, {
			"id": "NoBD7",
			"name": "Carpenter"
		}, {
			"id": "NoBD8",
			"name": "Carpets & Rugs -- Worker"
		}, {
			"id": "NoBD9",
			"name": "Coater -- Artificial Leather / Flower"
		}, {
			"id": "NoBD10",
			"name": "Color Mixer/ Matcher -- Artificial Leather / Flower"
		}, {
			"id": "NoBD11",
			"name": "Cutter -- Glass & Mirror"
		}, {
			"id": "NoBD12",
			"name": "Cutter -- Mattress & Pillow"
		}, {
			"id": "NoBD13",
			"name": "Designer -- Textile"
		}, {
			"id": "NoBD14",
			"name": "Dye Mixer -- Textile"
		}, {
			"id": "NoBD15",
			"name": "Edge-grinder -- Glass & Mirror"
		}, {
			"id": "NoBD16",
			"name": "Electrician -- Neon-lights"
		}, {
			"id": "NoBD17",
			"name": "Electroplating Worker"
		}, {
			"id": "NoBD18",
			"name": "Embroidery - At Home -- Textile"
		}, {
			"id": "NoBD19",
			"name": "Embroidery - Using Computer -- Textile"
		}, {
			"id": "NoBD20",
			"name": "Engineer -- Electronic"
		}, {
			"id": "NoBD21",
			"name": "Envelope & Paper Bag Maker"
		}, {
			"id": "NoBD22",
			"name": "Explosive Manufacturing Worker"
		}, {
			"id": "NoBD23",
			"name": "Filler -- Mattress & Pillow"
		}, {
			"id": "NoBD24",
			"name": "Finisher -- Paper & Pulp"
		}, {
			"id": "NoBD25",
			"name": "Foreman -- Artificial Leather/flower (Not Involved in Production)"
		}, {
			"id": "NoBD26",
			"name": "Foreman -- Plastic (Not Involved in Production)"
		}, {
			"id": "NoBD27",
			"name": "Foreman -- Brick Manufacture (Not Involved in Production)"
		}, {
			"id": "NoBD28",
			"name": "Fur Maker"
		}, {
			"id": "NoBD29",
			"name": "Furnaceman -- Glass Making"
		}, {
			"id": "NoBD30",
			"name": "Furnaceman -- Metal"
		}, {
			"id": "NoBD31",
			"name": "Furniture Maker"
		}, {
			"id": "NoBD32",
			"name": "Glass Blender"
		}, {
			"id": "NoBD33",
			"name": "Grinder -- Brick Manufacture"
		}, {
			"id": "NoBD34",
			"name": "Handbag Maker"
		}, {
			"id": "NoBD35",
			"name": "Insecticide Worker -- Exposed to Poisonous Chemicals"
		}, {
			"id": "NoBD36",
			"name": "Insecticide Worker -- Not Exposed to Poisonous Chemicals"
		}, {
			"id": "NoBD37",
			"name": "Ironer -- Textile"
		}, {
			"id": "NoBD38",
			"name": "Jewellery Merchant"
		}, {
			"id": "NoBD39",
			"name": "Jewellery Worker"
		}, {
			"id": "NoBD40",
			"name": "Machine Operator -- Brick, Tyre Manufacture"
		}, {
			"id": "NoBD41",
			"name": "Machine Operator -- Mattress & Pillow"
		}, {
			"id": "NoBD42",
			"name": "Machine Tender -- Paper Making Operation -- Paper & Pulp"
		}, {
			"id": "NoBD43",
			"name": "Maintenance Man -- Neon-light Signs"
		}, {
			"id": "NoBD44",
			"name": "Marble Polisher"
		}, {
			"id": "NoBD45",
			"name": "Mixer -- Brick Manufacture"
		}, {
			"id": "NoBD46",
			"name": "Moulder -- Plastic, Brick, Tyre Manufacture"
		}, {
			"id": "NoBD47",
			"name": "Packer -- Non Hazardous Industries"
		}, {
			"id": "NoBD48",
			"name": "Painter -- Furniture"
		}, {
			"id": "NoBD49",
			"name": "Polisher -- Glass & Mirror"
		}, {
			"id": "NoBD50",
			"name": "Q.C."
		}, {
			"id": "NoBD51",
			"name": "Repairman -- Shoe"
		}, {
			"id": "NoBD52",
			"name": "Retreader -- Tyre Manufacture"
		}, {
			"id": "NoBD53",
			"name": "Sample Maker -- Textile"
		}, {
			"id": "NoBD54",
			"name": "Sewer -- Textile"
		}, {
			"id": "NoBD55",
			"name": "Shaper -- Tyre Manufacture"
		}, {
			"id": "NoBD56",
			"name": "Shoe Maker"
		}, {
			"id": "NoBD57",
			"name": "Sign Board Erector -- Ground Duties"
		}, {
			"id": "NoBD58",
			"name": "Sign Board Erector -- High Level Duties"
		}, {
			"id": "NoBD59",
			"name": "Sign Board Painter -- Ground Duties"
		}, {
			"id": "NoBD60",
			"name": "Sign Board Painter -- High Level Duties"
		}, {
			"id": "NoBD61",
			"name": "Silk Screen Printing Worker"
		}, {
			"id": "NoBD62",
			"name": "Sole Proprietor -- Little Manual Work Involved"
		}, {
			"id": "NoBD63",
			"name": "Sole Proprietor, Owner -- Office Duties"
		}, {
			"id": "NoBD64",
			"name": "Tailor"
		}, {
			"id": "NoBD65",
			"name": "Technician -- Electronics Industry"
		}, {
			"id": "NoBD66",
			"name": "Technician -- Glass & Mirror Industry"
		}, {
			"id": "NoBD67",
			"name": "Trimmer -- Textile Industry"
		}, {
			"id": "NoBD68",
			"name": "Weaver -- Textile"
		}]
	}, {
		"id": "NoB14",
		"nob": "Maritime",
		"position": [{
			"id": "NoBD1",
			"name": "Clerk, Other Office Admin. Personnel -- Office Duties"
		}, {
			"id": "NoBD2",
			"name": "Boat Builder - Small Boats"
		}, {
			"id": "NoBD3",
			"name": "Cargo Handler -- Dock"
		}, {
			"id": "NoBD4",
			"name": "Coolie"
		}, {
			"id": "NoBD5",
			"name": "Crane Operator"
		}, {
			"id": "NoBD6",
			"name": "Dock Superintendant -- Office Duties"
		}, {
			"id": "NoBD7",
			"name": "Painter -- Dock / Ships"
		}, {
			"id": "NoBD8",
			"name": "Pilot, Steward, Master, Chief Engineer, Chief Officer -- Ferry, Hydrofoil, Jetfoil (Hong Kong, Macau & South China Water Area)"
		}, {
			"id": "NoBD9",
			"name": "Sailor, Engine Room Worker -- Ferry,launch, Junk, Hydrofoil, Jetfoil (Hong Kong, Macau & South China Water Area)"
		}, {
			"id": "NoBD10",
			"name": "Pilot, Steward, Master, Chief Engineer, Chief Officer -- Ferry, Hydrofoil, Jetfoil (Other Than Hong Kong, Macau & South China Water Area)"
		}, {
			"id": "NoBD11",
			"name": "Sailor, Engine Room Worker -- Ferry,launch, Junk, Hydrofoil, Jetfoil (Other Than Hong Kong, Macau & South China Water Area)"
		}, {
			"id": "NoBD12",
			"name": "Ship Construction Repairman"
		}, {
			"id": "NoBD13",
			"name": "Welder & Cutter -- Dockyard For Ship Building"
		}, {
			"id": "NoBD14",
			"name": "Worker -- Barges, Tugs, Sailing Vessels, Sampans"
		}]
	}, {
		"id": "NoB15",
		"nob": "Medical, Dental & Veterinary",
		"position": [{
			"id": "NoBD1",
			"name": "Acupuncturist"
		}, {
			"id": "NoBD2",
			"name": "Clerk, Other Office Admin. Personnel -- Office Duties"
		}, {
			"id": "NoBD3",
			"name": "Amah"
		}, {
			"id": "NoBD4",
			"name": "Ambulanceman"
		}, {
			"id": "NoBD5",
			"name": "Ambulance Driver"
		}, {
			"id": "NoBD6",
			"name": "Anesthetist"
		}, {
			"id": "NoBD7",
			"name": "Auxiliary"
		}, {
			"id": "NoBD8",
			"name": "Bone Setter"
		}, {
			"id": "NoBD9",
			"name": "Chemist"
		}, {
			"id": "NoBD10",
			"name": "Chiropractor"
		}, {
			"id": "NoBD11",
			"name": "Dental Technician"
		}, {
			"id": "NoBD12",
			"name": "Dentist"
		}, {
			"id": "NoBD13",
			"name": "Dispenser"
		}, {
			"id": "NoBD14",
			"name": "Doctor -- Family Physician"
		}, {
			"id": "NoBD15",
			"name": "Doctor -- Surgeon"
		}, {
			"id": "NoBD16",
			"name": "Herbalist"
		}, {
			"id": "NoBD17",
			"name": "Kitchen Worker"
		}, {
			"id": "NoBD18",
			"name": "Laundry Worker"
		}, {
			"id": "NoBD19",
			"name": "Matron"
		}, {
			"id": "NoBD20",
			"name": "Nurse -- X-ray (therapeutic & Other Uses)"
		}, {
			"id": "NoBD21",
			"name": "Nurse (in Mental Ward)"
		}, {
			"id": "NoBD22",
			"name": "Nurse (in Prison)"
		}, {
			"id": "NoBD23",
			"name": "Nurse, Student Nurse"
		}, {
			"id": "NoBD24",
			"name": "Occupational Therapist"
		}, {
			"id": "NoBD25",
			"name": "Optician"
		}, {
			"id": "NoBD26",
			"name": "Optometrist"
		}, {
			"id": "NoBD27",
			"name": "Pharmacist"
		}, {
			"id": "NoBD28",
			"name": "Physiotherapist"
		}, {
			"id": "NoBD29",
			"name": "Radiologist"
		}, {
			"id": "NoBD30",
			"name": "Repairman -- Hospital/dental Equipment"
		}, {
			"id": "NoBD31",
			"name": "Technician -- in Laboratory, No X-ray Involved"
		}, {
			"id": "NoBD32",
			"name": "Veterinary -- Surgeon"
		}, {
			"id": "NoBD33",
			"name": "Veterinary Assistant"
		}]
	}, {
		"id": "NoB16",
		"nob": "Metal",
		"position": [{
			"id": "NoBD1",
			"name": "Clerk, Other Office Admin. Personnel -- Office Duties"
		}, {
			"id": "NoBD2",
			"name": "Blacksmith"
		}, {
			"id": "NoBD3",
			"name": "Boiler Maker"
		}, {
			"id": "NoBD4",
			"name": "Cashier -- Metal Shop"
		}, {
			"id": "NoBD5",
			"name": "Drill Operator"
		}, {
			"id": "NoBD6",
			"name": "Electroplater Work"
		}, {
			"id": "NoBD7",
			"name": "Fitter"
		}, {
			"id": "NoBD8",
			"name": "Goldsmith"
		}, {
			"id": "NoBD9",
			"name": "Hammerman"
		}, {
			"id": "NoBD10",
			"name": "Hydraulic Press Operator"
		}, {
			"id": "NoBD11",
			"name": "Key Duplicator"
		}, {
			"id": "NoBD12",
			"name": "Lathe Operator"
		}, {
			"id": "NoBD13",
			"name": "Locksmith"
		}, {
			"id": "NoBD14",
			"name": "Machinist -- Machine Shop"
		}, {
			"id": "NoBD15",
			"name": "Mechanic -- Machine Shop"
		}, {
			"id": "NoBD16",
			"name": "Millwright"
		}, {
			"id": "NoBD17",
			"name": "Moulder"
		}, {
			"id": "NoBD18",
			"name": "Pattern Maker"
		}, {
			"id": "NoBD19",
			"name": "Planner -- Machine Shop (Office Duties)"
		}, {
			"id": "NoBD20",
			"name": "Punch-presser"
		}, {
			"id": "NoBD21",
			"name": "Salesman -- Metal Shop"
		}, {
			"id": "NoBD22",
			"name": "Shaper"
		}, {
			"id": "NoBD23",
			"name": "Sheet Metal Worker"
		}, {
			"id": "NoBD24",
			"name": "Slotter"
		}, {
			"id": "NoBD25",
			"name": "Tinsmith"
		}, {
			"id": "NoBD26",
			"name": "Toolmaker"
		}, {
			"id": "NoBD27",
			"name": "Watch Case Maker"
		}, {
			"id": "NoBD28",
			"name": "Welder -- Indoor"
		}]
	}, {
		"id": "NoB17",
		"nob": "Military Force",
		"position": [{
			"id": "NoBD1",
			"name": "Officer -- Office Duties"
		}, {
			"id": "NoBD2",
			"name": "Soldier"
		}]
	}, {
		"id": "NoB18",
		"nob": "Mining & Extraction",
		"position": [{
			"id": "NoBD1",
			"name": "Clerk, Other Office Admin. Personnel -- Office Duties"
		}, {
			"id": "NoBD2",
			"name": "Bulldozer Operator"
		}, {
			"id": "NoBD3",
			"name": "Dredge Worker"
		}, {
			"id": "NoBD4",
			"name": "Explosive Handler - Mines & Quarries"
		}, {
			"id": "NoBD5",
			"name": "Grinder"
		}, {
			"id": "NoBD6",
			"name": "Open Mine Worker"
		}, {
			"id": "NoBD7",
			"name": "Pile Operator -- Quarry & Logging"
		}, {
			"id": "NoBD8",
			"name": "Polisher -- Stone"
		}, {
			"id": "NoBD9",
			"name": "Quarry Worker"
		}, {
			"id": "NoBD10",
			"name": "Stone Carver"
		}, {
			"id": "NoBD11",
			"name": "Tractor Driver"
		}, {
			"id": "NoBD12",
			"name": "Underground Blaster"
		}]
	}, {
		"id": "NoB19",
		"nob": "Public Utilities",
		"position": [{
			"id": "NoBD1",
			"name": "Clerk, Other Office Admin. Personnel -- Office Duties"
		}, {
			"id": "NoBD2",
			"name": "Cable Splicer -- Electricity Supply"
		}, {
			"id": "NoBD3",
			"name": "Cable-splicer - Conduit & Tunnel -- Electricity Supply"
		}, {
			"id": "NoBD4",
			"name": "Driver -- Public Sanitation"
		}, {
			"id": "NoBD5",
			"name": "Electrical Engineer - Consulting & Designing Duties"
		}, {
			"id": "NoBD6",
			"name": "Electrical Engineer - Inspection & Supervision"
		}, {
			"id": "NoBD7",
			"name": "Electrician -- Power House & Electrical Sub-station"
		}, {
			"id": "NoBD8",
			"name": "Engineer -- Outdoor Work, Maintenance Duties"
		}, {
			"id": "NoBD9",
			"name": "Engineer -- Power House & Electrical Sub-station"
		}, {
			"id": "NoBD10",
			"name": "Garbageman -- Public Sanitation"
		}, {
			"id": "NoBD11",
			"name": "Gas -- Deliveryman"
		}, {
			"id": "NoBD12",
			"name": "Gas -- Installer (at Construction Site)"
		}, {
			"id": "NoBD13",
			"name": "Gas -- Household Installer"
		}, {
			"id": "NoBD14",
			"name": "Gas -- Shop Retailer"
		}, {
			"id": "NoBD15",
			"name": "Groundman -- Electrical Power Line Construction, Maintenance & Operation Of Overhead Lines -- Electricity Supply"
		}, {
			"id": "NoBD16",
			"name": "Groundman -- Outdoor Work, Maintenance -- Telephone"
		}, {
			"id": "NoBD17",
			"name": "Housewireman -- Outdoor Work, Maintenance -- Telephone"
		}, {
			"id": "NoBD18",
			"name": "Inspector -- Public Sanitation"
		}, {
			"id": "NoBD19",
			"name": "Installer -- Telephone & Telegram"
		}, {
			"id": "NoBD20",
			"name": "Lineman -- Electricity Supply"
		}, {
			"id": "NoBD21",
			"name": "Linesman/repairman -- Maintenance -- Telephone & Telegram"
		}, {
			"id": "NoBD22",
			"name": "Load Dispatcher -- Power House & Sub-station -- Electricity Supply"
		}, {
			"id": "NoBD23",
			"name": "Meter Installer"
		}, {
			"id": "NoBD24",
			"name": "Meter Reader"
		}, {
			"id": "NoBD25",
			"name": "Piles Cleaner"
		}, {
			"id": "NoBD26",
			"name": "Plant Superintendant -- Power House & Electrical Sub-station"
		}, {
			"id": "NoBD27",
			"name": "Pole Setter -- Power Line Construction, Maintenance & Operation of Overhead Lines"
		}, {
			"id": "NoBD28",
			"name": "Repairman -- Gas (Indoor)"
		}, {
			"id": "NoBD29",
			"name": "Repairman -- Gas (Outdoor)"
		}, {
			"id": "NoBD30",
			"name": "Repairman -- Power House & Electrical Sub-station"
		}, {
			"id": "NoBD31",
			"name": "Repairman -- Towngas Supply"
		}, {
			"id": "NoBD32",
			"name": "Rigger -- Power House & Electrical Sub-station"
		}, {
			"id": "NoBD33",
			"name": "Station Engineer -- Power House & Electrical Sub-station"
		}, {
			"id": "NoBD34",
			"name": "Street Cleaner"
		}, {
			"id": "NoBD35",
			"name": "Supervisor -- Garbage Disposal Plant & Incinerator"
		}, {
			"id": "NoBD36",
			"name": "Switchboard Wireman -- Power House & Electrical Sub-station"
		}, {
			"id": "NoBD37",
			"name": "Telephone Operator"
		}, {
			"id": "NoBD38",
			"name": "Tower Erector -- Electrical Power Lines"
		}, {
			"id": "NoBD39",
			"name": "Tower Erector -- Work At Height -- Telephone & Telegram"
		}, {
			"id": "NoBD40",
			"name": "Transformer -- Tunnels & Conduits -- Electricity Supply"
		}, {
			"id": "NoBD41",
			"name": "Transformer Operator -- Power House & Electrical Sub-station"
		}, {
			"id": "NoBD42",
			"name": "Turbine Operator -- Power House & Electrical Sub-station"
		}, {
			"id": "NoBD43",
			"name": "Wheelroom Attendant -- Power House & Electrical Sub-station"
		}]
	}, {
		"id": "NoB20",
		"nob": "Retail & Sales",
		"position": [{
			"id": "NoBD1",
			"name": "Clerk, Other Office Admin. Personnel -- Office Duties"
		}, {
			"id": "NoBD2",
			"name": "Assembler -- Clock Shop"
		}, {
			"id": "NoBD3",
			"name": "Boutique -- Indoor Salesman"
		}, {
			"id": "NoBD4",
			"name": "Butcher -- Slaughter House & Supermarket"
		}, {
			"id": "NoBD5",
			"name": "Cashier -- Supermarket"
		}, {
			"id": "NoBD6",
			"name": "Fish Monger -- Stall Owner At Market Place (Fixed Location) & Supermarket"
		}, {
			"id": "NoBD7",
			"name": "Fish Monger -- Wholesaler"
		}, {
			"id": "NoBD8",
			"name": "Florist"
		}, {
			"id": "NoBD9",
			"name": "Fruiterer"
		}, {
			"id": "NoBD10",
			"name": "Grocer"
		}, {
			"id": "NoBD11",
			"name": "Hawker -- Fixed Location (Licensed)"
		}, {
			"id": "NoBD12",
			"name": "Hawker -- No Fixed Location (Licensed)"
		}, {
			"id": "NoBD13",
			"name": "Merchandiser -- Outdoor"
		}, {
			"id": "NoBD14",
			"name": "Pet Shop -- Owner, Shop Assistant"
		}, {
			"id": "NoBD15",
			"name": "Petrol Station Attendant"
		}, {
			"id": "NoBD16",
			"name": "Property Consultant/agent/negotiator"
		}, {
			"id": "NoBD17",
			"name": "Proprietor -- Office Duties"
		}, {
			"id": "NoBD18",
			"name": "Proprietor -- Some Manual Work / Outdoor Duties Involved"
		}, {
			"id": "NoBD19",
			"name": "Repairman -- Clock Shop"
		}, {
			"id": "NoBD20",
			"name": "Repairman -- Office Equipment"
		}, {
			"id": "NoBD21",
			"name": "Sales -- Jewellery Indoor"
		}, {
			"id": "NoBD22",
			"name": "Sales -- Jewellery Outdoor"
		}, {
			"id": "NoBD23",
			"name": "Sales Manager -- Office Duties"
		}, {
			"id": "NoBD24",
			"name": "Salesman -- Door To Door Sales"
		}, {
			"id": "NoBD25",
			"name": "Security Guard (Unarmed)"
		}, {
			"id": "NoBD26",
			"name": "Shop Assistant"
		}, {
			"id": "NoBD27",
			"name": "Stock/forex Broker"
		}, {
			"id": "NoBD28",
			"name": "Store Keeper"
		}, {
			"id": "NoBD29",
			"name": "Supervisor -- Supermarket"
		}]
	}, {
		"id": "NoB21",
		"nob": "Sports",
		"position": [{
			"id": "NoBD1",
			"name": "Clerk, Other Office Admin. Personnel -- Office Duties"
		}, {
			"id": "NoBD2",
			"name": "Boxer -- Professional Players"
		}, {
			"id": "NoBD3",
			"name": "Boxer Coach"
		}, {
			"id": "NoBD4",
			"name": "Coach -- Badminton, Basketball, Gymnastic, Swimming, Tennis, Volleyball"
		}, {
			"id": "NoBD5",
			"name": "Diving (Complete Diving Questionnaire)"
		}, {
			"id": "NoBD6",
			"name": "Football -- Coach, Professional Players"
		}, {
			"id": "NoBD7",
			"name": "Golf Trainer"
		}, {
			"id": "NoBD8",
			"name": "Health Club Instructor"
		}, {
			"id": "NoBD9",
			"name": "Horse Riding -- Non Racing (Complete Horse Riding Questionnaire)"
		}, {
			"id": "NoBD10",
			"name": "Horse Trainer"
		}, {
			"id": "NoBD11",
			"name": "Jockey"
		}, {
			"id": "NoBD12",
			"name": "Judo/karate Coach (Complete Avocation Questionaire)"
		}, {
			"id": "NoBD13",
			"name": "Judo/karate Fighter (Complete Avocation Questionaire)"
		}, {
			"id": "NoBD14",
			"name": "Mafoo"
		}, {
			"id": "NoBD15",
			"name": "Professional Player -- Badminton, Basketball, Gymnastic, Swimming, Tennis, Volleyball"
		}, {
			"id": "NoBD16",
			"name": "Racing Car Driver (Complete Racing Questionnaire)"
		}, {
			"id": "NoBD17",
			"name": "Stableman -- Horse Racing"
		}, {
			"id": "NoBD18",
			"name": "Windsurfing Instructor"
		}, {
			"id": "NoBD19",
			"name": "Wrestler -- Coach"
		}, {
			"id": "NoBD20",
			"name": "Wrestler -- Professional Players"
		}]
	}, {
		"id": "NoB22",
		"nob": "Transportation",
		"position": [{
			"id": "NoBD1",
			"name": "Clerk, Other Office Admin. Personnel -- Office Duties"
		}, {
			"id": "NoBD2",
			"name": "Attendant -- Railroad (MTR, LTR, KCR)"
		}, {
			"id": "NoBD3",
			"name": "Bus Station Officer"
		}, {
			"id": "NoBD4",
			"name": "Car Washer -- Garage, Service Station"
		}, {
			"id": "NoBD5",
			"name": "Deliveryman -- By Motor Cycle"
		}, {
			"id": "NoBD6",
			"name": "Deliveryman -- DHL, Express"
		}, {
			"id": "NoBD7",
			"name": "Deliveryman -- Heavy Materials"
		}, {
			"id": "NoBD8",
			"name": "Driver -- Buses & Coaches & Light Bus"
		}, {
			"id": "NoBD9",
			"name": "Driver -- Heavy Goods Vehicle, Container Trucks, Lorry, Trucks, Vans"
		}, {
			"id": "NoBD10",
			"name": "Driver -- MTR, LTR, KCR, Tram"
		}, {
			"id": "NoBD11",
			"name": "Driver -- Private Car, Taxi"
		}, {
			"id": "NoBD12",
			"name": "Driving Instructor"
		}, {
			"id": "NoBD13",
			"name": "Forklift Operator -- Container"
		}, {
			"id": "NoBD14",
			"name": "Mechanic -- Service Station, Garage"
		}, {
			"id": "NoBD15",
			"name": "Owner -- Bicycle Shop"
		}, {
			"id": "NoBD16",
			"name": "Owner -- Service Station, Garage (No Manual Work Involved)"
		}, {
			"id": "NoBD17",
			"name": "Painter -- Service Station, Garage"
		}, {
			"id": "NoBD18",
			"name": "Removal Worker -- Furniture, Machinery, Piano & Safe etc. (Heavy Materials)"
		}, {
			"id": "NoBD19",
			"name": "Repairman -- Bicycle Shop"
		}, {
			"id": "NoBD20",
			"name": "Repairman -- Railroads, MTR, LTR, KCR, Tram"
		}, {
			"id": "NoBD21",
			"name": "Repairman -- Service Station & Garage"
		}, {
			"id": "NoBD22",
			"name": "Traffic Controller (Work Above Ground Level) -- Container Port"
		}, {
			"id": "NoBD23",
			"name": "Yard Checker -- Container Port (Ground Duties)"
		}]
	}, {
		"id": "NoB23",
		"nob": "Others",
		"position": [{
			"id": "NoBD1",
			"name": "Domestic Helper -- Full Time"
		}, {
			"id": "NoBD2",
			"name": "Domestic Helper -- Part Time"
		}, {
			"id": "NoBD3",
			"name": "Fortune Teller"
		}, {
			"id": "NoBD4",
			"name": "Gardener -- Domestic"
		}, {
			"id": "NoBD5",
			"name": "Hairdresser / Hairstylist"
		}, {
			"id": "NoBD6",
			"name": "Housewife"
		}, {
			"id": "NoBD7",
			"name": "Juvenile"
		}, {
			"id": "NoBD8",
			"name": "Lawyer / Solicitor"
		}, {
			"id": "NoBD9",
			"name": "Messenger -- On Foot"
		}, {
			"id": "NoBD10",
			"name": "Messenger -- By Motor Cycle"
		}, {
			"id": "NoBD11",
			"name": "Missionary"
		}, {
			"id": "NoBD12",
			"name": "Model"
		}, {
			"id": "NoBD13",
			"name": "Monk"
		}, {
			"id": "NoBD14",
			"name": "Nun"
		}, {
			"id": "NoBD15",
			"name": "Nursery Worker"
		}, {
			"id": "NoBD16",
			"name": "Others"
		}, {
			"id": "NoBD17",
			"name": "Owner -- Pawn Shop"
		}, {
			"id": "NoBD18",
			"name": "Pastor"
		}, {
			"id": "NoBD19",
			"name": "Priest"
		}, {
			"id": "NoBD20",
			"name": "Private Detective"
		}, {
			"id": "NoBD21",
			"name": "Retired"
		}, {
			"id": "NoBD22",
			"name": "Unemployed"
		}, {
			"id": "NoBD23",
			"name": "Secretary"
		}, {
			"id": "NoBD24",
			"name": "Stock Controller -- Ware House, Godown"
		}, {
			"id": "NoBD25",
			"name": "Student"
		}, {
			"id": "NoBD26",
			"name": "Artist -- Freelance Or Salaried"
		}, {
			"id": "NoBD27",
			"name": "Babysitter / Nanny"
		}, {
			"id": "NoBD28",
			"name": "Beauty Consultant -- Hair Saloon"
		}, {
			"id": "NoBD29",
			"name": "Body Guard (Private)"
		}]
	}, {
		"id": "NoB24",
		"nob": "General Occupations",
		"position": [{
			"id": "NoBD1",
			"name": "Professional Duties"
		}, {
			"id": "NoBD2",
			"name": "Indoor Office Duties"
		}, {
			"id": "NoBD3",
			"name": "Indoor Work,little Manual Work Involved"
		}, {
			"id": "NoBD4",
			"name": "Outdoor Duties Involved,some Manual Work"
		}, {
			"id": "NoBD5",
			"name": "Manual Work, Mostly Indoor Duties"
		}, {
			"id": "NoBD6",
			"name": "Labourer, Sometimes Need Outdoor Work"
		}, {
			"id": "NoBD7",
			"name": "Mechanic Worker, Inside Building Work"
		}, {
			"id": "NoBD8",
			"name": "Higher Risk Mechanic Worker, Inside Building Work"
		}, {
			"id": "NoBD9",
			"name": "High Risk Job, Outside And High Level Duties"
		}, {
			"id": "NoBD10",
			"name": "Higher Risk Job,Outside And High Level Duties"
		}]
	}]
}
</script>