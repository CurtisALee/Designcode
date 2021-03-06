//
//  RingView.swift
//  Designcode
//
//  Created by Curtis Lee on 12/03/2021.
//

import SwiftUI

struct RingView: View {
    var color1 = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    var color2 = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    var width: CGFloat = 300 // Expects width (and height) to be a CGFloat, so we must specify here in order to use in .frame()
    var height: CGFloat = 300
    var percent: CGFloat = 88 // This can now be dyamnically changed
    
    @Binding var show: Bool // Control animation state outside of this file
    
    var body: some View {
        // Use a let as the value won't be changing directly
        let multiplier = width / 44 // = 2
        let progress = 1 - percent / 100 // 1 means no progress, minus the percent out of 100
        
        // Must include a 'return' if you use a variable inside the body
        return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: width, height: height)
            
            Circle()
                .trim(from: show ? progress : 1, to: 1) // True: show progress, else: show none (1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(
                        lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0
                    )
                )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: height)
                .shadow(color: Color(color2).opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
            
            Text("\(Int(percent))%") // Calling the percent variable here
                .font(.system(size: 14 * multiplier)) // e.g. 14 x 2 = 28
                .fontWeight(.bold)
                .onTapGesture {
                    self.show.toggle()
            }
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}
