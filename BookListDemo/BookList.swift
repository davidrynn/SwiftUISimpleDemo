//
//  BookList.swift
//  BookListDemo
//
//  Created by David Rynn on 6/13/19.
//  Copyright © 2019 David Rynn. All rights reserved.
//

import SwiftUI

struct BookList : View {
    
    @State var books: [BookViewModel]?
    
    var body: some View {
        NavigationView {
            List(books ?? []) { book in
                Text(book.bookTitle ?? "no title")
                
            }
            .navigationBarTitle(Text("Books"))
                .navigationBarItems(trailing: Button(action: loadData) {
                    Text("Load")
            })
                .navigationBarItems(leading: Button(action: {
                    self.books = []
                }) {
                    Text("Clear")
                })
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
