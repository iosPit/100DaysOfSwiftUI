//
//  Practice_CustomPath.swift
//  Drawing
//
//  Created by Pitambar Dayal on 1/3/22.
//

import SwiftUI

struct Practice_CustomPath: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            // path.closeSubpath()
        }
        
        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}

struct Practice_CustomPath_Previews: PreviewProvider {
    static var previews: some View {
        Practice_CustomPath()
    }
}
