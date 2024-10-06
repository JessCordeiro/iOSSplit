//
//  PersistenceService.swift
//  split
//
//  Created by Macbook on 18/09/24.
//

import Foundation

class PersistenceService {
    private static let key = "saved_expenses"
    
    static func save(expenses: [Expense]) {
            do {
                let data = try JSONEncoder().encode(expenses)
                UserDefaults.standard.set(data, forKey: key)
            } catch {
                print("Erro ao salvar despesas: \(error)")
            }
        }
        
    static func load() -> [Expense]? {
            guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
            do {
                let expenses = try JSONDecoder().decode([Expense].self, from: data)
                return expenses
            } catch {
                print("Erro ao carregar despesas: \(error)")
                return nil
            }
        }
}
