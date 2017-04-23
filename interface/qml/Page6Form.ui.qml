import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.0

Item {
    width: 540;
    height: 620;


    Rectangle{
        id:page6_1;
        width: parent.width;
        height: parent.height;
     //   color: 'red'
        Rectangle{  //最上方一条线
            width: parent.width
            y:0;
            color: "orange";
            height: 3;
        }
        Image {
            id: page6_1_image1
            width: parent.width*0.25;
            height: parent.height*0.35;
            x: (parent.width - width) / 2;
            y:parent.height*0.05
            source: "qrc:/new/prefix1/a6_03.png"
        }
        Text {
            id: page6_1_text1;
            font.pixelSize: parent.width*0.05;
            x:(parent.width-width)/2;
            y:parent.height*0.4;
            text: qsTr(" 出货成功，请取货呦！")
        }

        Rectangle{
            id:page6_2;
            x: 0
            y:parent.height*0.55
            width: parent.width;
            height: parent.height*0.3;
            //color: 'red'
            Image {
                id: page6_2_image;
                width: parent.width*0.7;
                height: parent.height*0.8;
                anchors.centerIn: parent

                source: "qrc:/new/prefix1/a4_07.png";
            }
        }
        Text {
            id: page6_1_text2;
            font.pixelSize: parent.width*0.04;
            x:(parent.width-width)/2;
            y:parent.height*0.85;
            text: qsTr("5秒后自动跳转.....")
        }


    }

}
