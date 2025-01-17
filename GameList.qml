import QtQuick 2.0

Rectangle {
    color: "#333"
    
    ListView {
        anchors.fill: parent
        orientation: ListView.Horizontal

        model: api.collections.get(2).games//api.allGames
        delegate: GameBox {
            game: modelData
            height: ListView.view.height
            selected: ListView.isCurrentItem
            onClicked: {
                ListView.view.currentIndex = index;
                gCurrentGame = api.collections.get(2).games.get(index);
            }
        }
    }
}
