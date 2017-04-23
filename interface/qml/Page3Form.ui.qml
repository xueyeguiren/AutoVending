import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.0

Rectangle {

    Rectangle{  //最上方一条线
        width: parent.width
        y:0;
        color: "orange";
        height: 3;
    }

    //border.width: 3;
    Rectangle{   //跳转文字框
        id:page3_1;
        width: parent.width;
       // anchors.centerIn: parent
        height: parent.height*0.1;
        y:parent.height*0.2;
        x:3
        Image {     //勾 图标
            id: page3_1_image;
            width: parent.width*0.1;
            height: parent.height;
            x:parent.width*0.25;
            source: "qrc:/new/prefix1/a4_03.png";
        }
        Text {      //文字
            id: page3_1_text;
            font.pixelSize: parent.height*0.7;
            color: "#00ce3a";
            x:page3_1_image.x+page3_1_image.width
            text: qsTr("正在自动跳转...")
        }
    }
    Rectangle{     //取货口图片
        id:page3_2;
        width: parent.width*0.6;
        height: parent.height*0.2;
        anchors.centerIn: parent;
        Image {
            id: page3_2_image;
            width: parent.width*0.9;
            height: parent.height;
            anchors.centerIn: parent
            source: "qrc:/new/prefix1/a4_07.png";
        }
    }
}
