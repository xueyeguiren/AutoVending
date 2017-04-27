import QtQuick 2.0
import QtQuick.Controls 2.0
/**
中间商品页
  **/
Rectangle{                         //
        id: root
        width: parent.width;
        height: parent.height;
        color: "#ffddb8"
        GoodsSwipeView{             //中间商品滑动页
                    id: goods_swipeView;
                    width: parent.width
                    height: parent.height*0.923//1024x
                    anchors.top: parent.top;
                    anchors.topMargin: 24;
        }

        Rectangle{                  //下方滑动黑点
               id:rec_point;
               height: parent.height*0.077;
               width: parent.width;
               anchors.top:goods_swipeView.bottom;
               anchors.horizontalCenter: parent.horizontalCenter;
               color: "#ffddb8"
               PageIndicator {
                   currentIndex: goods_swipeView.currentIndex
                   count: goods_swipeView.count
                   anchors.horizontalCenter: parent.horizontalCenter;
                   anchors.verticalCenter: parent.verticalCenter;
               }
           }
}
