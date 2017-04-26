import QtQuick 2.0

Rectangle {
    property alias txt_date: txt_date.text;
    property alias txt_weather: txt_weather.text;
    property alias weather_image: weather_image.source;

    id:root;
    color: "#b7a593"
    Text {
        id: txt_date
        text: txt_date
        font.pixelSize: 36
        color: "white"
        height: parent.height/4
        anchors.top: parent.top;
        anchors.horizontalCenter:parent.horizontalCenter
    }
    Image {
        id: weather_image
        source: weather_image
        height: parent.height/2
        fillMode: Image.PreserveAspectFit
        anchors.top: txt_date.bottom;
        anchors.horizontalCenter:parent.horizontalCenter
    }
    Text {
        id: txt_weather
        text: txt_weather
        color: "white"
        font.pixelSize: 30
        height: parent.height/4
        anchors.top: weather_image.bottom
        anchors.horizontalCenter:parent.horizontalCenter
    }
}
