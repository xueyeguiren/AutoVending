import QtQuick 2.0
import QtQuick.Controls 2.0
SwipeView {
    id: root
    function loadPage() {
        var page_num=Math.floor(getPageNum()/16)+1;
        for(var i=0;i<page_num;i++){
        var component = Qt.createComponent("Goods.qml");
        if (component.status == Component.Ready) {
            console.log("parent.width"+i,root.height);
            var button  = component.createObject(root,{"diy_rows":4,"diy_columns":4,"goods_num":getPageNum(),"page_now":i});
        }
        }
    }

    Component.onCompleted: loadPage();

    function getPageNum(){
        return 40;
    }
}

