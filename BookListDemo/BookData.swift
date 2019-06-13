//
//  BookData.swift
//  BookListDemo
//
//  Created by David Rynn on 6/13/19.
//  Copyright © 2019 David Rynn. All rights reserved.
//

import Foundation

struct BookData {
    static func getBooks() -> [BookViewModel]? {
        var books: [BookViewModel] = []
        guard let path = Bundle.main.path(forResource: "books", ofType: "json") else {
            print("Missing file: books.json")
            return nil
        }
        let url = URL(fileURLWithPath: path)
        do {
            let json = try Data(contentsOf: url)
            books = try JSONDecoder().decode([BookViewModel].self, from: json)
            return books
        } catch {
            print("Decoding failed, error: \(error.localizedDescription)")
            return nil
        }
        return nil
    }
}
