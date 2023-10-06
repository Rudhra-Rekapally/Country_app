//
//  CountriesViewModel.swift
//  Country_App
//
//  Created by ATLAS Checkout Laptop on 10/6/23.
//

import Foundation

import SwiftUI

class CountriesViewModel: ObservableObject {
    @Published var countries = [Country]()
    @Published var searchText = ""
    
    func getAllCountries() async {
        do {
            let url = URL(string: "https://restcountries.com/v3.1/all")!
            let (data, _) = try await URLSession.shared.data(from: url)
            countries = try JSONDecoder().decode([Country].self, from: data)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    var filteredCountries: [Country] {
        return countries.filter {
            searchText.isEmpty || $0.name.common.lowercased().contains(searchText.lowercased())
        }
    }
}
