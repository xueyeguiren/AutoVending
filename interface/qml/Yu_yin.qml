import QtQuick 2.0

Rectangle{
    property alias sour: image.source;
    property alias txt: text.text;

    anchors.fill: parent
    color:Qt.rgba(1,1,1,0);

    Rectangle{    //图标框
        id:icon
        width: parent.height*0.5
        height: parent.height*0.5
        x:parent.width*0.4
        color:Qt.rgba(1,1,1,0);
    //    color: "yellow"
        Image {
            id:image
            anchors.fill: parent
            source: sour
        }
    }

    Rectangle{    //文字框
        width: parent.width
        height: parent.height*0.2
        anchors.top: icon.bottom
        color:Qt.rgba(1,1,1,0);
       // color: "grey"
        Text {
            id:text
            anchors.centerIn: parent
            font.pixelSize: parent.height*0.5
            color: "red"
            text: txt
        }
    }
}
