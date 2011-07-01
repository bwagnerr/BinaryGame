import QtQuick 1.0


Column{
    width: parent.width
    height: width/4

    function reset(){
        for(var i = 0;i < firstrow.children.length;i++){
            var child1 = firstrow.children[i]
            if(child1.active)
                child1.active = false
        }
        for(var a = 0;a < secondrow.children.length;a++){
            var child2 = secondrow.children[a]
            if(child2.active)
                child2.active = false
        }
    }

    Row{
        id: firstrow
        width: parent.width
        height: parent.height/2
        Repeater {
            model: 4
            ToggleButton{
                position: index
                value: Math.pow(2,7-index)
                width: parent.width/4
                height: parent.height
            }
        }
    }
    Row{
        id: secondrow
        width: parent.width
        height: parent.height/2
        Repeater {
            model: 4
            ToggleButton{
                position: index+4
                value: Math.pow(2,3-index)
                width: parent.width/4
                height: parent.height
            }
        }
    }
}
