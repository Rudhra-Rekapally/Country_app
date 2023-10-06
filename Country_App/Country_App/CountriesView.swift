//
//  CountriesView.swift
//  Country_App
//
//  Created by ATLAS Checkout Laptop on 10/6/23.
//

import Foundation

import SwiftUI

struct CountriesView: View {
    @StateObject var viewModel = CountriesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search for a country...", text: $viewModel.searchText)
                    .padding(7)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal, 10)
                
                List {
                    ForEach(viewModel.filteredCountries) { country in
                        NavigationLink(destination: CountryDetailView(country: country)) {
                            VStack(alignment: .leading) {
                                Text("\(country.flag) • \(country.name.common)")
                            }
                        }
                    }
                }
                .task {
                    await viewModel.getAllCountries()
                }
            }
            .navigationTitle("Countries")
        }
    }
}


struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView()
    }
}
