//
//  ExpenseListView.swift
//  split
//
//  Created by Macbook on 06/10/24.
//

import Foundation
import SwiftUI

struct ExpenseListView: View {
    @ObservedObject var viewModel: ExpenseViewModel
        
    var body: some View {
        List{
            ForEach(viewModel.expenses) { expense in
                VStack(alignment: .leading) {
                    Text(expense.description)
                        .font(.headline)
                    HStack {
                        Text("Pago por \(expense.payer)")
                        Spacer()
                        Text(String(format: "$%.2f", expense.amount))
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
                .padding(.vertical, 4)
            }
            .onDelete(perform: viewModel.deleteExpense)
        }
    }
}
