//
//  Country.swift
//  GeoQuiz
//
//  Data model for countries with flags
//

import Foundation

struct Country: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let capital: String
    let flagEmoji: String
    let isEUMember: Bool
    
    init(id: String, name: String, capital: String, flagEmoji: String, isEUMember: Bool = false) {
        self.id = id
        self.name = name
        self.capital = capital
        self.flagEmoji = flagEmoji
        self.isEUMember = isEUMember
    }
}

// MARK: - EU Countries Data

extension Country {
    static let euCountries: [Country] = [
        Country(id: "AT", name: "Österreich", capital: "Wien", flagEmoji: "🇦🇹", isEUMember: true),
        Country(id: "BE", name: "Belgien", capital: "Brüssel", flagEmoji: "🇧🇪", isEUMember: true),
        Country(id: "BG", name: "Bulgarien", capital: "Sofia", flagEmoji: "🇧🇬", isEUMember: true),
        Country(id: "HR", name: "Kroatien", capital: "Zagreb", flagEmoji: "🇭🇷", isEUMember: true),
        Country(id: "CY", name: "Zypern", capital: "Nikosia", flagEmoji: "🇨🇾", isEUMember: true),
        Country(id: "CZ", name: "Tschechien", capital: "Prag", flagEmoji: "🇨🇿", isEUMember: true),
        Country(id: "DK", name: "Dänemark", capital: "Kopenhagen", flagEmoji: "🇩🇰", isEUMember: true),
        Country(id: "EE", name: "Estland", capital: "Tallinn", flagEmoji: "🇪🇪", isEUMember: true),
        Country(id: "FI", name: "Finnland", capital: "Helsinki", flagEmoji: "🇫🇮", isEUMember: true),
        Country(id: "FR", name: "Frankreich", capital: "Paris", flagEmoji: "🇫🇷", isEUMember: true),
        Country(id: "DE", name: "Deutschland", capital: "Berlin", flagEmoji: "🇩🇪", isEUMember: true),
        Country(id: "GR", name: "Griechenland", capital: "Athen", flagEmoji: "🇬🇷", isEUMember: true),
        Country(id: "HU", name: "Ungarn", capital: "Budapest", flagEmoji: "🇭🇺", isEUMember: true),
        Country(id: "IE", name: "Irland", capital: "Dublin", flagEmoji: "🇮🇪", isEUMember: true),
        Country(id: "IT", name: "Italien", capital: "Rom", flagEmoji: "🇮🇹", isEUMember: true),
        Country(id: "LV", name: "Lettland", capital: "Riga", flagEmoji: "🇱🇻", isEUMember: true),
        Country(id: "LT", name: "Litauen", capital: "Vilnius", flagEmoji: "🇱🇹", isEUMember: true),
        Country(id: "LU", name: "Luxemburg", capital: "Luxemburg", flagEmoji: "🇱🇺", isEUMember: true),
        Country(id: "MT", name: "Malta", capital: "Valletta", flagEmoji: "🇲🇹", isEUMember: true),
        Country(id: "NL", name: "Niederlande", capital: "Amsterdam", flagEmoji: "🇳🇱", isEUMember: true),
        Country(id: "PL", name: "Polen", capital: "Warschau", flagEmoji: "🇵🇱", isEUMember: true),
        Country(id: "PT", name: "Portugal", capital: "Lissabon", flagEmoji: "🇵🇹", isEUMember: true),
        Country(id: "RO", name: "Rumänien", capital: "Bukarest", flagEmoji: "🇷🇴", isEUMember: true),
        Country(id: "SK", name: "Slowakei", capital: "Bratislava", flagEmoji: "🇸🇰", isEUMember: true),
        Country(id: "SI", name: "Slowenien", capital: "Ljubljana", flagEmoji: "🇸🇮", isEUMember: true),
        Country(id: "ES", name: "Spanien", capital: "Madrid", flagEmoji: "🇪🇸", isEUMember: true),
        Country(id: "SE", name: "Schweden", capital: "Stockholm", flagEmoji: "🇸🇪", isEUMember: true)
    ]
}
