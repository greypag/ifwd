var ReviewPageLocale = {
	"en":{
		"edit":"Edit",
		"gender":["Male", "Female"],
		"marital_status" : ["Single", "Married", "Divorced", "Widowed"],
		"dependents":["Nil", "1-3", "4-6", "7 or above"],
		"education": ["Primary or below","Secondary / Matriculation","Vocational Training / Technical Institute / Business Institute","Post-secondary / University or above"],
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
	},
	"tc":{
		"edit":"修改",
		"gender":["男", "女"],
		"marital_status" : ["單身","結婚","離婚","喪偶"],
		"dependents":["無", "1-3", "4-6", "7或以上"],
		"education": ["小學或以下","中學 / 預科","職業訓 / 工業學院 / 商業學院","大專 / 大學或以上"],
		"occupation_others_empty":"Please specify your occupation",
		"select":"- - - 請選擇 - - -",
		"select_empty":"Please select your occupation",
		"q1_empty":"Please tick one or more",
		"q2_empty":"Please tick one or more",
		"q3_empty":"Please tick one",
		"q4_a_empty":"Please tick one",
		"q4_a_others":"Please input specific amount",
		"q4_b_empty":"Please tick one or more",		
		"q4_b_others":"Please specify other liquid assets",
		"q4_b_amount":"Please input total amount",
		"number":"Please input valid amount",
		"q4_e_empty":"Please tick one",
		"q4_f_empty":"Please tick one",
		"q4_g_empty":"Please tick one or more",
		"q4_g_others":"Please specify other sources of funds",
	}
}




var FNAQuestion ={
	"en":[{
		  "id": "q1",
		  "num": "1",
		  "title": "What are your objectives of buying our product? <span>(tick one or more) </span>",
		  "option": [{
		    "id": 0,
		    "title": "Preparation for health care needs",
		    "caption": "(e.g. critical illness, hospitalization etc)"
		  }, {
		    "id": 1,
		    "title": "Providing regular income in the future",
		    "caption": "(e.g. retirement income etc)"
		  }, {
		    "id": 2,
		    "title": "Saving up for the future",
		    "caption": "(e.g. child education, retirement etc)"
		  }, {
		    "id": 3,
		    "title": "Investment",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "Others",
		    "caption": "",
		    "popup": true
		  }]
		}, {
		  "id": "q2",
		  "num": "2",
		  "title": "What type(s) of insurance products you are looking for to meet your objectives above? <span>(tick one or more)</span>",
		  "option": [{
		    "id": 0,
		    "title": "Pure insurance product",
		    "caption": "-without any savings or investment element (e.g. term insurance)"
		  }, {
		    "id": 1,
		    "title": "Insurance product with savings element ",
		    "caption": "-with savings but without investment element (e.g. non-participating policy)"
		  }, {
		    "id": 2,
		    "title": "Insurance product with investment element",
		    "caption": "-Investment decisions and risks borne by insurer (e.g. participating policy, universal life insurance)"
		  }, {
		    "id": 3,
		    "title": "Insurance product with investment element",
		    "caption": "-Investment decisions and risks borne by policyholder (e.g. Investment-Linked Assurance Schemes)"
		  }, {
		    "id": 4,
		    "title": "Others",
		    "caption": "",
		    "popup": true
		  }]
		}, {
		  "id": "q3",
		  "num": "3",
		  "title": "What is your target benefit / protection period for insurance policy and/or investment plan? <span>(tick one)</span>",
		  "option": [{
		    "id": 0,
		    "title": "&lt; 1 year",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "1-5 years",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "6-10 years",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "11-20 years",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "&gt; 20 years",
		    "caption": ""
		  }, {
		    "id": 5,
		    "title": "Whole of life",
		    "caption": ""
		  }]
		}, {
		  "id": "q4",
		  "num": "4",
		  "title": "Your ability pay premium is originally from your income:",
		  "option": [{
		    "id": 0,
		    "title": "Yes",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "No",
		    "caption": ""
		  }]
		}, {
		  "id": "q4_a",
		  "num": "4a",
		  "title": "What is your average monthly income from all sources in the past 2 years? <span>(tick one or more)</span>",
		  "option": [{
		    "id": 0,
		    "title": "Speciﬁc amount: <br>Not less than HK$ {0} per month",
		    "caption": "",
		    "other": "q4_a_others"
		  }, {
		    "id": 1,
		    "title": "less than HK$10,000",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "HK$10,000 - $19,999",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "HK$20,000 - HK$49,999",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "HK$50,000 - HK$100,000",
		    "caption": ""
		  }, {
		    "id": 5,
		    "title": "over HK$100,000",
		    "caption": ""
		  }]
		}, {
		  "id": "q4_b",
		  "num": "4b",
		  "title": "What is your approximate current accumulative amount of liquid assets?  <span>Please specify type(s) and total amount</span>",
		  "option": [{
		    "id": 0,
		    "title": "Cash",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "Money market accounts",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "Money in bank accounts",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "Actively traded stocks",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "Bonds and mutual funds",
		    "caption": ""
		  }, {
		    "id": 5,
		    "title": "US Treasury bills",
		    "caption": ""
		  }, {
		    "id": 6,
		    "title": "Others",
		    "caption": "",
		    "popup": true
		  }, {
		    "id": 7,
		    "title": "Amount: HK$ {0}",
		    "caption": " Note: Liquid assets are assets which may be easily turned into cash. <br>Real estate, coin collection and arkwork are not considered to be liquid assets.",
		    "other": "q4_b_amount"
		  }]
		}, {
		  "id": "q4_c",
		  "num": "4c",
		  "title": "What is your average monthly expenses including but not limited to living expenses, household expenses, including dependent's expenses mortage payment and regular payment in past 2 years?",
		  "option": [{
		    "id": 0,
		    "title": "Total Expenses not less than",
		    "caption": "HK$ {0} per month",
		    "other":"q4_c_others"
		  }]
		}, {
		  "id": "q4_d_1",
		  "num": "4d (i)",
		  "title": "What is your total liabilities and estimated ﬁnal expenses including but not limited to the outstanding mortgage loan, loans&nbsp;/&nbsp;debts, estate duties, funeral and associated expenses and emergency fund? ",
		  "option": [{
		    "id": 0,
		    "title": "Total not less than HK$ {0}",
		    "caption": "",
		    "other":"q4_d_1_others"
		  }]
		}, {
		  "id": "q4_d_2",
		  "num": "4d (iI)",
		  "title": "What is your total financial targets including but not limited to the education fund for yourself or dependents and estimated marriage expenses? ",
		  "option": [{
		    "id": 0,
		    "title": "Total not less than HK$ {0}",
		    "caption": "",
		    "other":"q4_d_2_others"
		  }]
		}, {
		  "id": "q4_e",
		  "num": "4e",
		  "title": "For how long are you able and willing to contribute to an insurance policy and/or investment plan?<span>(tick one)</span>",
		  "option": [{
		    "id": 0,
		    "title": "&lt; 1 year",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "1-5 years",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "6-10 years",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "11-20 years",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "&gt; 20 years",
		    "caption": ""
		  }, {
		    "id": 5,
		    "title": "Whole of life",
		    "caption": ""
		  }]
		}, {
		  "id": "q4_f",
		  "num": "4f",
		  "title": "Approximately what percentage of your disposable income would you be able to use to pay your monthly premium for the entire term of the insurance policy / investment plan in (4e) above? <span>(tick one)</span>",
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
		  "title": "In considering your ability to make payments, what are your sources of funds? <span>(tick one or more)</span>",
		  "option": [{
		    "id": 0,
		    "title": "Salary",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "Income",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "Savings",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "Investment",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "Others",
		    "caption": "",
		    "popup": true
		  }]
		}],
	"tc":[{
		  "id": "q1",
		  "num": "1",
		  "title": "What are your objectives of buying our product? <span>(tick one or more) </span>",
		  "option": [{
		    "id": 0,
		    "title": "Preparation for health care needs",
		    "caption": "(e.g. critical illness, hospitalization etc)"
		  }, {
		    "id": 1,
		    "title": "Providing regular income in the future",
		    "caption": "(e.g. retirement income etc)"
		  }, {
		    "id": 2,
		    "title": "Saving up for the future",
		    "caption": "(e.g. child education, retirement etc)"
		  }, {
		    "id": 3,
		    "title": "Investment",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "Others",
		    "caption": "",
		    "popup": true
		  }]
		}, {
		  "id": "q2",
		  "num": "2",
		  "title": "What type(s) of insurance products you are looking for to meet your objectives above? <span>(tick one or more)</span>",
		  "option": [{
		    "id": 0,
		    "title": "Pure insurance product",
		    "caption": "-without any savings or investment element (e.g. term insurance)"
		  }, {
		    "id": 1,
		    "title": "Insurance product with savings element ",
		    "caption": "-with savings but without investment element (e.g. non-participating policy)"
		  }, {
		    "id": 2,
		    "title": "Insurance product with investment element",
		    "caption": "-Investment decisions and risks borne by insurer (e.g. participating policy, universal life insurance)"
		  }, {
		    "id": 3,
		    "title": "Insurance product with investment element",
		    "caption": "-Investment decisions and risks borne by policyholder (e.g. Investment-Linked Assurance Schemes)"
		  }, {
		    "id": 4,
		    "title": "Others",
		    "caption": "",
		    "popup": true
		  }]
		}, {
		  "id": "q3",
		  "num": "3",
		  "title": "What is your target benefit / protection period for insurance policy and/or investment plan? <span>(tick one)</span>",
		  "option": [{
		    "id": 0,
		    "title": "&lt; 1 year",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "1-5 years",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "6-10 years",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "11-20 years",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "&gt; 20 years",
		    "caption": ""
		  }, {
		    "id": 5,
		    "title": "Whole of life",
		    "caption": ""
		  }]
		}, {
		  "id": "q4",
		  "num": "4",
		  "title": "Your ability pay premium is originally from your income:",
		  "option": [{
		    "id": 0,
		    "title": "Yes",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "No",
		    "caption": ""
		  }]
		}, {
		  "id": "q4_a",
		  "num": "4a",
		  "title": "What is your average monthly income from all sources in the past 2 years? <span>(tick one or more)</span>",
		  "option": [{
		    "id": 0,
		    "title": "Speciﬁc amount: <br>Not less than HK$ {0} per month",
		    "caption": "",
		    "other": "q4_a_others"
		  }, {
		    "id": 1,
		    "title": "less than HK$10,000",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "HK$10,000 - $19,999",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "HK$20,000 - HK$49,999",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "HK$50,000 - HK$100,000",
		    "caption": ""
		  }, {
		    "id": 5,
		    "title": "over HK$100,000",
		    "caption": ""
		  }]
		}, {
		  "id": "q4_b",
		  "num": "4b",
		  "title": "What is your approximate current accumulative amount of liquid assets?  <span>Please specify type(s) and total amount</span>",
		  "option": [{
		    "id": 0,
		    "title": "Cash",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "Money market accounts",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "Money in bank accounts",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "Actively traded stocks",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "Bonds and mutual funds",
		    "caption": ""
		  }, {
		    "id": 5,
		    "title": "US Treasury bills",
		    "caption": ""
		  }, {
		    "id": 6,
		    "title": "Others",
		    "caption": "",
		    "popup": true
		  }, {
		    "id": 7,
		    "title": "Amount: HK$ {0}",
		    "caption": " Note: Liquid assets are assets which may be easily turned into cash. <br>Real estate, coin collection and arkwork are not considered to be liquid assets.",
		    "other": "q4_b_amount"
		  }]
		}, {
		  "id": "q4_c",
		  "num": "4c",
		  "title": "What is your average monthly expenses including but not limited to living expenses, household expenses, including dependent's expenses mortage payment and regular payment in past 2 years?",
		  "option": [{
		    "id": 0,
		    "title": "Total Expenses not less than",
		    "caption": "HK$ {0} per month",
		    "other":"q4_c_others"
		  }]
		}, {
		  "id": "q4_d_1",
		  "num": "4d (i)",
		  "title": "What is your total liabilities and estimated ﬁnal expenses including but not limited to the outstanding mortgage loan, loans&nbsp;/&nbsp;debts, estate duties, funeral and associated expenses and emergency fund? ",
		  "option": [{
		    "id": 0,
		    "title": "Total not less than HK$ {0}",
		    "caption": "",
		    "other":"q4_d_1_others"
		  }]
		}, {
		  "id": "q4_d_2",
		  "num": "4d (iI)",
		  "title": "What is your total financial targets including but not limited to the education fund for yourself or dependents and estimated marriage expenses? ",
		  "option": [{
		    "id": 0,
		    "title": "Total not less than HK$ {0}",
		    "caption": "",
		    "other":"q4_d_2_others"
		  }]
		}, {
		  "id": "q4_e",
		  "num": "4e",
		  "title": "For how long are you able and willing to contribute to an insurance policy and/or investment plan?<span>(tick one)</span>",
		  "option": [{
		    "id": 0,
		    "title": "&lt; 1 year",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "1-5 years",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "6-10 years",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "11-20 years",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "&gt; 20 years",
		    "caption": ""
		  }, {
		    "id": 5,
		    "title": "Whole of life",
		    "caption": ""
		  }]
		}, {
		  "id": "q4_f",
		  "num": "4f",
		  "title": "Approximately what percentage of your disposable income would you be able to use to pay your monthly premium for the entire term of the insurance policy / investment plan in (4e) above? <span>(tick one)</span>",
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
		  "title": "In considering your ability to make payments, what are your sources of funds? <span>(tick one or more)</span>",
		  "option": [{
		    "id": 0,
		    "title": "Salary",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "Income",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "Savings",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "Investment",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "Others",
		    "caption": "",
		    "popup": true
		  }]
		}]
}




