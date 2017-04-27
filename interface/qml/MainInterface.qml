import QtQuick 2.0
import QtQuick.Controls 2.0
Rectangle{
    id:rec_MainINterface;
    property alias page_name:rec_MainINterface.rec_page_name;
    property string rec_page_name;

    function loadPage() {
        var component;
        switch (rec_page_name){
        case "goods_swipeView":{    //滑动商品页面
         component= Qt.createComponent("GoodsAndPoint.qml");
//        component= Qt.createComponent("GoodsPay.qml");
            console.log("test1111111111");
            break;
        }
        case "goods_pay":{          //商品支付页面
            component= Qt.createComponent("GoodsPay.qml");
            console.log("test2222222");
            break;
        }
        case "pay_num":{            //购物码页面
            break;
        }
        }

        if (component.status == Component.Ready) {
            console.log("parent.width",rec_MainINterface.height);
            var button  = component.createObject(rec_MainINterface);
        }
        }

    Component.onCompleted: loadPage();
}
