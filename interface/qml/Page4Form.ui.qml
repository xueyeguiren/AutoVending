import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.0

Rectangle {
    id:root
    width: 540
    height: 960
    property alias num_1_txt: num_1_txt
    property alias num_2_txt: num_2_txt
    property alias num_3_txt: num_3_txt
    property alias num_4_txt: num_4_txt
    property alias num_5_txt: num_5_txt
    property alias num_6_txt: num_6_txt
    property alias ti_shi: ti_shi

    Rectangle{     //提货码文字和数字输入框
        id:key_input
        width: parent.width
        height: parent.height*0.2
        y:parent.height*0.1
     //   color: "red"


        Text {      //提货码文字提示
            id:input_text
            text: qsTr("请输入取货码")
            font.pixelSize: parent.height*0.25
            x:(parent.width-width)/2
            y:parent.height*0.03
        }
        Rectangle{      //提货码输入框
            id:input_rec
            width: parent.width
            height: parent.height*0.5
            anchors.top: input_text.bottom

            RowLayout{    //水平布局
                id:input_num
                anchors.fill: parent
                anchors.leftMargin: parent.width*0.1
                anchors.rightMargin: parent.width*0.1
                spacing: 5

                Rectangle{          //提货码第1位
                    id:num_1
                    Layout.fillWidth: true
                    Layout.preferredWidth:parent.width/6      //宽度
                    Layout.minimumHeight: parent.height      //高度

                    border.color: "#ff9829"
                    border.width: 1
                    Text {
                        id: num_1_txt
                        font.pixelSize: parent.height*0.5
                        anchors.centerIn: parent
                    }
                }
                Rectangle{          //提货码第2位
                    id:num_2
                    Layout.fillWidth: true
                    Layout.preferredWidth:parent.width/6
                    Layout.minimumHeight: parent.height
                    border.color: "#ff9829"
                    border.width: 1
                    Text {
                        id: num_2_txt
                        font.pixelSize: parent.height*0.5
                        anchors.centerIn: parent
                    }
                }
                Rectangle{          //提货码第3位
                    id:num_3
                    Layout.fillWidth: true
                    Layout.preferredWidth:parent.width/6
                    Layout.minimumHeight: parent.height
                    border.color: "#ff9829"
                    border.width: 1
                    Text {
                        id: num_3_txt
                        font.pixelSize: parent.height*0.5
                        anchors.centerIn: parent
                    }
                }
                Rectangle{          //提货码第4位
                    id:num_4
                    Layout.fillWidth: true
                    Layout.preferredWidth:parent.width/6
                    Layout.minimumHeight: parent.height
                    border.color: "#ff9829"
                    border.width: 1
                    Text {
                        id: num_4_txt
                        font.pixelSize: parent.height*0.5
                        anchors.centerIn: parent
                       // text: "1"
                    }
                }
                Rectangle{          //提货码第5位
                    id:num_5
                    Layout.fillWidth: true
                    Layout.preferredWidth:parent.width/6
                    Layout.minimumHeight: parent.height
                    border.color: "#ff9829"
                    border.width: 1
                    Text {
                        id: num_5_txt
                        font.pixelSize: parent.height*0.5
                        anchors.centerIn: parent
                    }
                }
                Rectangle{          //提货码第6位
                    id:num_6
                    Layout.fillWidth: true
                    Layout.preferredWidth:parent.width/6
                    Layout.minimumHeight: parent.height
                    border.color: "#ff9829"
                    border.width: 1
                    Text {
                        id: num_6_txt
                        font.pixelSize: parent.height*0.5
                        anchors.centerIn: parent
                    }
                }
            }
        }
        Rectangle{     //提示输入错误
            id:ti_shi
            width: parent.width
            height:parent.height*0.15
            visible: false;
            anchors.top:input_rec.bottom
            anchors.topMargin: 9;
            Text {
                    id: ti_shi_txt
                    color: "red"
                    font.pixelSize: parent.height*0.7
                    anchors.centerIn: parent
                    text: qsTr("输入错误，请重新输入")
            }
        }
    }
}
