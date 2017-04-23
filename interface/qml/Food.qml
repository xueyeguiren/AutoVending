import QtQuick 2.4


    Rectangle{
        property alias food_backimage: bg.source;           //背景图片
        property alias food_image: page1_image.source;      //食品图片
        property alias food_txt: page3_text.text;             //食品文字
        property alias food_price_text: page4_text.text;      //获得 “单价”
        property alias food_price_code: page5_text.text;      //获得 “￥”
        property alias food_price: page6_text.text;           //食品价格


        id:root;
        color: "#ffddb8";

        Image {          //背景图片
            id: bg;
            width: parent.width;
            height: parent.height;
            anchors.centerIn: parent;
            source:food_backimage;
        }
        Rectangle{       //食品图片
            id:page1;
            width: parent.width;
            height: parent.height*0.75;
            color: Qt.rgba(0.5,0.5,0.5,0);   //透明
            Image {
                id: page1_image;
                width: parent.width*0.8;
                height: parent.height*0.8;
                anchors.centerIn: parent;
                source: food_image;
            }
        }
        Rectangle{       //食品文字
            id:page3;
            width: parent.width;
            height: parent.height*0.125;
            anchors.top:page1.bottom;
            color: Qt.rgba(0.5,0.5,0.5,0);
            Text {
                id: page3_text;
                font.pixelSize: parent.width*0.1;     //字体大小
                anchors.centerIn: parent;
                text: food_txt;
            }
        }
        Rectangle{       //显示 "单价"
            id:page4;
            width: parent.width*0.5;
            height: parent.height*0.125;
            anchors.top:page3.bottom;
            color: Qt.rgba(0.5,0.5,0.5,0);
            Text {
                id: page4_text;
                font.pixelSize: parent.width*0.2
                x:parent.width-width
                text:food_price_text;
            }
        }
        Rectangle{       //显示 "￥"
            id:page5;
            width: parent.width*0.08;
            height: parent.height*0.125;
            anchors.top:page3.bottom;
            anchors.left: page4.right
            color: Qt.rgba(0.5,0.5,0.5,0);
            Text {
                id: page5_text;
                font.pixelSize:page4_text.font.pixelSize
                color: "red";
                text:food_price_code;
            }
        }
        Rectangle{       //食品价格
            id:page6;
            width: parent.width*0.42;
            height: parent.height*0.125;
            anchors.top:page3.bottom;
            anchors.left: page5.right
            color: Qt.rgba(0.5,0.5,0.5,0);
            Text {
                id: page6_text;
                font.pixelSize: page4_text.font.pixelSize
                color: "red";
                text:food_price;
            }
        }
    }


