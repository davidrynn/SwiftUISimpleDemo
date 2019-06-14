//
//  BookListReference.swift
//  BookListDemo
//
//  Created by David Rynn on 6/14/19.
//  Copyright © 2019 David Rynn. All rights reserved.
//

import SwiftUI

struct BookListReference : View {
    
    @State var books: [Book]
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack {
            LoadingView(isShowing: $isLoading) {
                NavigationView {
                    List(self.books) { book in
                        Text(book.bookTitle ?? "no title")
                        }
                        .navigationBarTitle(Text("Books"))
                        .navigationBarItems(
                            leading:
                            Button(action: {
                                self.books = []
                            }) {
                                Text("Clear")
                            },
                            trailing:
                            VStack {
                                Button(action: self.loadData) {
                                    Text("Load")
                                }
                            }
                    )
                }
            }
            Button(action: { self.isLoading.toggle() }) { Text("Toggle Wait") }
        }
    }
    
    func loadData() {
        books = BookData.getBooks()
    }
}

#if DEBUG
struct BookListReference_Previews : PreviewProvider {
    static var previews: some View {
        BookListReference(books: BookData.getBooks())
    }
}
#endif
