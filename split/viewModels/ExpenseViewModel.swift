//
//  ExpenseViewModel.swift
//  split
//
//  Created by Macbook on 18/09/24.
//
import SwiftUI
import Combine
import Foundation

class ExpenseViewModel: ObservableObject {
    @Published var expenses: [Expense] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadExpenses()
        
               $expenses
                   .debounce(for: 0.5, scheduler: RunLoop.main)
                   .sink { [weak self] _ in
                       self?.saveExpenses()
                   }
                   .store(in: &cancellables)
    }
    
    func addExpense(description: String, amount: Double, payer: String) {
           let newExpense = Expense(description: description, amount: amount, payer: payer, date: Date())
           expenses.append(newExpense)
       }
    
    func deleteExpense(at offsets: IndexSet) {
          expenses.remove(atOffsets: offsets)
          saveExpenses()
      }
       
       var totalAmount: Double {
           expenses.reduce(0) { $0 + $1.amount }
       }
       
       func saveExpenses() {
           PersistenceService.save(expenses: expenses)
       }
    
    func loadExpenses() {
        expenses = PersistenceService.load() ?? []
    }
}
