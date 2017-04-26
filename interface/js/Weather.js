function funcShowWeather(weather) {
console.log("test",weather.width);
//    weather.color="red"
    if(weather.visible){
        weather.visible=false;
    }
    else{
        weather.visible=true;
    }

    weather.bgSource="qrc:/weather/images/weather/tian_bg.jpg"
    weather.today_weather_txt="18-24℃ 晴天"
    weather.today_weather_image="qrc:/weather/images/weather/qing.png"
    weather.tomorrow_weather_txt="18-24℃ 晴天"
    weather.tomorrow_weather_image="qrc:/weather/images/weather/qing.png"
    weather.tdat_weather_txt="18-24℃ 晴天"
    weather.tdat_weather_image="qrc:/weather/images/weather/qing.png"
}
function test(){
    console.log("mmmm");
}
