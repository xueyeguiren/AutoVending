import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.0
Grid{
    property int diy_rows: 3
    property int diy_columns: 4
        id:root
        rows: diy_rows;
        columns:diy_columns;
        rowSpacing: 18;
        columnSpacing: 12;

        //描述表格的流模式，如果是LeftToRight 从左到右填充一行，满了就填充第二行
        flow: Grid.LeftToRight;

        function loadButton() {
            for(var i=0;i<36;i++){
            var component = Qt.createComponent("Goods_single.qml");
            if (component.status == Component.Ready) {
//                var button = component.createObject(root);
                console.log("parent.width",root.height);
                var button  = component.createObject(root, {"food_image":"qrc:/goods/images/goods/food_01.png",
                                                            "food_txt":"牛肉面",
                                                            "food_price":"12.50",
                                                            "myWidth":(root.width-(diy_columns-1)*12)/diy_columns,
                                                            "myHeight":(root.height-(diy_rows-1)*18)/diy_rows
                                                     }

                                                     );
//                button.color = "red";
            }
            }
        }

        Component.onCompleted: loadButton();
}
