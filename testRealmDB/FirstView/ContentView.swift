//
//  ContentView.swift
//  testRealmDB
//
//  Created by 平野裕貴 on 2023/07/13.
//

import SwiftUI
import RealmSwift

// SwiftUI View
struct ContentView: View {
    @State var dogs = try! Realm().objects(Dog.self).sorted(byKeyPath: "name", ascending: true)
    @State var newDogName: String = ""
    @State var newDogAge: String = ""

    var body: some View {
        VStack {
            // 新しいDogオブジェクトを作成するためのTextFieldとButton
            HStack {
                TextField("Dog Name", text: $newDogName)
                TextField("Dog Age", text: $newDogAge)
                Button(action: {
                    let dog = Dog()
                    dog.name = newDogName
                    dog.age = Int(newDogAge) ?? 0

                    let realm = try! Realm()
                    try! realm.write {
                        realm.add(dog)
                    }

                    self.dogs = realm.objects(Dog.self).sorted(byKeyPath: "name", ascending: true)
                }) {
                    Text("Add Dog")
                }
            }

            // 保存されたDogオブジェクトを表示するためのList
            List {
                ForEach(dogs, id: \.id) { dog in
                    Text("\(dog.name) is \(dog.age) years old.")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
