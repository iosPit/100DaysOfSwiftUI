//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Pitambar Dayal on 12/4/21.
//

import SwiftUI

// Custom modifier that can be applied to all titles
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

// Smaller view that can be used in our Content View
struct CapsuleText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        VStack {
            Button("Tap me") {
                useRedText.toggle()
            }
            .foregroundColor(useRedText ? .red : .blue)
            
            Text("Hello World")
                .modifier(Title())
            
            CapsuleText(text: "Banana")
            CapsuleText(text: "Apple")
                .foregroundColor(.yellow)
            
            Color.red
                .frame(width: 200, height: 200)
                .watermarked(with: "Hello")
                        
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
