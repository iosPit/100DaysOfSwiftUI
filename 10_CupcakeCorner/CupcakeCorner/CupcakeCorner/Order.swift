//
//  Order.swift
//  CupcakeCorner
//
//  Created by Pitambar Dayal on 1/26/22.
//

import SwiftUI

class Order: ObservableObject, Codable {
    
    struct OrderDetails {
        static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
        var type = 0
        var quantity = 3
        
        var specialRequestEnabled = false {
            didSet {
                if specialRequestEnabled == false {
                    extraFrosting = false
                    addSprinkles = false
                }
            }
        }
        var extraFrosting = false
        var addSprinkles = false
        
        var name = ""
        var streetAddress = ""
        var city = ""
        var zip = ""
        
        var hasValidAddress: Bool {
            if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty { return false }
            
            if name.allSatisfy({ $0.isWhitespace }) ||
                streetAddress.allSatisfy({ $0.isWhitespace }) ||
                city.allSatisfy({ $0.isWhitespace }) ||
                zip.allSatisfy({ $0.isWhitespace }) { return false }
            
            return true
        }
                
        var cost: Double {

            var cost = Double(quantity) * 2         // $2 per cake
            cost += (Double(type) / 2)        // complicated cakes cost more
            if extraFrosting { cost += Double(quantity) }        // $1/cake for extra frosting
            if addSprinkles { cost += Double(quantity) / 2 }        // $0.50/cake for sprinkles

            return cost
        }
    }
    
    
    
    
    
    // Order Details //
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    // Address View Details //
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty { return false }
        
        if name.allSatisfy({ $0.isWhitespace }) ||
            streetAddress.allSatisfy({ $0.isWhitespace }) ||
            city.allSatisfy({ $0.isWhitespace }) ||
            zip.allSatisfy({ $0.isWhitespace }) { return false }
        
        return true
    }
    
    // Checkout View Details //
    
    var cost: Double {

        var cost = Double(quantity) * 2         // $2 per cake
        cost += (Double(type) / 2)        // complicated cakes cost more
        if extraFrosting { cost += Double(quantity) }        // $1/cake for extra frosting
        if addSprinkles { cost += Double(quantity) / 2 }        // $0.50/cake for sprinkles

        return cost
    }
    
    
    // Encoding to JSON //
    
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)

        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
    
    init() {}

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)

        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)

        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    
}