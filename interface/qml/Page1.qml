import QtQuick 2.7

Page1Form {
    
    Rectangle{
        width: page1.width
        height: page1.height*3
        color: "#ffddb8"

        Flickable{
            id:flick
            width: parent.width
            height: page1.height;
            contentHeight: page1.height*(food_dat.getfood_totalnum()/3)   //可拖拽内容大小
            clip: true;             //隐藏大于显示窗口的部分

            Rectangle{
                width: page1.width
                height: page1.height
                color: "#ffddb8"
                Grid{
                    anchors.fill: parent
                    anchors.margins: 4;        //周边间距为4
                    anchors.rightMargin: 16;   //右边间距为4*4
                    anchors.bottomMargin: 12
                    spacing: 4;                //每个控件的间距为4
                    Repeater{
                        model: 36;         //36种食品
                        Rectangle{         //每一种食品
                            id:food_1;
                            width: parent.width/4;
                            height: parent.height/3;
                            Food{
                                id:food1_1;
                                width: parent.width
                                height: parent.height
                                food_backimage: food_dat.getbackimage(index);
                                food_image:  food_dat.getfoodimage(index)
                                food_txt:food_dat.getfoodname(index);
                                food_price_text:food_dat.getfoodprice_text(index) ;
                                food_price_code:food_dat.getfoodprice_code(index) ;
                                food_price: food_dat.getfoodprice(index);
                            }
                            MouseArea{
                                anchors.fill: parent;
                                onReleased: {
                                    if(food1_1.food_price != ""){
                                        page1.visible = false;
                                        page3.visible = false;
                                        page4.visible = false;
                                        page2.visible = true;
                                        qsen.send_foodid_signal(index);
                                       // qsen.send_foodid_signal(food_dat.getfood_num("牛肉面"));
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        //竖滚动条
        Rectangle{
            id:scrollbar_vertical;
            anchors.right: flick.right   //靠右
            //当前可视区域的位置.为百分比值,0-1之间
            y:flick.visibleArea.yPosition * flick.height
            width: 3
            //当前可视区域的高度比例,为百分比值,0-1之间
            height: flick.visibleArea.heightRatio * flick.height
            color: "grey"
        }
    }


}
