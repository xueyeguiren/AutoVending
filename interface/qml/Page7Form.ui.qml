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
        id:page7_1;
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
            id: page7_1_image1
            width: parent.width*0.4;
            height: parent.height*0.35;
            x: (parent.width - width) / 2;
            y:parent.height*0.05
            source: "qrc:/new/prefix1/a7_03.png"
        }
        Text {
            id: page7_1_text1;
            font.pixelSize: parent.width*0.05;
            x:(parent.width-width)/2;
            y:parent.height*0.4;
            text: qsTr(" 出货失败，请主人重新操作")
        }

        Rectangle{
            id:page7_2;
            x: 0
            y:parent.height*0.55
            width: parent.width;
            height: parent.height*0.3;
            //color: 'red'
            Image {
                id: page7_2_image;
                width: parent.width*0.7;
                height: parent.height*0.8;
                anchors.centerIn: parent

                source:"qrc:/new/prefix1/a7_07.png";
            }
        }
        Text {
            id: page7_1_text2;
            font.pixelSize: parent.width*0.04;
            x:(parent.width-width)/2;
            y:parent.height*0.85;
            text: qsTr("5秒后自动跳转.....")
        }


    }
    /*
    Rectangle{
        id:page1_8_1;
        width: parent.width*0.4;
        height: parent.height*0.6;
        anchors.centerIn: parent;

        Image {
            id: page1_8_1_image1
            width: parent.width*0.8;
            height: parent.height*0.4;
            x: (parent.width - width) / 2;
            source: "qrc:/new/prefix1/a7_03.png"
        }
        Text {
            id: page1_8_1_text1;
            font.pixelSize: 17;
            x:1;
            y:118;
            text: qsTr(" 出货失败，请主人重新操作")
        }
        Text {
            id: page1_8_1_text2;
            font.pixelSize: 14;
            x:35;
            y:210;
            text: qsTr("5秒后自动跳转.....")
        }

        Rectangle{
            id:page1_8_2;
            width: parent.width*0.9;
            height: parent.height*0.2;

            Image {
                id: page1_8_2_image;
                width: parent.width;
                height: parent.height;
                y:150;
                x:20;
                source: "qrc:/new/prefix1/a7_07.png";
            }
        }
    }
*/
}
