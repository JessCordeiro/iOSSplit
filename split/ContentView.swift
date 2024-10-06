//
//  ContentView.swift
//  split
//
//  Created by Macbook on 18/09/24.
//

import SwiftUI

struct ContentView: View {
   
    @StateObject var viewModel = ExpenseViewModel()
    @State private var showAddExpense = false
    @State private var isEditing = false
    
    var body: some View {
            NavigationView {
                VStack {
                    ExpenseListView(viewModel: viewModel)
                    
                    HStack {
                        Text("Total: ")
                            .font(.headline)
                        Spacer()
                        Text(String(format: "$%.2f", viewModel.totalAmount))
                            .font(.headline)
                    }
                    .padding()
                    Button(action: {
                                        showAddExpense.toggle()
                                    }) {
                                        HStack {
                                            Image(systemName: "plus.circle.fill")
                                            Text("Adicionar Despesa")
                                        }
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Color.blue) 
                                        .cornerRadius(8)
                                    }
                                    .padding([.horizontal, .bottom])
                                    .sheet(isPresented: $showAddExpense) {
                                        AddExpenseView(viewModel: viewModel)
                                    }
                                }
                                .navigationTitle("Despesas Compartilhadas")
                                .toolbar {
                                    ToolbarItem(placement: .navigationBarTrailing) {
                                        EditButton()
                                    }
                                }
                            }
                        }
}

#Preview {
    ContentView()
}
