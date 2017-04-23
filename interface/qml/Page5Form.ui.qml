import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.0

Item {
    width: 540;
    height: 620;

    Rectangle{
        id:page1_5_1;
        width: parent.width;
        height: parent.height;
        Rectangle{  //最上方一条线
            width: parent.width
            y:0;
            color: "orange";
            height: 3;
        }
        Image {
            id: page1_5_1_image1
            width: parent.width*0.3;
            height: parent.height*0.4;
            x: (parent.width - width) / 2;
            y:parent.height*0.1
            source: "qrc:/new/prefix1/a5_03.png"
        }
        Text {
            id: page1_5_1_text1;
            font.pixelSize: parent.width*0.05;
            x:parent.width*0.3;
            y:page1_5_1_image1.height+parent.height*0.15;
            text: qsTr("错误代码：101")
        }
        Text {
            id: page1_5_1_text2;
            font.pixelSize: parent.width*0.05;
            x:parent.width*0.3;
            y:page1_5_1_text1.y+page1_5_1_text1.height;
            text: qsTr("您可以选择：")
        }
        Button {
            id:fan_hui
            text: "返回上一页";
            font.pixelSize: 20
            width: parent.width*0.3;
            height: parent.height*0.1;
            x:parent.width*0.15;
            y:page1_5_1_text2.y+page1_5_1_text2.height+parent.height*0.1
        }
        Button{
            text: "刷新";
            font.pixelSize: parent.width*0.04
            width: parent.width*0.3;
            height: parent.height*0.1;
            x:parent.width*0.55;
            y:fan_hui.y;
        }
    }
}
