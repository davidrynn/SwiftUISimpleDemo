//
//  LibraryBookStruct.swift
//  TheProlificLibrary
//
//  Created by David Rynn on 10/26/18.
//  Copyright © 2018 David Rynn. All rights reserved.
//

import UIKit
import SwiftUI

struct BookViewModel: Codable, Comparable, Identifiable {
    
    //to make sortable
    static func <(lhs: BookViewModel, rhs: BookViewModel) -> Bool {
        guard let lhsBookTitle = lhs.bookTitle, let rhsBookTitle = rhs.bookTitle else {
            return false
        }
        //make sure it's case insensitive, so capitalize both
        return lhsBookTitle.capitalized < rhsBookTitle.capitalized
    }
    
    let author: String?
    let categories: String?
    let id: Int?
    var lastCheckedOut: String?
    var lastCheckedOutBy: String?
    let publisher: String?
    let bookTitle: String?
    let urlString: String?
    
    enum CodingKeys: String, CodingKey {
        //changing the struct property names to be safe with namespaces.
        // id is used for many thinks, title might be and url is a different type.
        case author
        case categories
        case id
        case lastCheckedOut
        case lastCheckedOutBy
        case publisher
        case bookTitle = "title"
        case urlString = "url"
    }
    
    func configureCell() -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "reuseIdentifier")
        cell.textLabel?.text = bookTitle
        cell.detailTextLabel?.text = author
        return cell
    }
}
