/*var GACheck = function(regex) {
  var regExp = /^GA\d{1}.\d{1}.\d{8,10}.\d{9,11}$/;
  var myArray;
  if(regExp.test(regex)){
    return true;
  } else {
    return false;
  }
}*/

//쿠키 Key 값을 넣으면 쿠키 Value을 가져오는 함수
var getCookieGA = function(name) {
  /*var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
  return value? value[2] : null;*/
};

// 쿠키 Key값과 Value 값을 넣으면 2년동안 유지하는 쿠키를 생성하는 함수
var setCookieGA = function(name, value) {
  /*var date = new Date();
  var twoYearsLater = new Date(new Date().getTime() + 2 * 365 * 24 * 60 * 60 * 1000);
  document.cookie = name + '=' + value + ';expires=' + twoYearsLater.toUTCString() + ';path=/';*/
};
// 2019/01/14 추가 된 코드 END

// 맞춤 측정 기준 세팅하는 함수
/* function GAsetCustomDimension(ga_dimension){
	try{
		for(key in ga_dimension){
			if(ga_dimension[key] == "" || ga_dimension[key] == "undefined"){
				if(key.indexOf('Metric') > -1){
					ga_dimension[key] = 0;	
				}else{
					ga_dimension[key] = undefined;	
				}
				
			}
		}
		ga('gp.set', 'title', 		ga_dimension.Title  ); 	//Title
		ga('gp.set', 'dimension1',  ga_dimension.Custom1);	//ClientId
		ga('gp.set', 'dimension2',  ga_dimension.Custom2);	//UserId
		ga('gp.set', 'dimension3',  ga_dimension.Custom3);	//userAgent
		ga('gp.set', 'dimension5',  ga_dimension.Custom5);	//Gender
		ga('gp.set', 'dimension6',  ga_dimension.Custom6);	//leaflet
		ga('gp.set', 'dimension7',  ga_dimension.Custom7);	//category_CD
		ga('gp.set', 'dimension8',  ga_dimension.Custom8);	//event_CD
		ga('gp.set', 'dimension9',  ga_dimension.Custom9);	//product_CD
		ga('gp.set', 'dimension11', ga_dimension.Custom11);	//RegistrationDate
		ga('gp.set', 'dimension12', ga_dimension.Custom12);	//MembershipCard
		ga('gp.set', 'dimension13', ga_dimension.Custom13);	//Membership_Grade
		ga('gp.set', 'dimension14', ga_dimension.Custom14);	//login_hyper
		ga('gp.set', 'dimension17', ga_dimension.Custom17);	//eMailCampaignAgree
		ga('gp.set', 'dimension18', ga_dimension.Custom18);	//SMSCampaignAgree
		ga('gp.set', 'dimension19', ga_dimension.Custom19);	//planning
		ga('gp.set', 'dimension20', ga_dimension.Custom20);	//planning_2
		ga('gp.set', 'dimension21', ga_dimension.Custom21);	//LoginStatus
		ga('gp.set', 'dimension22', ga_dimension.Custom22);	//Age
		ga('gp.set', 'dimension23', ga_dimension.Custom23);	//YearofBirth
		ga('gp.set', 'dimension24', ga_dimension.Custom24);	//LoginType
		ga('gp.set', 'dimension25', ga_dimension.Custom25);	//SearchTerm
		ga('gp.set', 'dimension26', ga_dimension.Custom26);	//SearchResult
		ga('gp.set', 'dimension27', ga_dimension.Custom27);	//SearchType
		ga('gp.set', 'dimension28', ga_dimension.Custom28);	//SearchResultCount
		ga('gp.set', 'dimension30', ga_dimension.Custom30);	//Channeltypes
		ga('gp.set', 'dimension31', ga_dimension.Custom31);	
		ga('gp.set', 'dimension32', ga_dimension.Custom32);	
		ga('gp.set', 'dimension33', ga_dimension.Custom33);	
		ga('gp.set', 'dimension34', ga_dimension.Custom34);	
		ga('gp.set', 'metric1', ga_dimension.Metric1);
		ga('gp.set', 'metric2', ga_dimension.Metric2);
		ga('gp.set', 'metric3', ga_dimension.Metric3);
		ga('gp.set', 'metric4', ga_dimension.Metric4);
		ga('gp.set', 'metric5', ga_dimension.Metric5);
		ga('gp.set', 'metric6', ga_dimension.Metric6);
		ga('gp.set', 'metric7', ga_dimension.Metric7);
		ga('gp.set', 'metric8', ga_dimension.Metric8);
		ga('gp.set', 'metric9', ga_dimension.Metric9);
		ga('gp.set', 'userId', ga_dimension.Custom2);
	
		ga_data.dimension1 = ga_dimension.Custom1;	//clientId 
		ga_data.dimension2 = ga_dimension.Custom2;	//UserId
		ga_data.dimension3 = ga_dimension.Custom3;	//userAgent
		ga_data.dimension5 = ga_dimension.Custom5;	//Gender
		ga_data.dimension6 = ga_dimension.Custom6;	//leaflet
		ga_data.dimension7 = ga_dimension.Custom7;	//category_CD
		ga_data.dimension8 = ga_dimension.Custom8;	//event_CD
		ga_data.dimension9 = ga_dimension.Custom9;	//product_CD
		ga_data.dimension11 = ga_dimension.Custom11;	//RegistrationDate
		ga_data.dimension12 = ga_dimension.Custom12;	//MembershipCard
		ga_data.dimension13 = ga_dimension.Custom13;	//Membership_Grade
		ga_data.dimension14 = ga_dimension.Custom14;	//login_hyper
		ga_data.dimension17 = ga_dimension.Custom17;	//eMailCampaignAgree
		ga_data.dimension18 = ga_dimension.Custom18;	//SMSCampaignAgree
		ga_data.dimension19 = ga_dimension.Custom19;	//planning
		ga_data.dimension20 = ga_dimension.Custom20;	//planning_2
		ga_data.dimension21 = ga_dimension.Custom21;	//LoginStatus
		ga_data.dimension22 = ga_dimension.Custom22;	//Age
		ga_data.dimension23 = ga_dimension.Custom23;	//YearofBirth
		ga_data.dimension24 = ga_dimension.Custom24;	//LoginType
		ga_data.dimension25 = ga_dimension.Custom25;	//SearchTerm
		ga_data.dimension26 = ga_dimension.Custom26;	//SearchResult
		ga_data.dimension27 = ga_dimension.Custom27;	//SearchType
		ga_data.dimension28 = ga_dimension.Custom28;	//SearchResultCount
		ga_data.dimension30 = ga_dimension.Custom30;	//Channeltypes
		ga_data.dimension31 = ga_dimension.Custom31;
		ga_data.dimension32 = ga_dimension.Custom32;
		ga_data.dimension33 = ga_dimension.Custom33;
		ga_data.dimension34 = ga_dimension.Custom34;
		ga_data.metric1 = ga_dimension.Metric1;
		ga_data.metric2 = ga_dimension.Metric2;
		ga_data.metric3 = ga_dimension.Metric3;
		ga_data.metric4 = ga_dimension.Metric4;
		ga_data.metric5 = ga_dimension.Metric5;
		ga_data.metric6 = ga_dimension.Metric6;
		ga_data.metric7 = ga_dimension.Metric7;
		ga_data.metric8 = ga_dimension.Metric8;
		ga_data.metric9 = ga_dimension.Metric9;
		ga_data.title = ga_dimension.Title; 	// Title
		ga_data.gaCode = ga_dimension.GACode;
		ga_data.category = ga_dimension.Category;
		ga_data.action = ga_dimension.Action;
		ga_data.label = ga_dimension.Label;
		ga_data.userId = ga_dimension.Custom2;
	
    }catch(e){}
 }*/

