import QtQuick 2.0
import QtQuick.Controls 2.0
Row{
    id:root;
    spacing: 15
    property alias num:root.pageNum;//共有多少页
    property alias focusNum:root.pageFocuse;//当前是第几页，是第几页就用实点来填充
    property int pageNum;
    property int pageFocuse;

    function loadPoint() {
        for(var i=1;i<=pageNum;i++){
        var component = Qt.createComponent("Point_single.qml");
        if (component.status == Component.Ready) {
//            console.log("parent.width",root.height);
            var button;
            if(pageFocuse==i){
            button= component.createObject(root, {"picUrl":"qrc:/operation/images/operation/c_10.png"});
            }
            else{
                button= component.createObject(root, {"picUrl":"qrc:/operation/images/operation/c_07.png"});
            }

        }
        }
    }

    Component.onCompleted: loadPoint();
}
