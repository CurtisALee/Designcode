//
//  UpdateDetail.swift
//  Designcode
//
//  Created by Curtis Lee on 12/03/2021.
//

import SwiftUI

struct UpdateDetail: View {
    // This var has a type = to the data structure created in UpdateList.swift
    // This is then = to the array of list properties
    var update: Update = updateData[0]
    
    var body: some View {
        List {
            VStack(spacing: 20) {
                Image(update.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .navigationBarTitle(update.title)
        .listStyle(PlainListStyle())
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
