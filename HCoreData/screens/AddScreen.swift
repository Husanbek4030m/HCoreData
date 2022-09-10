//
//  AddScreen.swift
//  HCoreData
//
//  Created by Karavella on 10/09/22.
//

import SwiftUI

struct AddScreen: View {
    @Environment(\.presentationMode) var pr
    @Environment(\.managedObjectContext) var moc
    
    @State var firstName:String = ""
    @State var lastName:String = ""
    @State var gender:String = ""
    let genders = ["Male", "Female"]
    
    @State var phone: String = ""
    @State var email: String = ""
    @State var address: String = ""
    
    
    func save(fr:String, ls: String, gen: String, ph:String, em:String, add:String) {
        let student = Student(context: self.moc)
        student.id = UUID()
        student.firstname = fr
        student.lastname = ls
        student.gender = gen
        student.phone = ph
        student.email = em
        student.adress = add
        
        try? self.moc.save()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("FirstName", text: $firstName)
                    TextField("LastName", text: $lastName)
                    Picker("Gender", selection: $gender) {
                        ForEach(genders, id: \.self) { it in
                            Text(it)
                        }
                    }
                }
                
                Section{
                    TextField("Phone", text: $phone)
                    TextField("Email", text: $email)
                    TextField("Address", text: $address)
                }
            }
            .navigationBarTitle("Add Student", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                save(fr: firstName, ls: lastName, gen: gender, ph: phone, em: email, add: address)
                pr.wrappedValue.dismiss()
            }, label: {
                Text("Save")
            }))
        }
    }
}

struct AddScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddScreen()
    }
}
