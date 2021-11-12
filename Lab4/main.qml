import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

ApplicationWindow {
    id: window
    width: 720
    height: 480
    visible: true
    title: qsTr("Lab4")

    ColumnLayout {
        anchors.fill: parent

        Text {
            Layout.alignment: Qt.AlignHCenter
            text: "S-DES Шифратор/Дешифратор"
            font.bold: true
            font.family: "Helvetica"
            font.pointSize: 18
        }

        ColumnLayout {
            id: inputLayout
            Layout.leftMargin: 50
            Layout.rightMargin: 50
            spacing: 20

            Label {
                text: "8-бітне повідомлення"
                font.family: "Helvetica"
                font.pointSize: 10
                font.bold: true
            }

            TextField {
                id: inputMessageText
                Layout.fillWidth: true
                placeholderText: qsTr("Введіть повідомлення")
                font.pointSize: 10
                font.family: "Helvetica"
                selectByMouse: true
                validator:
                    RegExpValidator {
                        regExp:  /^[01]{8}$/
                }
                background:
                    Rectangle {
                        anchors.bottom: parent.bottom
                        height: parent.activeFocus || parent.hovered ? 2 : 1
                        color: parent.activeFocus ? "blue" : "black"
                }
                onTextChanged: CipherUI.messageText = text
           }

            Label {
                text: "10-бітний ключ"
                font.family: "Helvetica"
                font.pointSize: 10
                font.bold: true
            }

            TextField {
                id: inputKeyText
                Layout.fillWidth: true
                placeholderText: qsTr("Введіть ключ")
                font.pointSize: 10
                font.family: "Helvetica"
                selectByMouse: true
                validator:
                    RegExpValidator {
                        regExp:  /^[01]{10}$/
                }
                background:
                    Rectangle {
                        anchors.bottom: parent.bottom
                        height: parent.activeFocus || parent.hovered ? 2 : 1
                        color: parent.activeFocus ? "blue" : "black"
                }
                onTextChanged: CipherUI.keyText = text
            }

            Label {
                text: "Результат"
                font.family: "Helvetica"
                font.pointSize: 10
                font.bold: true
            }

            ScrollView {
                id: view
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                TextArea {
                    wrapMode: TextEdit.WrapAnywhere
                    font.pointSize: 10
                    font.family: "Helvetica"
                    textMargin: 5
                    text: CipherUI.resultText
                    selectByMouse: true
                    background:
                        Rectangle {
                            anchors.fill: parent
                            radius: 2
                            border.color: "#26282a"
                            border.width: 1
                    }
                }
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            Layout.bottomMargin: 30
            spacing: 50
            CryptButton {
                id: decodeButton
                width: 120
                height: 50
                state: "RELEASED"
                CryptText {
                    text: "Decode"
                    font.pointSize: 9
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: decodeButton.state = "PRESSED"
                    onReleased: {
                        decodeButton.state = "RELEASED"
                        CipherUI.decodeButtonClicked()
                    }
                }
            }

            CryptButton {
                id: encodeButton
                width: 120
                height: 50
                state: "RELEASED"
                CryptText {
                    text: "Encode"
                    font.pointSize: 9
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: encodeButton.state = "PRESSED"
                    onReleased: {
                        encodeButton.state = "RELEASED"
                        CipherUI.encodeButtonClicked()
                    }
                }
            }
        }
    }
}
