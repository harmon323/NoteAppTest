//
//  FolderSelectionView.swift
//  CaluculationNoteApps
//
//  Created by 三澤雅也 on 2024/10/25.
//

import SwiftUI

struct Folder: Identifiable {
    var id: UUID = UUID() // UUIDをIDとして使用
    var name: String
}

struct FolderSelectionView: View {
    @State private var folders: [Folder] = [] // ユーザーが作成したフォルダを格納する配列
    @State private var newFolderName: String = "" // 新しいフォルダ名を格納する変数

    var body: some View {
        NavigationStack {
            VStack {
                // フォルダ追加用のテキストフィールドとボタン
                HStack {
                    TextField("新しいフォルダ名", text: $newFolderName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(action: addFolder) {
                        Text("追加")
                    }
                    .padding()
                }

                List(folders) { folder in
                    NavigationLink(destination: Text(folder.name)) {
                        Text(folder.name)
                    }
                }
                .navigationTitle("フォルダ選択")
            }
        }
    }

    // フォルダを追加する関数
    private func addFolder() {
        if !newFolderName.isEmpty {
            let newFolder = Folder(name: newFolderName)
            folders.append(newFolder) // フォルダを追加
            newFolderName = "" // テキストフィールドをクリア
        }
    }
}

struct FolderSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        FolderSelectionView()
    }
}
