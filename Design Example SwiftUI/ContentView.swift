//
//  ContentView.swift
//  Design Example SwiftUI
//
//  Created by Александр Х on 25.02.2023.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            VStack { // вертикальный стак
                Image(systemName: "globe")
                    .imageScale(.large) // размер картинки
                    .foregroundColor(.accentColor) // цвет
                Text("Дизайн в SwiftUI!")
                    .font(.title) // шрифт
                    .fontWeight(.semibold) // жирность полужирный
                    .foregroundColor(.black) // цвет
                Text("Сертификат")
                    .foregroundColor(Color("Primary"))
            }
            Image("Logo SwiftUI")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
