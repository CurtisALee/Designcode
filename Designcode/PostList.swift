//
//  PostList.swift
//  Designcode
//
//  Created by Curtis Lee on 16/03/2021.
//

import SwiftUI

struct PostList: View {
    @ObservedObject var store = DataStore()
    
    var body: some View {
        List(store.posts) { post in
            VStack(alignment: .leading, spacing: 8) {
                Text(post.title).font(.system(.title, design: .serif)).bold()
                Text(post.body).font(.title)
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
