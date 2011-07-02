import QtQuick 1.0

Row {
    Rectangle{
        width: parent.width/2
        height: parent.height
        color: "lightgreen"
        Text{
            anchors.centerIn: parent
            text: "Target: "+main.random
            font.bold: true
            font.pixelSize: 30
        }
    }
    Rectangle{
        width: parent.width/2
        height: parent.height
        color: main.sum == main.random ? "lightgreen" :"red"
        Text{
            anchors.centerIn: parent
            text: "Your: "+main.sum
            font.bold: true
            font.pixelSize: 30
        }
    }
}
