import QtQuick 1.0

Rectangle {
    id: resultbox
    property int random: main.random
    property int sum: main.sum
    color: sum === random ? "lightgreen" : "red"

    Text{
        id: resultboxlabel
        anchors.centerIn: parent
        text: "Your: "+sum
        font.bold: true
        font.pixelSize: 20
    }
}
