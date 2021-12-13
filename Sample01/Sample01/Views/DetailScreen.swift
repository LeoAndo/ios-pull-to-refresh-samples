//
//  DetailScreen.swift
//  Sample01
//
//  Created by LeoAndo on 2021/12/14.
//

import SwiftUI

struct DetailScreen: View {
    var title: String
    @State private var anim = false
    var body: some View {
        Text(title)
            .font(.title)
            .foregroundColor(Color.green)
            .scaleEffect(anim ? 2.0 : 1.0)
            .rotation3DEffect(.degrees(anim ? 20 : -20), axis: (x: anim ? -45.0 : -90.0, y: anim ? -45.0 : -90.0, z: anim ? -45.0 : -90.0))
            .animation(Animation.easeInOut.repeatForever(autoreverses: true))
            .onAppear {
                anim.toggle()
            }
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(title: "delectus aut autem")
    }
}
