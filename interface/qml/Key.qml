import QtQuick 2.7

Rectangle{

    property alias txt: key_text.text

    id:key
    width: parent.width
    height: parent.height
    border.color: "#ff9829"
    border.width: 1
    anchors.fill: parent
    Text {
        id: key_text
        font.pixelSize: parent.height*0.5
        anchors.centerIn: parent;
        color: "black"
        text: txt
    }
}





