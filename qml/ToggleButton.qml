import QtQuick 1.0

    Rectangle {
        property int value
        property int position
        property bool active: false
        id: togglebutton

        color: active ? "lightgreen" : "white"

        Text{
            id: label
            font.bold: true
            font.pixelSize: 30
            anchors.centerIn: parent
            text: value
        }

        states: [
            State {
                name: ""
                StateChangeScript{
                    script: main.sum -= value
                }
            },
            State {
                name: "toggled"
                when: active
                StateChangeScript{
                    script: main.sum += value
                }
            }
        ]
        MouseArea {
            anchors.fill: parent
            onClicked: active = !active
        }
    }