var Status = {
	"en":[{
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
		}],
	"tc":[{
			"name": "全職",
			"id": "ES1",
			"disable":false
		}, {
			"name": "兼職",
			"id": "ES2",
			"disable":false
		}, {
			"name": "自僱",
			"id": "ES3",
			"disable":false
		},{
			"name": "待業人士",
			"id": "ES4",
			"disable":true
		}, {
			"name": "退休人士",
			"id": "ES5",
			"disable":true
		}, {
			"name": "學生",
			"id": "ES6",
			"disable":true
		}, {
			"name": "家庭主婦",
			"id": "ES7",
			"disable":true
		}]
}




var Occupation = {
	"en": [{
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
	}],
	"tc": [{
		"id": "NoB1",
		"nob": "漁農業",
		"position": [{
			"id": "NoBD1",
			"name": "農夫 -- 一般耕作"
		}, {
			"id": "NoBD2",
			"name": "農夫 -- 飼養生禽"
		}, {
			"id": "NoBD3",
			"name": "漁夫 -- 漁塘，湖及河"
		}, {
			"id": "NoBD4",
			"name": "漁夫 -- 每日返回香港"
		}, {
			"id": "NoBD5",
			"name": "漁夫 -- 不會每日返回香港"
		}, {
			"id": "NoBD6",
			"name": "園丁"
		}, {
			"id": "NoBD7",
			"name": "工人 -- 農埸"
		}, {
			"id": "NoBD8",
			"name": "老闆 -- 農埸"
		}]
	}, {
		"id": "NoB2",
		"nob": "航空",
		"position": [{
			"id": "NoBD1",
			"name": "文員，其他辦公室行政職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD2",
			"name": "航空檢查員"
		}, {
			"id": "NoBD3",
			"name": "行李／貨運處理員"
		}, {
			"id": "NoBD4",
			"name": "工程師 -- 負責地勤工作"
		}, {
			"id": "NoBD5",
			"name": "班次／交通監督及督導"
		}, {
			"id": "NoBD6",
			"name": "食物運送工人"
		}, {
			"id": "NoBD7",
			"name": "加油工人"
		}, {
			"id": "NoBD8",
			"name": "地勤空姐"
		}, {
			"id": "NoBD9",
			"name": "直升機駕駛員"
		}, {
			"id": "NoBD10",
			"name": "空姐, 民航機飛行服務員"
		}, {
			"id": "NoBD11",
			"name": "維修人員"
		}, {
			"id": "NoBD12",
			"name": "技工"
		}, {
			"id": "NoBD13",
			"name": "飛機師 -- 商務航機"
		}, {
			"id": "NoBD14",
			"name": "飛機師 -- 非商務航機〔先填妥航空問卷〕"
		}, {
			"id": "NoBD15",
			"name": "清潔工人 -- 飛機倉"
		}, {
			"id": "NoBD16",
			"name": "清潔工人 -- 外殼"
		}, {
			"id": "NoBD17",
			"name": "通訊器操作員"
		}, {
			"id": "NoBD18",
			"name": "票務人員"
		}, {
			"id": "NoBD19",
			"name": "飛行指導員"
		}, {
			"id": "NoBD20",
			"name": "天氣觀察員 -- 負責地勤工作"
		}]
	}, {
		"id": "NoB3",
		"nob": "廣播 (電台及電視)，傳媒，印刷及出版",
		"position": [{
			"id": "NoBD1",
			"name": "客戶／市埸拓展主任"
		}, {
			"id": "NoBD2",
			"name": "文員，其他辦公室行政職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD3",
			"name": "安裝天線員 -- 住宅及辦公室"
		}, {
			"id": "NoBD4",
			"name": "統籌 -- 負責辦公室工作"
		}, {
			"id": "NoBD5",
			"name": "撰稿員"
		}, {
			"id": "NoBD6",
			"name": "唱片騎師"
		}, {
			"id": "NoBD7",
			"name": "設計師"
		}, {
			"id": "NoBD8",
			"name": "編輯"
		}, {
			"id": "NoBD9",
			"name": "工程師 -- 負責辦公室工作"
		}, {
			"id": "NoBD10",
			"name": "報紙派送員"
		}, {
			"id": "NoBD11",
			"name": "攝影師 -- 室內工作"
		}, {
			"id": "NoBD12",
			"name": "印刷及出版工人"
		}, {
			"id": "NoBD13",
			"name": "節目製作助理"
		}, {
			"id": "NoBD14",
			"name": "一般記者"
		}, {
			"id": "NoBD15",
			"name": "戰地記者"
		}, {
			"id": "NoBD16",
			"name": "電台及演播室導播"
		}, {
			"id": "NoBD17",
			"name": "總機控制員"
		}, {
			"id": "NoBD18",
			"name": "電視訊號發送機維修員 -- 室外, 高空工作"
		}, {
			"id": "NoBD19",
			"name": "電視機修理員"
		}, {
			"id": "NoBD20",
			"name": "電線安裝工人"
		}]
	}, {
		"id": "NoB4",
		"nob": "建造，建築物維修及管理",
		"position": [{
			"id": "NoBD1",
			"name": "文員，其他辦公室行政職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD2",
			"name": "冷氣工程安裝工人及修理工人 -- 室內工作"
		}, {
			"id": "NoBD3",
			"name": "冷氣工程安裝工人及修理工人 -- 室外, 高空工作"
		}, {
			"id": "NoBD4",
			"name": "氣鎚操作員"
		}, {
			"id": "NoBD5",
			"name": "警鐘系統安裝工人"
		}, {
			"id": "NoBD6",
			"name": "鋁窗架安裝工人 -- 室內工作"
		}, {
			"id": "NoBD7",
			"name": "鋁窗架安裝工人 -- 室外, 高空工作"
		}, {
			"id": "NoBD8",
			"name": "建築師 -- 負責辦公室工作"
		}, {
			"id": "NoBD9",
			"name": "鋪置瀝青工人"
		}, {
			"id": "NoBD10",
			"name": "爆石工人及其他爆炸品處理工人"
		}, {
			"id": "NoBD11",
			"name": "砌磚匠 -- 地盆工作"
		}, {
			"id": "NoBD12",
			"name": "砌磚匠 -- 霸，水閘，水塘，隧道工程"
		}, {
			"id": "NoBD13",
			"name": "樓宇拆卸工人"
		}, {
			"id": "NoBD14",
			"name": "推土機操作員"
		}, {
			"id": "NoBD15",
			"name": "沉箱工人"
		}, {
			"id": "NoBD16",
			"name": "翻砂工人"
		}, {
			"id": "NoBD17",
			"name": "木匠 -- 建築物內工作"
		}, {
			"id": "NoBD18",
			"name": "木匠 -- 室外, 高空工作"
		}, {
			"id": "NoBD19",
			"name": "水泥工人 -- 室內工作"
		}, {
			"id": "NoBD17",
			"name": "水泥工人 -- 室外, 高空工作"
		}, {
			"id": "NoBD18",
			"name": "鏈條工人"
		}, {
			"id": "NoBD19",
			"name": "土木工程師 -- 巡視建築地盤工作"
		}, {
			"id": "NoBD20",
			"name": "清潔工人 -- 室內工作"
		}, {
			"id": "NoBD21",
			"name": "清潔工人 -- 建築物外牆及玻璃幕牆"
		}, {
			"id": "NoBD22",
			"name": "混凝土機操作員"
		}, {
			"id": "NoBD23",
			"name": "判頭及細判頭 -- 巡視地盤建築工作"
		}, {
			"id": "NoBD24",
			"name": "判頭及細判頭 -- 負責辦公室工作"
		}, {
			"id": "NoBD25",
			"name": "扎鐵工人"
		}, {
			"id": "NoBD26",
			"name": "管理員"
		}, {
			"id": "NoBD27",
			"name": "平水工人"
		}, {
			"id": "NoBD28",
			"name": "電梯服務員／操作員 -- 不在地盤工作"
		}, {
			"id": "NoBD29",
			"name": "砌石匠"
		}, {
			"id": "NoBD30",
			"name": "雜工 -- 不需高空工作"
		}, {
			"id": "NoBD31",
			"name": "雜工"
		}, {
			"id": "NoBD32",
			"name": "吊車司機 -- 控制室"
		}, {
			"id": "NoBD33",
			"name": "油漆工人 -- 室內裝修"
		}, {
			"id": "NoBD34",
			"name": "油漆工人 -- 室外, 高空工作"
		}, {
			"id": "NoBD35",
			"name": "打椿機操作員"
		}, {
			"id": "NoBD36",
			"name": "水喉匠 -- 地盤工作"
		}, {
			"id": "NoBD37",
			"name": "水喉匠 -- 家居"
		}, {
			"id": "NoBD38",
			"name": "工料及土地測量員"
		}, {
			"id": "NoBD39",
			"name": "修理工人 -- 隧道及行人隧道建築"
		}, {
			"id": "NoBD40",
			"name": "裝配繩索工人"
		}, {
			"id": "NoBD41",
			"name": "安全主任"
		}, {
			"id": "NoBD42",
			"name": "噴沙工人"
		}, {
			"id": "NoBD43",
			"name": "搭棚工人"
		}, {
			"id": "NoBD44",
			"name": "鏟泥機工人 -- 高速公路，道路建築"
		}, {
			"id": "NoBD45",
			"name": "地盤文員"
		}, {
			"id": "NoBD46",
			"name": "花灑／防火警報器安裝員"
		}, {
			"id": "NoBD47",
			"name": "壓路機司機"
		}, {
			"id": "NoBD48",
			"name": "碎石工人"
		}, {
			"id": "NoBD49",
			"name": "鋪石工人"
		}, {
			"id": "NoBD50",
			"name": "高空結構重鐵安裝工人"
		}, {
			"id": "NoBD51",
			"name": "拖拉機司機"
		}, {
			"id": "NoBD52",
			"name": "交通幹線噴油工人"
		}, {
			"id": "NoBD53",
			"name": "隧道工人"
		}, {
			"id": "NoBD54",
			"name": "地底工人"
		}, {
			"id": "NoBD55",
			"name": "電焊工人及切割工人 -- 室內工作"
		}, {
			"id": "NoBD56",
			"name": "電焊工人及切割工人 -- 地盤, 高空工作"
		}, {
			"id": "NoBD57",
			"name": "起重機操作員"
		}, {
			"id": "NoBD58",
			"name": "玻璃幕牆安裝工人"
		}, {
			"id": "NoBD59",
			"name": "裝修 -- 室內工作"
		}, {
			"id": "NoBD60",
			"name": "動臂起重機橾作員"
		}, {
			"id": "NoBD61",
			"name": "拆除舊建築物工人"
		}, {
			"id": "NoBD62",
			"name": "設計師 -- 負責室內工作"
		}, {
			"id": "NoBD63",
			"name": "挖溝機操作員"
		}, {
			"id": "NoBD64",
			"name": "繪圖員"
		}, {
			"id": "NoBD65",
			"name": "鑽機操作員"
		}, {
			"id": "NoBD66",
			"name": "電機維修工人 -- 商業樓宇及工廠"
		}, {
			"id": "NoBD67",
			"name": "電機技師 -- 地盤工作"
		}, {
			"id": "NoBD68",
			"name": "電器技師 -- 室內工作"
		}, {
			"id": "NoBD69",
			"name": "升降機修理員，安裝工人及檢驗員"
		}, {
			"id": "NoBD70",
			"name": "工程師 -- 巡視地盤建築工作"
		}, {
			"id": "NoBD71",
			"name": "工程師 -- 負責辦公室工作"
		}, {
			"id": "NoBD72",
			"name": "爆炸工人"
		}, {
			"id": "NoBD73",
			"name": "機器裝配工人"
		}, {
			"id": "NoBD74",
			"name": "管工"
		}, {
			"id": "NoBD75",
			"name": "平泥面機操作員"
		}, {
			"id": "NoBD76",
			"name": "吊機操作員"
		}, {
			"id": "NoBD77",
			"name": "滅蟲人員"
		}]
	}, {
		"id": "NoB5",
		"nob": "賭場及其代賭博事業",
		"position": [{
			"id": "NoBD1",
			"name": "服務員 -- 賭場, 麻雀館"
		}, {
			"id": "NoBD2",
			"name": "荷官 -- 賭場"
		}, {
			"id": "NoBD3",
			"name": "收銀員-- 賭場，麻雀館"
		}, {
			"id": "NoBD4",
			"name": "經理 -- 賭場, 麻雀館,"
		}, {
			"id": "NoBD5",
			"name": "獨資老闆 -- 麻雀館"
		}, {
			"id": "NoBD6",
			"name": "文員，其他辦公室行政職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD7",
			"name": "護衛員-- 持械"
		}]
	}, {
		"id": "NoB6",
		"nob": "電腦",
		"position": [{
			"id": "NoBD1",
			"name": "文員，辦公室行政職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD2",
			"name": "電腦硬件維修人員"
		}, {
			"id": "NoBD3",
			"name": "程式編寫員，操作員，系統分析員"
		}, {
			"id": "NoBD4",
			"name": "營業員 -- 室內"
		}, {
			"id": "NoBD5",
			"name": "營業員 -- 室外"
		}]
	}, {
		"id": "NoB7",
		"nob": "找換店及滙款",
		"position": [{
			"id": "NoBD1",
			"name": "老闆"
		}, {
			"id": "NoBD2",
			"name": "文員，其他辦公室行政職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD3",
			"name": "護衛員-- 持械"
		}]
	}, {
		"id": "NoB8",
		"nob": "教育",
		"position": [{
			"id": "NoBD1",
			"name": "教師，講師，導師〔全職〕，教授 -- 體育"
		}, {
			"id": "NoBD2",
			"name": "文員，其他辦公室行政職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD3",
			"name": "圖書管理員"
		}, {
			"id": "NoBD4",
			"name": "校長"
		}, {
			"id": "NoBD5",
			"name": "家庭教師"
		}, {
			"id": "NoBD6",
			"name": "教師，講師，導師〔全職〕，教授 -- 一般科目"
		}, {
			"id": "NoBD7",
			"name": "教師，講師，導師〔全職〕，教授 -- 機械工程"
		}]
	}, {
		"id": "NoB9",
		"nob": "娛樂事業，旅遊及消遣",
		"position": [{
			"id": "NoBD1",
			"name": "文員，辦公室行政職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD2",
			"name": "雜技人 -- 馬戲團"
		}, {
			"id": "NoBD3",
			"name": "男演員及女演員 -- 參與拍攝武打片"
		}, {
			"id": "NoBD4",
			"name": "男演員及女演員 -- 不參與拍攝武打片"
		}, {
			"id": "NoBD5",
			"name": "男演員及女演員 -- 間中參與拍攝武打片"
		}, {
			"id": "NoBD6",
			"name": "男演員及女演員 -- 臨時"
		}, {
			"id": "NoBD7",
			"name": "健康舞導師"
		}, {
			"id": "NoBD8",
			"name": "馴獸師"
		}, {
			"id": "NoBD9",
			"name": "服務員 -- 的士高, 領有牌照的浴室／按摩院, 夜總會, 桌球中心, 電視遊戲機中心"
		}, {
			"id": "NoBD10",
			"name": "調酒師 -- 的士高, 夜總會"
		}, {
			"id": "NoBD11",
			"name": "美容師 -- 美容院工作"
		}, {
			"id": "NoBD12",
			"name": "美容師 -- 住宅工作"
		}, {
			"id": "NoBD13",
			"name": "攝影師"
		}, {
			"id": "NoBD14",
			"name": "收銀員 -- 遊樂場，保齡球場"
		}, {
			"id": "NoBD15",
			"name": "收銀員-- 領有牌照的浴室／按摩院，香港賽馬會，桌球中心, 電視遊戲機中心"
		}, {
			"id": "NoBD16",
			"name": "清潔工人 -- 室內"
		}, {
			"id": "NoBD17",
			"name": "舞蹈員 -- 表演行業〔非夜總會及酒吧〕"
		}, {
			"id": "NoBD18",
			"name": "黑房技術員"
		}, {
			"id": "NoBD19",
			"name": "導演 -- 電影製作業"
		}, {
			"id": "NoBD20",
			"name": "配音員 -- 電影製作業"
		}, {
			"id": "NoBD21",
			"name": "木匠電影佈景製作 -- 地面工作"
		}, {
			"id": "NoBD22",
			"name": "木匠電影佈景製作 -- 高空工作"
		}, {
			"id": "NoBD23",
			"name": "健體班導師 -- 健身中心"
		}, {
			"id": "NoBD24",
			"name": "遊戲機控制員 -- 遊樂場"
		}, {
			"id": "NoBD25",
			"name": "維修工人 -- 遊樂場"
		}, {
			"id": "NoBD26",
			"name": "化粧師 -- 電影製作業"
		}, {
			"id": "NoBD27",
			"name": "經理 -- 保齡球場，戲院, 馬戲團"
		}, {
			"id": "NoBD28",
			"name": "經理 -- 的士高, 領有牌照的浴室／按摩院, 夜總會, 桌球中心, 電視遊戲機中心"
		}, {
			"id": "NoBD29",
			"name": "龍虎武師 -- 電影製作業"
		}, {
			"id": "NoBD30",
			"name": "武術指導 -- 電影製作業"
		}, {
			"id": "NoBD31",
			"name": "按摩女郎 -- 領有牌照的浴室／按摩院"
		}, {
			"id": "NoBD32",
			"name": "按摩師 -- 酒店"
		}, {
			"id": "NoBD33",
			"name": "音樂師 -- 音樂會，流行音樂樂隊，管弦樂團"
		}, {
			"id": "NoBD34",
			"name": "音樂師 -- 酒店，的士高，餐廳，夜總會"
		}, {
			"id": "NoBD35",
			"name": "公關 -- 夜總會"
		}, {
			"id": "NoBD36",
			"name": "埸務員 -- 電影製作業"
		}, {
			"id": "NoBD37",
			"name": "監製 -- 電影製作業"
		}, {
			"id": "NoBD38",
			"name": "放影師 -- 戲院"
		}, {
			"id": "NoBD39",
			"name": "接待員 -- 領有牌照的浴室／按摩院, 夜總會"
		}, {
			"id": "NoBD40",
			"name": "修理員 -- 保齡球場, 戲院, 電子遊戲機中心"
		}, {
			"id": "NoBD41",
			"name": "護衛員-- 非持械"
		}, {
			"id": "NoBD42",
			"name": "歌星 -- 表演行業"
		}, {
			"id": "NoBD43",
			"name": "獨資老闆 -- 夜總會"
		}, {
			"id": "NoBD44",
			"name": "替身"
		}, {
			"id": "NoBD45",
			"name": "售票員"
		}, {
			"id": "NoBD46",
			"name": "導遊 -- 旅行社 -- 本地"
		}, {
			"id": "NoBD47",
			"name": "導遊 -- 旅行社 -- 海外: 中國 / 東南亞"
		}, {
			"id": "NoBD48",
			"name": "導遊 -- 旅行社 -- 海外: 歐 / 北美洲"
		}, {
			"id": "NoBD49",
			"name": "帶位 -- 戲院"
		}, {
			"id": "NoBD50",
			"name": "侍應, 女侍應 -- 的士高，夜總會"
		}, {
			"id": "NoBD51",
			"name": "唱片騎師 -- 的士高"
		}]
	}, {
		"id": "NoB10",
		"nob": "銀行及金融",
		"position": [{
			"id": "NoBD1",
			"name": "會計師"
		}, {
			"id": "NoBD2",
			"name": "精算師"
		}, {
			"id": "NoBD3",
			"name": "押款車司機"
		}, {
			"id": "NoBD4",
			"name": "文員，其他辦公室行政職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD5",
			"name": "保險營業員"
		}, {
			"id": "NoBD6",
			"name": "護衛員-- 持械"
		}, {
			"id": "NoBD7",
			"name": "出納員"
		}, {
			"id": "NoBD8",
			"name": "核保／賠償／顧客服務部職員"
		}]
	}, {
		"id": "NoB11",
		"nob": "飲食及酒店業",
		"position": [{
			"id": "NoBD1",
			"name": "文員，其他辦公室行政職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD2",
			"name": "麵包師傳"
		}, {
			"id": "NoBD3",
			"name": "調酒師 -- 酒吧, 的士高, 酒店, 酒廊, 卡拉OK, 餐廳"
		}, {
			"id": "NoBD4",
			"name": "服務生, 侍應生學徒, 行李員 -- 酒店"
		}, {
			"id": "NoBD5",
			"name": "部長"
		}, {
			"id": "NoBD6",
			"name": "收銀員"
		}, {
			"id": "NoBD7",
			"name": "廚師 -- 酒店, 餐廳"
		}, {
			"id": "NoBD8",
			"name": "清潔工人 -- 室內"
		}, {
			"id": "NoBD9",
			"name": "推點心工人"
		}, {
			"id": "NoBD10",
			"name": "司間 -- 酒店"
		}, {
			"id": "NoBD11",
			"name": "搓麵粉師傳"
		}, {
			"id": "NoBD12",
			"name": "管房 -- 酒店"
		}, {
			"id": "NoBD13",
			"name": "廚房什工 -- 酒店, 餐廳"
		}, {
			"id": "NoBD14",
			"name": "洗衣工人 -- 酒店"
		}, {
			"id": "NoBD15",
			"name": "維修工人 -- 電器技工"
		}, {
			"id": "NoBD16",
			"name": "經理 -- 酒店"
		}, {
			"id": "NoBD17",
			"name": "經理 -- 餐廳, 酒樓"
		}, {
			"id": "NoBD18",
			"name": "音樂師 -- 卡拉OK, 酒廊"
		}, {
			"id": "NoBD19",
			"name": "房間服務員"
		}, {
			"id": "NoBD20",
			"name": "接待員 -- 酒店, 餐廳"
		}, {
			"id": "NoBD21",
			"name": "保安人員 -- 酒店 (非持械)"
		}, {
			"id": "NoBD22",
			"name": "歌星 -- 酒店, 酒廊"
		}, {
			"id": "NoBD23",
			"name": "獨資老闆, 老闆 -- 負責行政工作"
		}, {
			"id": "NoBD24",
			"name": "侍應, 女侍應 -- 酒店, 卡拉OK, 酒廊, 餐廳"
		}, {
			"id": "NoBD25",
			"name": "食品批發"
		}]
	}, {
		"id": "NoB12",
		"nob": "政府部門",
		"position": [{
			"id": "NoBD1",
			"name": "文員，其他辦公室行政職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD2",
			"name": "漁農署 -- 行動組人員"
		}, {
			"id": "NoBD3",
			"name": "商業犯罪調查人員"
		}, {
			"id": "NoBD4",
			"name": "懲教署 -- 初級懲教主任"
		}, {
			"id": "NoBD5",
			"name": "懲教署 -- 高級懲教主任"
		}, {
			"id": "NoBD6",
			"name": "法庭／裁判司署 -- 法官，律師"
		}, {
			"id": "NoBD7",
			"name": "海關 -- 督察"
		}, {
			"id": "NoBD8",
			"name": "環境保護主任 -- 負責辦公室工作"
		}, {
			"id": "NoBD9",
			"name": "消防署 -- 救護員"
		}, {
			"id": "NoBD10",
			"name": "消防署 -- 司機"
		}, {
			"id": "NoBD11",
			"name": "消防署 -- 消防員"
		}, {
			"id": "NoBD12",
			"name": "消防署 -- 通風系統主任 (室內工作)"
		}, {
			"id": "NoBD13",
			"name": "政府職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD14",
			"name": "小販管理隊"
		}, {
			"id": "NoBD15",
			"name": "衛生督察"
		}, {
			"id": "NoBD16",
			"name": "廉政公署 -- 調查主任 (非行動組)"
		}, {
			"id": "NoBD17",
			"name": "廉政公署 -- 調查主任 (行動組)"
		}, {
			"id": "NoBD18",
			"name": "人民入境事務署 -- 入境事務署主任"
		}, {
			"id": "NoBD19",
			"name": "救生員 (全職) -- 公共海灘及游泳池"
		}, {
			"id": "NoBD20",
			"name": "警察 -- 輔警"
		}, {
			"id": "NoBD21",
			"name": "警察 -- 偵緝警員"
		}, {
			"id": "NoBD22",
			"name": "警察 -- 軍裝警察"
		}, {
			"id": "NoBD23",
			"name": "警察 -- 督察"
		}, {
			"id": "NoBD24",
			"name": "警察 (全職) -- 傳譯員"
		}, {
			"id": "NoBD25",
			"name": "警察 -- 水警科"
		}, {
			"id": "NoBD26",
			"name": "警察 -- 電單車"
		}, {
			"id": "NoBD27",
			"name": "警察 -- 警長"
		}, {
			"id": "NoBD28",
			"name": "警察 -- 特別行動組"
		}, {
			"id": "NoBD29",
			"name": "郵政署 -- 櫃台服務員"
		}, {
			"id": "NoBD30",
			"name": "郵政署 -- 郵差"
		}, {
			"id": "NoBD31",
			"name": "社會工作者 -- 參與青少年活動，社區發展"
		}, {
			"id": "NoBD32",
			"name": "社會工作者 -- 負責辦公室工作"
		}, {
			"id": "NoBD33",
			"name": "交通督導員"
		}]
	}, {
		"id": "NoB13",
		"nob": "製造業",
		"position": [{
			"id": "NoBD1",
			"name": "文員，其他辦公室行政職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD2",
			"name": "裝配員 -- 電子業"
		}, {
			"id": "NoBD3",
			"name": "吹玻璃工人 -- 玻璃及鏡片製造"
		}, {
			"id": "NoBD4",
			"name": "吹氣工人 -- 床墊及枕頭製造"
		}, {
			"id": "NoBD5",
			"name": "製盒／製紙袋工人 -- 紙及紙漿業"
		}, {
			"id": "NoBD6",
			"name": "製蠟燭師傅"
		}, {
			"id": "NoBD7",
			"name": "木匠"
		}, {
			"id": "NoBD8",
			"name": "地氈及粗毛氈"
		}, {
			"id": "NoBD9",
			"name": "上色工人 -- 人造皮／花"
		}, {
			"id": "NoBD10",
			"name": "混色／配色工人 -- 人造皮／花"
		}, {
			"id": "NoBD11",
			"name": "切玻璃工人 -- 玻璃及鏡片製造"
		}, {
			"id": "NoBD12",
			"name": "切棉工人 -- 床墊及枕頭製造"
		}, {
			"id": "NoBD13",
			"name": "設計師 -- 紡織"
		}, {
			"id": "NoBD14",
			"name": "染料攪拌工人 -- 紡織"
		}, {
			"id": "NoBD15",
			"name": "磨邊工人 -- 玻璃及鏡片製造"
		}, {
			"id": "NoBD16",
			"name": "電器技師 -- 霓虹燈招牌"
		}, {
			"id": "NoBD17",
			"name": "電鍍工人"
		}, {
			"id": "NoBD18",
			"name": "刺繡 -- 住家 --紡織"
		}, {
			"id": "NoBD19",
			"name": "刺繡 -- 用電腦 -- 紡織"
		}, {
			"id": "NoBD20",
			"name": "工程師 -- 電子業"
		}, {
			"id": "NoBD21",
			"name": "信封及紙袋製造工人"
		}, {
			"id": "NoBD22",
			"name": "爆炸品製造工人"
		}, {
			"id": "NoBD23",
			"name": "填料工人 -- 床墊及枕頭製造"
		}, {
			"id": "NoBD24",
			"name": "修飾工人 -- 紙及紙漿業"
		}, {
			"id": "NoBD25",
			"name": "管工 -- 人造皮／花 (不參與製造工作)"
		}, {
			"id": "NoBD26",
			"name": "管工 -- 塑膠業 (不參與製造工作)"
		}, {
			"id": "NoBD27",
			"name": "管工 -- 製磚業 (不參與製造工作)"
		}, {
			"id": "NoBD28",
			"name": "皮草工人"
		}, {
			"id": "NoBD29",
			"name": "熔爐工人 -- 玻璃"
		}, {
			"id": "NoBD30",
			"name": "熔爐工人 -- 五金"
		}, {
			"id": "NoBD31",
			"name": "傢俬製造工人"
		}, {
			"id": "NoBD32",
			"name": "玻璃匠"
		}, {
			"id": "NoBD33",
			"name": "磨工 -- 製磚業"
		}, {
			"id": "NoBD34",
			"name": "手袋製造工人"
		}, {
			"id": "NoBD35",
			"name": "殺蟲劑製造工人 -- 接觸有毒化學物"
		}, {
			"id": "NoBD36",
			"name": "殺蟲劑製造工人 -- 不會接觸有毒化學物"
		}, {
			"id": "NoBD37",
			"name": "熨衫 -- 紡織"
		}, {
			"id": "NoBD38",
			"name": "珠寶商人"
		}, {
			"id": "NoBD39",
			"name": "鑲珠寶工人"
		}, {
			"id": "NoBD40",
			"name": "機器操作員 -- 製磚，輪胎製造"
		}, {
			"id": "NoBD41",
			"name": "機器操作員 -- 床墊及枕頭製造"
		}, {
			"id": "NoBD42",
			"name": "機器操作員 -- 造紙過程 -- 紙及紙漿業"
		}, {
			"id": "NoBD43",
			"name": "維修工人 -- 霓虹燈招牌"
		}, {
			"id": "NoBD44",
			"name": "雲石打磨工人"
		}, {
			"id": "NoBD45",
			"name": "混合機操作員 -- 製磚"
		}, {
			"id": "NoBD46",
			"name": "製模工人 -- 塑膠業，製磚，輪胎製造"
		}, {
			"id": "NoBD47",
			"name": "包裝工人"
		}, {
			"id": "NoBD48",
			"name": "油漆師傅─傢俬"
		}, {
			"id": "NoBD49",
			"name": "磨光工人 -- 玻璃及鏡片製造"
		}, {
			"id": "NoBD50",
			"name": "品質控製員"
		}, {
			"id": "NoBD51",
			"name": "補鞋匠"
		}, {
			"id": "NoBD52",
			"name": "翻新輪胎工人 -- 輪胎製造"
		}, {
			"id": "NoBD53",
			"name": "造樣版 -- 紡織"
		}, {
			"id": "NoBD54",
			"name": "縫盤 -- 紡織"
		}, {
			"id": "NoBD55",
			"name": "補呔工人 -- 輪胎製造"
		}, {
			"id": "NoBD56",
			"name": "鞋匠"
		}, {
			"id": "NoBD57",
			"name": "招牌光管安裝工人 -- 地面工作"
		}, {
			"id": "NoBD58",
			"name": "招牌光管安裝工人 -- 高空工作"
		}, {
			"id": "NoBD59",
			"name": "廣告招牌製作工人 -- 地面工作"
		}, {
			"id": "NoBD60",
			"name": "廣告招牌製作工人 -- 高空工作"
		}, {
			"id": "NoBD61",
			"name": "絲網印刷工人"
		}, {
			"id": "NoBD62",
			"name": "獨資老闆 -- 參與少量體力勞動"
		}, {
			"id": "NoBD63",
			"name": "獨資老闆, 老闆 -- 負責辦公室工作"
		}, {
			"id": "NoBD64",
			"name": "裁縫"
		}, {
			"id": "NoBD65",
			"name": "技工 -- 電子業"
		}, {
			"id": "NoBD66",
			"name": "技師 -- 玻璃及鏡片製造"
		}, {
			"id": "NoBD67",
			"name": "修剪工人 -- 紡織業"
		}, {
			"id": "NoBD68",
			"name": "織工 -- 紡織"
		}]
	}, {
		"id": "NoB14",
		"nob": "海運",
		"position": [{
			"id": "NoBD1",
			"name": "文員，其他辦公室行政職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD2",
			"name": "造船工人 -- 小船"
		}, {
			"id": "NoBD3",
			"name": "貨物處理工人 -- 船塢"
		}, {
			"id": "NoBD4",
			"name": "苦力"
		}, {
			"id": "NoBD5",
			"name": "吊臂操作員"
		}, {
			"id": "NoBD6",
			"name": "船塢監督 -- 負責辦公室工作"
		}, {
			"id": "NoBD7",
			"name": "油漆工人 -- 船塢／船隻"
		}, {
			"id": "NoBD8",
			"name": "領航員，侍應，船長，輪機長，大副 -- 小輪，水翼船，噴射船 (香港，澳門及中國華南水域)"
		}, {
			"id": "NoBD9",
			"name": "水手，機房工人 -- 小輪遊艇，大帆船，水翼船，噴射船 (香港，澳門及中國華南水域)"
		}, {
			"id": "NoBD10",
			"name": "領航員，侍應，船長，輪機長，大副 -- 小輪，水翼船，噴射船 (香港，澳門及中國華南水域以外)"
		}, {
			"id": "NoBD11",
			"name": "水手，機房工人 -- 小輪遊艇，大帆船，水翼船，噴射船 (香港，澳門及中國華南水域以外)"
		}, {
			"id": "NoBD12",
			"name": "船業修理工人"
		}, {
			"id": "NoBD13",
			"name": "電焊工及切割工人 -- 船塢工作"
		}, {
			"id": "NoBD14",
			"name": "工人 -- 駁船, 拖船, 帆船, 舢舨"
		}]
	}, {
		"id": "NoB15",
		"nob": "醫療，牙科及獸醫",
		"position": [{
			"id": "NoBD1",
			"name": "針灸中醫師"
		}, {
			"id": "NoBD2",
			"name": "文員，其他辦公室行政職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD3",
			"name": "女工"
		}, {
			"id": "NoBD4",
			"name": "救護員"
		}, {
			"id": "NoBD5",
			"name": "救護車司機"
		}, {
			"id": "NoBD6",
			"name": "麻醉師"
		}, {
			"id": "NoBD7",
			"name": "輔助醫療人員"
		}, {
			"id": "NoBD8",
			"name": "跌打醫師"
		}, {
			"id": "NoBD9",
			"name": "化驗師"
		}, {
			"id": "NoBD10",
			"name": "推拿師, 脊醫"
		}, {
			"id": "NoBD11",
			"name": "牙科技術員"
		}, {
			"id": "NoBD12",
			"name": "牙醫"
		}, {
			"id": "NoBD13",
			"name": "配藥員"
		}, {
			"id": "NoBD14",
			"name": "醫生 -- 家庭醫生"
		}, {
			"id": "NoBD15",
			"name": "外科醫生 -- 手術"
		}, {
			"id": "NoBD16",
			"name": "中醫"
		}, {
			"id": "NoBD17",
			"name": "廚房工人"
		}, {
			"id": "NoBD18",
			"name": "洗衣房工人"
		}, {
			"id": "NoBD19",
			"name": "護士長"
		}, {
			"id": "NoBD20",
			"name": "護士 -- X 光 (治療及其他用途)"
		}, {
			"id": "NoBD21",
			"name": "護士 (精神科病房)"
		}, {
			"id": "NoBD22",
			"name": "護士 (在監獄)"
		}, {
			"id": "NoBD23",
			"name": "護士，護士學生"
		}, {
			"id": "NoBD24",
			"name": "職業治療師"
		}, {
			"id": "NoBD25",
			"name": "眼科醫生"
		}, {
			"id": "NoBD26",
			"name": "驗光配鏡師 / 視光師"
		}, {
			"id": "NoBD27",
			"name": "藥劑師"
		}, {
			"id": "NoBD28",
			"name": "物理治療師"
		}, {
			"id": "NoBD29",
			"name": "放射線治療師"
		}, {
			"id": "NoBD30",
			"name": "修理人員 -- 醫院／牙科設備"
		}, {
			"id": "NoBD31",
			"name": "技師 -- 化驗室，不需接觸X-光"
		}, {
			"id": "NoBD32",
			"name": "獸醫 -- 外科"
		}, {
			"id": "NoBD33",
			"name": "獸醫助理"
		}]
	}, {
		"id": "NoB16",
		"nob": "金屬",
		"position": [{
			"id": "NoBD1",
			"name": "文員，其他辦公室行政職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD2",
			"name": "鐵匠"
		}, {
			"id": "NoBD3",
			"name": "鍋爐製造工人"
		}, {
			"id": "NoBD4",
			"name": "收銀員 --五金鋪"
		}, {
			"id": "NoBD5",
			"name": "鑽床操作員"
		}, {
			"id": "NoBD6",
			"name": "電鍍工人"
		}, {
			"id": "NoBD7",
			"name": "機器裝配工人"
		}, {
			"id": "NoBD8",
			"name": "打金匠"
		}, {
			"id": "NoBD9",
			"name": "鎚工"
		}, {
			"id": "NoBD10",
			"name": "水壓機操作員"
		}, {
			"id": "NoBD11",
			"name": "配匙"
		}, {
			"id": "NoBD12",
			"name": "車床操作員"
		}, {
			"id": "NoBD13",
			"name": "鎖匠"
		}, {
			"id": "NoBD14",
			"name": "機械師 -- 機器廠"
		}, {
			"id": "NoBD15",
			"name": "技工 -- 機器廠"
		}, {
			"id": "NoBD16",
			"name": "製造及修理銑床工人"
		}, {
			"id": "NoBD17",
			"name": "製模工人"
		}, {
			"id": "NoBD18",
			"name": "製圖案工人"
		}, {
			"id": "NoBD19",
			"name": "設計 -- 機器廠 (負責辦工室工作)"
		}, {
			"id": "NoBD20",
			"name": "沖床機操作員"
		}, {
			"id": "NoBD21",
			"name": "推銷員 -- 五金鋪"
		}, {
			"id": "NoBD22",
			"name": "鉋床工人"
		}, {
			"id": "NoBD23",
			"name": "鐵皮工人"
		}, {
			"id": "NoBD24",
			"name": "插床操作員"
		}, {
			"id": "NoBD25",
			"name": "錫匠"
		}, {
			"id": "NoBD26",
			"name": "製工具匠"
		}, {
			"id": "NoBD27",
			"name": "製錶殼工人"
		}, {
			"id": "NoBD28",
			"name": "室內電焊工人"
		}]
	}, {
		"id": "NoB17",
		"nob": "軍隊",
		"position": [{
			"id": "NoBD1",
			"name": "軍官 -- 負責辦公室工作"
		}, {
			"id": "NoBD2",
			"name": "軍人"
		}]
	}, {
		"id": "NoB18",
		"nob": "採礦",
		"position": [{
			"id": "NoBD1",
			"name": "文員，其他辦公室行政職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD2",
			"name": "鏟泥機操作員"
		}, {
			"id": "NoBD3",
			"name": "挖泥工人"
		}, {
			"id": "NoBD4",
			"name": "炸藥處理員 -- 採礦及爆石"
		}, {
			"id": "NoBD5",
			"name": "打磨工人"
		}, {
			"id": "NoBD6",
			"name": "開礦井工人"
		}, {
			"id": "NoBD7",
			"name": "打椿機操作員 -- 石礦埸及採礦"
		}, {
			"id": "NoBD8",
			"name": "打磨工人 -- 石料"
		}, {
			"id": "NoBD9",
			"name": "爆石工人"
		}, {
			"id": "NoBD10",
			"name": "雕石刻匠"
		}, {
			"id": "NoBD11",
			"name": "拖拉機司機"
		}, {
			"id": "NoBD12",
			"name": "地底爆石工人"
		}]
	}, {
		"id": "NoB19",
		"nob": "公用事業",
		"position": [{
			"id": "NoBD1",
			"name": "文員，其他辦公室行政職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD2",
			"name": "編接電纜工人 -- 電力供應"
		}, {
			"id": "NoBD3",
			"name": "編接電纜工人 -- 管導及隧道 -- 電力供應"
		}, {
			"id": "NoBD4",
			"name": "司機 -- 公眾衛生"
		}, {
			"id": "NoBD5",
			"name": "電機工程師 -- 負責顧問及計設工作"
		}, {
			"id": "NoBD6",
			"name": "電機工程師 -- 負責視察及監督工作"
		}, {
			"id": "NoBD7",
			"name": "電器機師 -- 發電廠及發電站"
		}, {
			"id": "NoBD8",
			"name": "工程師 -- 室外，維修工作"
		}, {
			"id": "NoBD9",
			"name": "工程師 -- 發電廠及發電站"
		}, {
			"id": "NoBD10",
			"name": "倒垃圾工人 -- 公眾衛生"
		}, {
			"id": "NoBD11",
			"name": "石油氣 -- 送貨工人"
		}, {
			"id": "NoBD12",
			"name": "安裝氣體工人 (建築地盤內工作)"
		}, {
			"id": "NoBD13",
			"name": "安裝氣體工人 -- 家居室內安裝"
		}, {
			"id": "NoBD14",
			"name": "石油氣零售商"
		}, {
			"id": "NoBD15",
			"name": "地底工人 - 建造電纜, 架空電線之操作及維修"
		}, {
			"id": "NoBD16",
			"name": "地底工人 -- 室外, 維修工作 -- 電話"
		}, {
			"id": "NoBD17",
			"name": "住宅拉線工人 -- 室外，維修工作 -- 電話"
		}, {
			"id": "NoBD18",
			"name": "督察 -- 公眾衛生"
		}, {
			"id": "NoBD19",
			"name": "裝置員 -- 電話及電報"
		}, {
			"id": "NoBD20",
			"name": "拉線工人 -- 電力供應"
		}, {
			"id": "NoBD21",
			"name": "拉線工人 -- 電話及電報"
		}, {
			"id": "NoBD22",
			"name": "電力輸送員 -- 發電廠及發電站-- 電力供應"
		}, {
			"id": "NoBD23",
			"name": "電錶安裝工人"
		}, {
			"id": "NoBD24",
			"name": "抄錶員"
		}, {
			"id": "NoBD25",
			"name": "喉管清潔工人"
		}, {
			"id": "NoBD26",
			"name": "發電廠監督 -- 發電廠及發電站"
		}, {
			"id": "NoBD27",
			"name": "電線柱及電燈柱安裝工人 -- 建造電纜，架空電線的維修與操作"
		}, {
			"id": "NoBD28",
			"name": "修理工人 -- 氣體 (室內工作)"
		}, {
			"id": "NoBD29",
			"name": "修理工人 -- 氣體 (室外工作)"
		}, {
			"id": "NoBD30",
			"name": "修理工人 -- 發電廠及發電站"
		}, {
			"id": "NoBD31",
			"name": "修理工人 -- 煤氣, 船隻"
		}, {
			"id": "NoBD32",
			"name": "裝配工人 -- 發電廠及發電站"
		}, {
			"id": "NoBD33",
			"name": "發電站工程師 -- 發電廠及發電站"
		}, {
			"id": "NoBD34",
			"name": "街道清潔工人"
		}, {
			"id": "NoBD35",
			"name": "督導 -- 垃圾處理廠及焚化爐"
		}, {
			"id": "NoBD36",
			"name": "總機佈線工人 -- 發電廠及發電站"
		}, {
			"id": "NoBD37",
			"name": "電話接線生"
		}, {
			"id": "NoBD38",
			"name": "塔架安裝工人 -- 電纜 (電力供應)"
		}, {
			"id": "NoBD39",
			"name": "安裝塔架工人 -- 需高空工作─電話及電報"
		}, {
			"id": "NoBD40",
			"name": "變壓器操作員 -- 導管及隧道 -- 電力供應"
		}, {
			"id": "NoBD41",
			"name": "變壓器操作員 -- 發電廠及發電站"
		}, {
			"id": "NoBD42",
			"name": "渦輪機操作員 -- 發電廠及發電站"
		}, {
			"id": "NoBD43",
			"name": "輪機房服務員 -- 發電廠及發電站"
		}]
	}, {
		"id": "NoB20",
		"nob": "零售業",
		"position": [{
			"id": "NoBD1",
			"name": "文員，其他辦公室行政職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD2",
			"name": "裝配員 -- 鐘錶店"
		}, {
			"id": "NoBD3",
			"name": "時裝精品店 -- 室內推銷員"
		}, {
			"id": "NoBD4",
			"name": "屠夫 -- 屠房及超級市埸"
		}, {
			"id": "NoBD5",
			"name": "收銀員 --超級市埸"
		}, {
			"id": "NoBD6",
			"name": "漁販 -- 街市魚檔持牌人(固定攤檔)及超級市埸"
		}, {
			"id": "NoBD7",
			"name": "漁販 -- 批發商"
		}, {
			"id": "NoBD8",
			"name": "花店"
		}, {
			"id": "NoBD9",
			"name": "水果商"
		}, {
			"id": "NoBD10",
			"name": "雜貨商"
		}, {
			"id": "NoBD11",
			"name": "小販 -- 有固定地點"
		}, {
			"id": "NoBD12",
			"name": "小販 -- 沒有固定地點"
		}, {
			"id": "NoBD13",
			"name": "採購員 -- 室外"
		}, {
			"id": "NoBD14",
			"name": "寵物店 -- 店主, 店員"
		}, {
			"id": "NoBD15",
			"name": "油站服務員"
		}, {
			"id": "NoBD16",
			"name": "物業顧問／經紀／磋商人"
		}, {
			"id": "NoBD17",
			"name": "老闆 -- 負責辦公室工作"
		}, {
			"id": "NoBD18",
			"name": "老闆 -- 參與少量體力勞動／室外工作"
		}, {
			"id": "NoBD19",
			"name": "修理工人 -- 鐘錶店"
		}, {
			"id": "NoBD20",
			"name": "修理工人 -- 辦公室設施"
		}, {
			"id": "NoBD21",
			"name": "推銷員 -- 珠寶"
		}, {
			"id": "NoBD22",
			"name": "推銷員 -- 珠寶 (需出外工作)"
		}, {
			"id": "NoBD23",
			"name": "營業經理 -- 負責辦公室工作"
		}, {
			"id": "NoBD24",
			"name": "推銷員 -- 上門推銷"
		}, {
			"id": "NoBD25",
			"name": "護衛員(非持械)"
		}, {
			"id": "NoBD26",
			"name": "店員"
		}, {
			"id": "NoBD27",
			"name": "股票／外匯經紀"
		}, {
			"id": "NoBD28",
			"name": "士多店東"
		}, {
			"id": "NoBD29",
			"name": "主任 -- 超級市埸"
		}]
	}, {
		"id": "NoB21",
		"nob": "運動",
		"position": [{
			"id": "NoBD1",
			"name": "文員，其他辦公室行政職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD2",
			"name": "拳擊選手"
		}, {
			"id": "NoBD3",
			"name": "拳擊教練"
		}, {
			"id": "NoBD4",
			"name": "教練 -- 羽毛球, 藍球, 體操, 游泳, 網球, 排球"
		}, {
			"id": "NoBD5",
			"name": "潛水 (先填妥潛水問卷)"
		}, {
			"id": "NoBD6",
			"name": "足球 -- 教練，專業運動者"
		}, {
			"id": "NoBD7",
			"name": "高爾夫球教練"
		}, {
			"id": "NoBD8",
			"name": "健美中心指導員"
		}, {
			"id": "NoBD9",
			"name": "騎馬 -- 不比賽 (先填妥騎馬問卷)"
		}, {
			"id": "NoBD10",
			"name": "練馬師"
		}, {
			"id": "NoBD11",
			"name": "騎師"
		}, {
			"id": "NoBD12",
			"name": "柔道／空手道教練 (先填妥危險活動問卷)"
		}, {
			"id": "NoBD13",
			"name": "柔道／空手道摶擊手 (先填妥危險活動問卷)"
		}, {
			"id": "NoBD14",
			"name": "馬伕"
		}, {
			"id": "NoBD15",
			"name": "專業運動者 -- 羽毛球, 藍球, 體操, 游泳, 網球, 排球"
		}, {
			"id": "NoBD16",
			"name": "賽車手(先填寫賽車問卷)"
		}, {
			"id": "NoBD17",
			"name": "馬房工人 -- 賽馬"
		}, {
			"id": "NoBD18",
			"name": "風帆教練"
		}, {
			"id": "NoBD19",
			"name": "摔角教練"
		}, {
			"id": "NoBD20",
			"name": "摔角手 -- 專業運動者"
		}]
	}, {
		"id": "NoB22",
		"nob": "運輸",
		"position": [{
			"id": "NoBD1",
			"name": "文員，其他辦公室行政職員 -- 負責辦公室工作"
		}, {
			"id": "NoBD2",
			"name": "服務員 -- 鐵路〔地鐵，輕鐵，九港鐵路〕"
		}, {
			"id": "NoBD3",
			"name": "巴士站站長"
		}, {
			"id": "NoBD4",
			"name": "洗車工人"
		}, {
			"id": "NoBD5",
			"name": "送貨工人 -- 電單車"
		}, {
			"id": "NoBD6",
			"name": "送貨工人 -- DHL ，快遞"
		}, {
			"id": "NoBD7",
			"name": "搬運工人 -- 搬運重型物件"
		}, {
			"id": "NoBD8",
			"name": "司機 -- 巴士及旅遊車及小巴"
		}, {
			"id": "NoBD9",
			"name": "司機 - 重型貨車，貨櫃車，貨車，小巴貨車等"
		}, {
			"id": "NoBD10",
			"name": "司機 -- 地鐵，輕鐵，九港鐵路及電車"
		}, {
			"id": "NoBD11",
			"name": "司機 -- 私家車，的士"
		}, {
			"id": "NoBD12",
			"name": "教車師傳"
		}, {
			"id": "NoBD13",
			"name": "堆高機操作員 -- 貨櫃"
		}, {
			"id": "NoBD14",
			"name": "技工 -- 油站，車房"
		}, {
			"id": "NoBD15",
			"name": "店主 -- 單車店"
		}, {
			"id": "NoBD16",
			"name": "店主 -- 油站，車房 (不需參與體力勞動)"
		}, {
			"id": "NoBD17",
			"name": "噴油板工人 -- 油站，車房"
		}, {
			"id": "NoBD18",
			"name": "搬運工人 -- 傢俬, 機器, 銅琴, 夾萬等重型物件"
		}, {
			"id": "NoBD19",
			"name": "維修人員 -- 單車店"
		}, {
			"id": "NoBD20",
			"name": "修理員 -- 鐵路，地鐵，輕鐵，九港鐵路，電車"
		}, {
			"id": "NoBD21",
			"name": "維修人員 -- 油站，車房"
		}, {
			"id": "NoBD22",
			"name": "交通控制員〔於高空工作〕 -- 貨櫃碼頭"
		}, {
			"id": "NoBD23",
			"name": "檢查員 -- 貨櫃碼頭 (地面工作)"
		}]
	}, {
		"id": "NoB23",
		"nob": "其他",
		"position": [{
			"id": "NoBD1",
			"name": "家庭傭工 -- 全職"
		}, {
			"id": "NoBD2",
			"name": "家庭傭工 -- 兼職"
		}, {
			"id": "NoBD3",
			"name": "算命"
		}, {
			"id": "NoBD4",
			"name": "園丁 -- 家居"
		}, {
			"id": "NoBD5",
			"name": "理髮師／髮型師"
		}, {
			"id": "NoBD6",
			"name": "家庭主婦"
		}, {
			"id": "NoBD7",
			"name": "兒童"
		}, {
			"id": "NoBD8",
			"name": "律師"
		}, {
			"id": "NoBD9",
			"name": "信差 -- 徒步"
		}, {
			"id": "NoBD10",
			"name": "信差 -- 以電單車代步"
		}, {
			"id": "NoBD11",
			"name": "傳教士"
		}, {
			"id": "NoBD12",
			"name": "模特兒"
		}, {
			"id": "NoBD13",
			"name": "修道士／僧侶"
		}, {
			"id": "NoBD14",
			"name": "修女／尼姑"
		}, {
			"id": "NoBD15",
			"name": "育嬰院工人"
		}, {
			"id": "NoBD16",
			"name": "其他"
		}, {
			"id": "NoBD17",
			"name": "老闆 -- 當舖"
		}, {
			"id": "NoBD18",
			"name": "牧師"
		}, {
			"id": "NoBD19",
			"name": "神父"
		}, {
			"id": "NoBD20",
			"name": "私家偵探"
		}, {
			"id": "NoBD21",
			"name": "退休人士"
		}, {
			"id": "NoBD22",
			"name": "待業人士"
		}, {
			"id": "NoBD23",
			"name": "秘書"
		}, {
			"id": "NoBD24",
			"name": "倉務員-- 倉庫, 貨倉"
		}, {
			"id": "NoBD25",
			"name": "學生"
		}, {
			"id": "NoBD26",
			"name": "藝術家 -- 自由身"
		}, {
			"id": "NoBD27",
			"name": "保姆／看護"
		}, {
			"id": "NoBD28",
			"name": "美容顧問 -- 髮型屋"
		}, {
			"id": "NoBD29",
			"name": "私人保鑣"
		}]
	}, {
		"id": "NoB24",
		"nob": "常用行業",
		"position": [{
			"id": "NoBD1",
			"name": "專業人士"
		}, {
			"id": "NoBD2",
			"name": "室內工作,負責辦工室工作"
		}, {
			"id": "NoBD3",
			"name": "室內工作,參與極少量體力勞動工作"
		}, {
			"id": "NoBD4",
			"name": "室外工作,參與少量體力勞動工作"
		}, {
			"id": "NoBD5",
			"name": "體力勞動工作,多為室內工作"
		}, {
			"id": "NoBD6",
			"name": "體力勞動工作,可能須室外工作"
		}, {
			"id": "NoBD7",
			"name": "參與電動機械操作,室內工作"
		}, {
			"id": "NoBD8",
			"name": "較高風險之電動機械操作,地面工作"
		}, {
			"id": "NoBD9",
			"name": "高風險,室外及需高空工作"
		}, {
			"id": "NoBD10",
			"name": "極高風險,室外及需高空工作"
		}]
	}]
}