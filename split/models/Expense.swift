//
//  Expense.swift
//  split
//
//  Created by Macbook on 18/09/24.
//

import Foundation

struct Expense: Identifiable, Codable {
    var id = UUID()
    var description: String
    var amount: Double
    var payer: String
    var date: Date
}
