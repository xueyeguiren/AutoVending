import QtQuick 2.4

Image{
    property string picUrl;
    id:root;
    width: 15
    height:15
    source: picUrl
    fillMode: Image.PreserveAspectFit
}
