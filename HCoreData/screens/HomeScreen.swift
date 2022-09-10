//
//  HomeScreen.swift
//  HCoreData
//
//  Created by Karavella on 10/09/22.
//

import SwiftUI

struct HomeScreen: View {
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
    @State var isModal:Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(students, id: \.id) { st in
                    StudentCell(student: st)
                }
            }
            .listStyle(.plain)
            .navigationBarTitle(Text("Student List"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.isModal = true
            }, label: {
                Text("Add")
            }).sheet(isPresented: $isModal, content: {
                AddScreen()
            })
            )
            
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
