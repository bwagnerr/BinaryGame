import QtQuick 1.0

Rectangle {
    id: main

    property int random: Math.floor(Math.random() * 255)+1
    property int sum : 0

    width: 600; height: 405
    color: "#edecec"

    function reset(){
        random = Math.floor(Math.random() * 255)+1
        binariesbox.reset()
        progressbar.value = 0
        timeanimation.start()
        blocker.enabled = false
        message.text = "Can you do it?"

    }

    onSumChanged: {
        if (sum == random){
            timeanimation.stop()
            message.text = "Congratulations! Click anywhere to restart"
            blocker.enabled = true
        }
    }

    ProgressBar {
        id: progressbar
        width: main.width
        height: 40
        NumberAnimation on value { id: timeanimation; duration: 10000; from: 0; to: 100; }

        onValueChanged: {
            if (value == 100){
                blocker.enabled = true
                message.text = "Shame on You! Click anywhere to restart"
            }
        }
    }
    RandomBox{
        id: randombox
        width: main.width
        height: main.height/6
        anchors.top: progressbar.bottom
    }
    BinariesBox{
        id: binariesbox
        width: main.width
        anchors.top: randombox.bottom
        anchors.bottom: messagebox.top
    }
    Rectangle{
        id:messagebox
        width: main.width
        height: main.height/5
        anchors.bottom: main.bottom
        Text{
            id: message
            anchors.centerIn: parent
            text: "Can you do it?"
            font.bold: true
            font.pixelSize: 20
        }
    }

    MouseArea{
        id: blocker
        enabled: false
        anchors.fill: parent
        onClicked: reset()
    }
}
