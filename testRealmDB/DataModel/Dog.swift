//
//  Dog.swift
//  testRealmDB
//
//  Created by 平野裕貴 on 2023/07/13.
//

import Foundation
import RealmSwift

// まずは、保存するデータの型を定義します。
class Dog: Object, Identifiable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
