//
//  BookList.swift
//  BookListDemo
//
//  Created by David Rynn on 6/13/19.
//  Copyright © 2019 David Rynn. All rights reserved.
//

import SwiftUI

struct BookList : View {
    
    @State var books: [Book]
    @State var isLoading: Bool = false
    
    var body: some View {
        NavigationView {
            if !isLoading {
            List(books) { book in
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
                        Button(action: loadData) {
                            Text("Load")
                        }
                )
            }
        }
    }
    
    func loadData() {
        books = BookData.getBooks()
    }
}

#if DEBUG
struct BookList_Previews : PreviewProvider {
    static var previews: some View {
        BookList(books: BookData.getBooks())
    }
}
#endif
