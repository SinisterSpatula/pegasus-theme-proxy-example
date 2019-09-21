import QtQuick 2.0
import SortFilterProxyModel 0.2

Rectangle {
    color: "#113"

    property var currentCollection: api.collections.get(2)
    SortFilterProxyModel {
        id: sortedGames
        sourceModel: api.allGames.games
        sorters: RoleSorter {
            roleName: "lastPlayed"
        }
    }

    ListView {
        anchors.fill: parent
        orientation: ListView.Horizontal

        model: sortedGames
        delegate: GameBox {
            game: modelData
            height: ListView.view.height
            selected: ListView.isCurrentItem
            onClicked: {
                ListView.view.currentIndex = index;
                gCurrentGame = sortedGames.get(index);
            }
        }
    }
}