// 맞춤 측정 기준 초기화하는 함수
 /*function GAclearCustomDimension(){
	try{
		for(var i=1; i<=34; i++){
			ga('gp.set', 'dimension'+i , undefined);
		}
		for(var i=1; i<=9; i++){
			ga('gp.set', 'metric'+i , undefined);
		}
		
		for(key in ga_data){
			ga_data[key] = undefined;
		}
    }catch(e){}
 }*/
 
  function GADataSend_Event(category,action,label,pageName){
      /*// 변경이 있는 맞춤 측정 기준이 있을 수 있기 때문에
      //맞춤 측정 기준을 초기화 하고 다시 세팅 해줍니다.
      GAclearCustomDimension();
      GAsetCustomDimension(ga_dimension);
      try{	     
    	  ga('gp.send', { hitType: 'event', eventCategory: category, eventAction: action, eventLabel: label, title:pageName});	     
      }catch(e){}*/
    }

    function GADataSend_PageView(pageName){
      /*// 변경이 있는 맞춤 측정 기준이 있을 수 있기 때문에
      //맞춤 측정 기준을 초기화 하고 다시 세팅 해줍니다.
      GAclearCustomDimension();
      GAsetCustomDimension(ga_dimension);
      try{	      
	      ga('gp.send', { hitType: 'pageview', title: pageName });	      
      }catch(e){}*/
    }

function logEvent(name, params) {
  if (!name) {
    return;
  }

  if (window.AnalyticsWebInterface) {
    // Call Android interface
    window.AnalyticsWebInterface.logEvent(name, JSON.stringify(params));
  } else if (window.webkit
      && window.webkit.messageHandlers
      && window.webkit.messageHandlers.firebase) {
    // Call iOS interface
    var message = {
      command: 'logEvent',
      name: name,
      parameters: params
    };
    window.webkit.messageHandlers.firebase.postMessage(message);
  } else {
    // No Android or iOS interface found
    console.log("No native APIs found.");
  }
}

function setUserProperty(params) {
  if (!params) {
    return;
  }

  if (window.AnalyticsWebInterface) {
    // Call Android interface
    window.AnalyticsWebInterface.setUserProperty(JSON.stringify(params));
  } else if (window.webkit
      && window.webkit.messageHandlers
      && window.webkit.messageHandlers.firebase) {
    // Call iOS interface
    var message = {
      command: 'setUserProperty',
      parameters: params
    };
    window.webkit.messageHandlers.firebase.postMessage(message);
  } else {
    // No Android or iOS interface found
    console.log("No native APIs found.");
  }
}