<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

function realTimeWeather(){
	var today = new Date();
    var week = new Array('일','월','화','수','목','금','토');
    var year = today.getFullYear();
    var month = today.getMonth()+1;
    var day = today.getDate();
    var hours = today.getHours();
    var minutes = today.getMinutes();
    
    $('.weather-date').html(month +"월 " + day + "일 " + week[today.getDay()]+"요일");
    /*
     * 기상청 30분마다 발표
     * 30분보다 작으면, 한시간 전 hours 값
     */
    if(minutes < 30){
        hours = hours - 1;
        if(hours < 0){
            // 자정 이전은 전날로 계산
            today.setDate(today.getDate() - 1);
            day = today.getDate();
            month = today.getMonth()+1;
            year = today.getFullYear();
            hours = 23;
        }
    }
    
    /* example
     * 9시 -> 09시 변경 필요
     */
    
    if(hours < 10) {
        hours = '0'+hours;
    }
    if(month < 10) {
        month = '0' + month;
    }    
    if(day < 10) {
        day = '0' + day;
    } 
 
    today = year+""+month+""+day;
    
    /* 좌표 */
    var _nx = x좌표, 
    _ny = y좌표,
    apikey = "0THufkJJW15ItwgJNEeL0sVl9XsEwxPFUwzBMoVc7O3xw4uK1l7g%2FMqlQeD42VehRUH%2BAugPiH2CgBV5gGtXNw%3D%3D",    
    ForecastGribURL = "http://newsky2.kma.go.kr/service/MiddleFrcstInfoService/getMiddleForecast?ServiceKey=TEST_SERVICS_KEY&stnId=133&tmFc=201404080600&pageNo=1&numOfRows=1";
    ForecastGribURL += "?ServiceKey=" + apikey;
    ForecastGribURL += "&base_date=" + today;
    ForecastGribURL += "&base_time=" + hours +"00";
    ForecastGribURL += "&nx=" + _nx + "&ny=" + _ny;
    ForecastGribURL += "&pageNo=1&numOfRows=7";
    ForecastGribURL += "&_type=json";
 
$.ajax({
    url: ForecastGribURL
    ,type: 'get'
    ,success: function(msg) {
 
       var text = msg.responseText,
       text = text.replace(/(<([^>]+)>)/ig,""); //HTML 태그 모두 공백으로 대체
 text = '[' + text + ']';
       var json = $.parseJSON(text);
       
       var rain_state = json[0].response.body.items.item[1].obsrValue;
       var rain = json[0].response.body.items.item[3].obsrValue;
       var sky = json[0].response.body.items.item[4].obsrValue;
       var temperature = json[0].response.body.items.item[5].obsrValue;
       
       $('.weather-temp').html(temperature.toFixed(1) + " ℃");
 $('#RN1').html("시간당강수량 : "+ rain +"mm");
       
           if(rain_state != 0) {
               switch(rain_state) {
                   case 1:
                    $('.weather-state-text').html("비");
                       break;
                   case 2:
                       $('.weather-state-text').html("비/눈");
                       break;
                   case 3:
                       $('.weather-state-text').html("눈");
                       break;
               }
           }else {
               switch(sky) {
                   case 1:
                       $('.weather-state-text').html("맑음");
                       break;
                   case 2:
                       $('.weather-state-text').html("구름조금");
                       break;
                   case 3:
                    $('.weather-state-text').html("구름많음");
                       break;
                   case 4:
                    $('.weather-state-text').html("흐림");    
                       break;
                   }    
               } //if 종료
        } //success func 종료
    })    
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script    src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="jquery.xdomainajax.js"></script>
<script src="weather.js"></script>
<script type="text/javascript">
    realTimeWeather();
</script>
</head>
<body>
    <div class="vis-weather">
        <h2 class="vh_hide">날씨정보</h2>
        <p class="weather-date"></p>
        <ul>
            <li class="weather-temp"></li>
            <li id="RN1">시간당강수량 : ?</li>
            <li class="weather-state-text"></li>
        </ul>
    </div>
</body>
</html>
