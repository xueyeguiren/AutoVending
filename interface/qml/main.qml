import QtQuick 2.0
import QtQuick.Controls 2.0
import "qrc:/js/js/NetWork.js" as API
import QtQuick.Window 2.0
ApplicationWindow {
    visible: true
    width: 540
    height: 960
    title: qsTr("勃达自动售卖机主页")
    Rectangle{       //视频播放窗口
            id:miantop1;
            width: parent.width;
            height: parent.height*0.4;
            color: "red"
        }
    }  
