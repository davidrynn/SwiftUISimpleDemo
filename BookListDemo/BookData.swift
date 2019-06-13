//
//  BookData.swift
//  BookListDemo
//
//  Created by David Rynn on 6/13/19.
//  Copyright © 2019 David Rynn. All rights reserved.
//

import Foundation

struct BookData {
    static func getBooks() -> [Book] {
        var books: [Book] = []
        guard let path = Bundle.main.path(forResource: "books", ofType: "json") else {
            print("Missing file: books.json")
            return []
        }
        let url = URL(fileURLWithPath: path)
        do {
            let json = try Data(contentsOf: url)
            books = try JSONDecoder().decode([Book].self, from: json)
            return books
        } catch {
            print("Decoding failed, error: \(error.localizedDescription)")
            return []
        }
        return []
    }
}
