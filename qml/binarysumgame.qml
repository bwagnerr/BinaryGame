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
        finalmessage.visible = false

    }

    onSumChanged: {
        if (sum == random){
            timeanimation.stop()
            blocker.enabled = true
            blockerlabel.text = "You rock!\nNice job!"
            finalmessage.visible = true
        }
    }

    ProgressBar {
        id: progressbar
        width: main.width
        height: 40
        NumberAnimation on value { id: timeanimation; duration: 5000; from: 0; to: 100; }

        onValueChanged: {
            if (value == 100){
                blocker.enabled = true
                blockerlabel.text = "Boo!\nYou lost..."
                finalmessage.visible = true
            }
        }
    }
    ScoreBox{
        id: scorebox
        width: main.width
        height: main.height/6
        anchors.top: progressbar.bottom
    }
    BinariesBox{
        id: binariesbox
        width: main.width
        anchors.top: scorebox.bottom
        anchors.bottom: messagebox.top
    }
    Rectangle{
        id:messagebox
        width: main.width
        height: main.height/6
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
            Rectangle{
                id:finalmessage
                visible: false
                color: main.sum == main.random ? "lightgreen" : "red"
                anchors.fill: parent
                Text{
                    id: blockerlabel
                    anchors.centerIn: parent
                    color: main.sum == main.random ? "black" : "white"
                    text: ""
                    font.bold: true
                    font.pixelSize: 50
                }
                Text{
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    color: main.sum == main.random ? "black" : "white"
                    text: "\nPress anywhere\nto restart"
                    font.pixelSize: 30
                }
            }
        }
}
