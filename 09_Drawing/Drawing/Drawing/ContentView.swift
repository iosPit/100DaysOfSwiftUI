//
//  ContentView.swift
//  Drawing
//
//  Created by Pitambar Dayal on 1/3/22.
//

import SwiftUI

struct Arrow: Shape {
    //var borderWeight: CGFloat
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY*2/3))
        path.addLine(to: CGPoint(x: rect.maxX*1/3, y: rect.maxY*2/3))
        path.addLine(to: CGPoint(x: rect.maxX*1/3, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX*2/3, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX*2/3, y: rect.maxY*2/3))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY*2/3))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct ContentView: View {
    @State private var borderWeight = 10.0
    
    @State private var hueColors = stride(from: 0, to: 1, by: 0.01).map {
        Color(hue: $0, saturation: 1, brightness: 1)
    }

    var body: some View {
        Arrow()
            .fill(LinearGradient(gradient: Gradient(colors: hueColors),
                                   startPoint: .top,
                                   endPoint: .bottom))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
