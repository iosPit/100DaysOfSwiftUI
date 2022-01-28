//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Pitambar Dayal on 1/13/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select Cake Type", selection: $order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 1...20)
                }
                
                Section {
                    Toggle("Special Request", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        Toggle("Extra Frosting", isOn: $order.extraFrosting)
                        Toggle("Add Sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(order: order),
                                   label: { Text("Delivery Details") })
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}







//
//
//class User: ObservableObject, Codable {
//    enum CodingKeys: CodingKey {
//        case name
//    }
//
//    @Published var name = "Pitambar"
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        name = try container.decode(String.self, forKey: CodingKeys.name)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(name, forKey: .name)
//    }
//}
//
//struct Response: Codable {
//    var results: [Result]
//}
//
//struct Result: Codable {
//    var trackId: Int
//    var trackName: String
//    var collectionName: String
//}
//
//struct ContentView: View {
//
//    @State private var username = ""
//    @State private var email = ""
//
//
//    @State private var results = [Result]()
//
//    var body: some View {
//        VStack {
//            Form {
//                Section {
//                    TextField("Username", text: $username)
//                    TextField("Email", text: $email)
//                }
//
//                Section {
//                    Button("Create account") {
//                        print("Creating Account...")
//                    }
//                }
//                .disabled(username.isEmpty || email.isEmpty)
//            }
//
//
//            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
//                image
//                    .resizable()
//                    .scaledToFit()
//            } placeholder: {
//                Color.red
//            }
//        .frame(width: 200, height: 200)
//
//            List(results, id: \.trackId) { item in
//                VStack(alignment: .leading) {
//                    Text(item.trackName)
//                        .font(.headline)
//                    Text(item.collectionName)
//                }
//            }
//            .task {
//                await loadData()
//        }
//        }
//    }
//    func loadData() async {
//        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
//            print("Invalid URL")
//            return
//        }
//
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
//                results = decodedResponse.results
//            }
//        } catch {
//            print("Invalid data")
//        }
//
//    }
//}
//
