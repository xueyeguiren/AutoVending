import QtQuick 2.0

Rectangle{       //广告(语音)播放窗口

    property string bgSource;
    property string today_weather_txt;
    property string today_weather_image;
    property string tomorrow_weather_txt;
    property string tomorrow_weather_image;
    property string tdat_weather_txt;
    property string tdat_weather_image;
        id:root;
        anchors.fill: parent
        anchors.top: parent.top;
        Image {
            height:parent.height*0.75;
            width: parent.width
            id: img_weather
            source:bgSource;

        }
        Rectangle{
            id:rec_recentlyWeather;
            width: parent.width;
            height:parent.height*0.25;
            anchors.top: img_weather.bottom;

            RecentlyWeather{
                id:rw_today
                width: parent.width/3-1
                height: parent.height
                anchors.left: parent.left
                txt_date: "今天"
                txt_weather: today_weather_txt
                weather_image: today_weather_image
            }
            Rectangle{
                id:line1;
                width: 1;
                height: parent.height
                anchors.left: rw_today.right;
                color: "#917c69"
            }
            RecentlyWeather{
                id:rw_tomorrow
                anchors.left:line1.right
                width: parent.width/3-1
                height: parent.height
                txt_date: "明天"
                txt_weather: tomorrow_weather_txt
                weather_image: tomorrow_weather_image
            }
            Rectangle{
                id:line2;
                width: 1;
                height: parent.height
                anchors.left: rw_tomorrow.right;
                color: "#917c69"
            }
            RecentlyWeather{
                id:rw_tdat;//the day after tomorrow
                anchors.left:line2.right
                width: parent.width/3-1
                height: parent.height
                txt_date: "后天"
                txt_weather: tdat_weather_txt
                weather_image: tdat_weather_image
            }
        }
    }
