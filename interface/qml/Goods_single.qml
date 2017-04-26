import QtQuick 2.0

Rectangle{
    property alias food_image: img_goodsPic.source;        //食品图片
    property alias food_txt: txt_goodsName.text;             //食品文字
    property alias food_price: txt_goodsPrice.text;           //食品价格
    property alias myWidth: root.width;                   //宽度
    property alias myHeight: root.height;                 //高度

    id:root;
    color: "#ffddb8";
    width: myWidth;
    height: myHeight;
    Image {          //背景图片
        id: bg;
        width: parent.width;
        height: parent.height;
//        anchors.centerIn: parent;
//        fillMode: Image.PreserveAspectFit
        source:"qrc:/operation/images/operation/goodbg.png";
    }
    Rectangle{       //商品图片
        id:rec_goodsPic;
        width: parent.width*0.846;//220px
        height: parent.height*0.515;//170px
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: parent.top;
        anchors.topMargin: 28;
        Image {
            id: img_goodsPic;
            width: parent.width;
            height: parent.height;
            anchors.centerIn: parent;
            fillMode: Image.PreserveAspectFit
            source: food_image;
        }
    }
    Rectangle{       //商品文字
        id:rec_goodsName;
        width: parent.width;
        height: parent.height*0.125;
        anchors.bottom:rec_goodsPrice.top;
        anchors.bottomMargin: root.height*0.1;
        color: Qt.rgba(0.5,0.5,0.5,0);
        Text {
            id: txt_goodsName;
            font.pixelSize: parent.width*0.12;     //字体大小
            anchors.centerIn: parent;
            text: food_txt;
        }
    }
    Rectangle{          // 下边一行价格
        id:rec_goodsPrice;
        anchors.bottom:root.bottom;
        anchors.bottomMargin: 20
        width: root.width;
        anchors.horizontalCenter: parent.horizontalCenter;
        Text {
            id: txt_prefix;
            font.pixelSize: parent.width*0.07
            text:"单价:￥";
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter: parent.verticalCenter;
            anchors.horizontalCenterOffset:-root.width*0.15;
        }
        Text {
            id: txt_goodsPrice;
            font.pixelSize: parent.width*0.13
            color: "red";
            text:food_price;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter: parent.verticalCenter;
            anchors.horizontalCenterOffset: root.width*0.12;
        }

    }
}
