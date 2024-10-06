//
//  AddExpenseView.swift
//  split
//
//  Created by Macbook on 06/10/24.
//

import Foundation
import SwiftUI

struct AddExpenseView: View {
    
    @ObservedObject var viewModel: ExpenseViewModel
        @Environment(\.presentationMode) var presentationMode
        
        @State private var description = ""
        @State private var amount = ""
        @State private var payer = ""
    
    var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("Descrição")) {
                        TextField("Descrição", text: $description)
                    }
                    
                    Section(header: Text("Valor")) {
                        TextField("Valor", text: $amount)
                            .keyboardType(.decimalPad)
                    }
                    
                    Section(header: Text("Pagador")) {
                        TextField("Pagador", text: $payer)
                    }
                }
                .navigationBarTitle("Adicionar Despesa", displayMode: .inline)
                            .navigationBarItems(trailing: Button("Salvar") {
                                saveExpense()
                            }.disabled(!isFormValid))
                        }
                    }
                    
                    var isFormValid: Bool {
                        !description.isEmpty && Double(amount) != nil && !payer.isEmpty
                    }
                    
                    func saveExpense() {
                        if let amountValue = Double(amount) {
                            viewModel.addExpense(description: description, amount: amountValue, payer: payer)
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
        
}
