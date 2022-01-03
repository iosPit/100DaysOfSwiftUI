var a = ["a", "b", "c"]
var b = a.filter( {$0 != "b"} )
print("hello")
//import UIKit
//
//var greeting = "Hello, playground"
//
//struct ContentView: View {
//    @State private var showAlert = false
//
//    var body: some View {
//        ZStack {
//            VStack(spacing: 0) {
//                LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .top, endPoint: .bottom)
//
//                LinearGradient(gradient: Gradient(stops: [
//                    .init(color: .white, location: 0.45),
//                    .init(color: .black, location: 0.55)]),
//                    startPoint: .top, endPoint: .bottom)
//
//                RadialGradient(colors: [.green, .orange], center: .center, startRadius: 20, endRadius: 200)
//
//                AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
//
//                Color.blue
//            }
//            VStack {
//                Text("Your Text Here")
//                    .foregroundStyle(.secondary)
//                    .padding(50)
//                    .background(.ultraThinMaterial)
//
//                Button("Button 1") {}
//                .buttonStyle(.bordered)
//
//                Button("Button 2", role: .destructive) {}
//                .buttonStyle(.bordered)
//
//                Button("Button 3") {}
//                .buttonStyle(.borderedProminent)
//                .tint(.mint)
//
//                Button("Best Button Ever", role: .destructive) {
//                    showAlert = true
//                }
//                .buttonStyle(.borderedProminent)
//                .alert("OMG SELF DESTRUCT", isPresented: $showAlert) {
//                    Button("Delete", role: .destructive) {}
//                    Button("Cancel", role: .cancel) {}
//                }
//
//
//                Button {
//                    print("Button was tapped")
//                } label: {
//                    Text("Tap Me")
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(.red)
//                }
//
//                Button {
//                    print("Edit button was tapped")
//                } label: {
//                    Label("Edit", systemImage: "pencil")
//                }
//            }
//        } .ignoresSafeArea()
//    }
//}
//
//
//
