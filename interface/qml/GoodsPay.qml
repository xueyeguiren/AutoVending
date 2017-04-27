import QtQuick 2.0
/**
商品支付页面
  **/
Rectangle{
        id: rec_goodsPay
        width: parent.width;
        height: parent.height;
        color: "#ffddb8"
        Rectangle{
            id:rec_top;//标记位上方
            width: parent.width;
            height: parent.height*0.441;
            anchors.top: parent.top;

            color: "red";

        }
        Rectangle{
            id:rec_middle;//中间分割标记
            width: parent.width;
            height: parent.height*0.054;
            anchors.top: rec_top.bottom;
            Image {
                id: img_spit;
                source: "qrc:/operation/images/operation/b_10.png"
            }

        }
        Rectangle{
            id:rec_bottom;
            width: parent.width;
            height: parent.height*0.495;
            anchors.top: rec_middle.bottom
            color: "green";
        }
}
