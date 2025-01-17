import QtQuick 2.0
import SortFilterProxyModel 0.2

Rectangle {
    color: "#363"

    property var currentCollection: api.collections.get(2)
    SortFilterProxyModel {
        id: filteredGames
        sourceModel: currentCollection.games //api.allGames
        filters: ValueFilter {
            roleName: "favorite"
            value: true
        }
    }

    ListView {
        anchors.fill: parent
        orientation: ListView.Horizontal

        model: filteredGames
        delegate: GameBox {
            game: modelData
            height: ListView.view.height
            selected: ListView.isCurrentItem
            onClicked: {
                ListView.view.currentIndex = index;
                gCurrentGame = filteredGames.get(index);
            }
        }
    }
}
