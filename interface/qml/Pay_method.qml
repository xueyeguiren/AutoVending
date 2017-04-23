import QtQuick 2.0
import QtQuick.Layouts 1.1

Rectangle{
    property alias pay_code: pay_image.source
    property alias pay_text: pay_txt.text

    id:pay;
    anchors.fill: parent;
    antialiasing: true; //抗锯齿，默认就是开启的
    Rectangle{

        width: parent.width
        height: parent.height*0.8
        radius: 6      //圆角
        border.width: 3      //边框宽度
        border.color: "darkorange"
        Image {
            id:pay_image
            width: parent.width-6;
            height: parent.height-6;
            anchors.centerIn: parent
            source: pay_code
        }
    }
    Text {
        id: pay_txt;
        x:(parent.width-width)/2   //居中
        y:parent.height*0.8-1
        color: "darkorange"
        font.pixelSize: parent.width*0.15;
        text: pay_text;

    }


}

