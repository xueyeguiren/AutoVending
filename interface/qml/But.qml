import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1

Rectangle{
    property alias txt: button_text.text;
    property alias btn_image: button_image.source

    id:root;
    color:"#282828"
    anchors.centerIn: parent;
    anchors.fill: parent;

    Rectangle{       //按钮图标
        id:page1;
        width: parent.width;
        height: parent.height;
        color: Qt.rgba(0.5,0.5,0.5,0);   //透明
        Image {
            id: button_image;
            x:(parent.width-width)/2;
            y:parent.height*0.15
            width: parent.width*0.5;
            height: parent.height*0.5;
            source: btn_image;
        }
        Text {
            id: button_text;
            x:(parent.width-width)/2
            y:parent.height*0.65
            font.pixelSize: parent.width*0.15;
            text: txt;
            color:"white";
        }
    }
}


