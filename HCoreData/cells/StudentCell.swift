//
//  StudentCell.swift
//  HCoreData
//
//  Created by Karavella on 10/09/22.
//

import SwiftUI

struct StudentCell: View {
    @Environment(\.managedObjectContext) var moc
    var student:Student
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(student.firstname!).fontWeight(.bold)
                Text(student.lastname!).fontWeight(.bold)
                Spacer()
                Text(student.gender!).foregroundColor(.blue)
                Button {
                    moc.delete(student)
                } label: {
                    Image(systemName: "trash").foregroundColor(.red)
                }

            }
            HStack{
                Text(student.phone!)
                VStack{}.frame(width: 1, height: 14).background(.black)
                Text(student.email!)
            }
            Text(student.adress!)
            
        }
        
    }
}

struct StudentCell_Previews: PreviewProvider {
    static var previews: some View {
        StudentCell(student: Student())
    }
}
