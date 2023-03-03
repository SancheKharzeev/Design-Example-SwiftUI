//
//  Home.swift
//  Design Example SwiftUI
//
//  Created by Александр Х on 03.03.2023.
//

import SwiftUI

var colorBack = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)

struct Home: View {
    @State var showProfile = false
    
    var body: some View {
        ZStack {
            Color(colorBack) // сделали серый бэкграунд
                .edgesIgnoringSafeArea(.all) // 
            VStack {
                HStack {
                    Button(action: {
                        self.showProfile.toggle()
                    }) {
                        Image("avatar")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    }
                    Spacer()
                    
                }
                .padding(.horizontal)
                .padding(.top, 30)
                Spacer()
            }
            MenuView()
                .offset(y: showProfile ? 0 : 500)
                .animation(.spring(response: 0.5, dampingFraction: 0.6), value: showProfile)
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
