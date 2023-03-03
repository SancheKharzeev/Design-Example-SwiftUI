//
//  MenuView.swift
//  Design Example SwiftUI
//
//  Created by Александр Х on 01.03.2023.
//

import SwiftUI

var colorFrame = #colorLiteral(red: 0.7965510488, green: 0.7965510488, blue: 0.7965510488, alpha: 1)

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer() // сдвиг рамки вниз

            VStack {
                Text("Aleks - обучение завершено на 78%")
                    .font(.caption)

                Color.white
                    .frame(width: 88, height: 6)
                    .cornerRadius(3) // скругление углов
                    .frame(width: 130, height: 6, alignment: .leading) // рамка и выравнивание по левой стороне
                    .background(Color(.black).opacity(0.2))
                    .cornerRadius(3) // скругление углов
                    .padding()
                    .frame(width: 150, height: 24)
                    .background(Color(.black).opacity(0.2))
                    .cornerRadius(12) // скругление углов


                    
                MenuRow(title: "Личный кабинет", icon: "gear") // с помощью структуры MenuRow создаем еще три таких
                MenuRow(title: "Счет", icon: "creditcard")
                MenuRow(title: "Выход", icon: "person.crop.circle")
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous)) // градиент цвета
            .shadow(color: .black.opacity(0.2), radius: 20, y: 20) // тень
            .padding(.horizontal, 30) // отступ горизонтальный
            .overlay(
                Image("avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .offset(y:-150)
                
            )
        }
        .padding(.bottom, 30) // отступ внизу от границы до рамки 30п
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    var title: String // создаем переменные title и icon чтобы заменять их в Image(systemName: icon) и Text(title)
    var icon: String
    var colorImage = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light, design: .default)) // изображение тоже можно настроить через шрифт
                .imageScale(.large) // размер
                .frame(width: 32, height: 32) // рамка фиксирующая размер
                .foregroundColor(Color(colorImage))
            
            
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: 120, alignment: .leading)
        }
    }
}
