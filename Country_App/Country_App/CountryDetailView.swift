//
//  CountryDetailView.swift
//  Country_App
//
//  Created by ATLAS Checkout Laptop on 10/6/23.
//

import Foundation
import SwiftUI

struct CountryDetailView: View {
    var country: Country
    
    var body: some View {
        Text("Country Flag: \(country.flag)")
            .padding()
        Text("Country Official Name: \(country.name.official)")
            .navigationTitle("Country Detail")
        Text("Country Common Name: \(country.name.common)")
            .padding()
        Text("Capital: \(country.capital?.first ?? "Unknown")")
            .padding()
        Text("Translations: \(country.translations.ara.common)")
            .padding()
        Text("Car-Side: \(country.car.side)")
//        Text("Demonyms: \(country.demonyms.eng.f)")
    }
}
