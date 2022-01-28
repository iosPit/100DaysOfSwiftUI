//
//  Practice_ImagePaint.swift
//  Drawing
//
//  Created by Pitambar Dayal on 1/4/22.
//

import SwiftUI

struct Practice_ImagePaint: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .frame(width: 300, height: 300)
                .border(ImagePaint(image: Image("Example"), scale: 0.02), width: 30)
            
            Text("Hello World")
                .frame(width: 300, height: 300)
                .border(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
            
            Capsule()
                .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.1), lineWidth: 20)
                .frame(width: 300, height: 200)
        }
    }
}

struct Practice_ImagePaint_Previews: PreviewProvider {
    static var previews: some View {
        Practice_ImagePaint()
    }
}
