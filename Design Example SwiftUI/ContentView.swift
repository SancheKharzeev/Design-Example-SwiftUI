//
//  ContentView.swift
//  Design Example SwiftUI
//
//  Created by Александр Х on 25.02.2023.
//
import SwiftUI


var color1 = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
var color2 = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
var color3 = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)

struct ContentView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero // переменная для возможности передвижения карточек
    @State var showCard = false
    @State var bottomState = CGSize.zero // переменная для возможности передвижения карточек
    @State var showFull = false
    
    var body: some View {
        ZStack {
            TitleView() // надпись вверху Сертификаты
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .offset(y: showCard ? -200 : 0)
                .animation(Animation
                    .default
                    .delay(0.1)
                           , value: showCard)
            
            
            BackCardView()
                .background(Color(show ? .orange : .red))
                .cornerRadius(20) // скругление углов
                .shadow(radius: 20)
                .offset(x:0, y:show ? -650 : -60) // сдвиг вверх на 40п, но при нажатии сдвиг на 600
                .offset(x: viewState.width, y: viewState.height)
            
                .offset(y: showCard ? -190 : 0)
                .rotationEffect(.degrees(showCard ? -15 : 0))
                .animation(Animation
                    .default
                    .speed(1)
                           , value: showCard)
            
                .scaleEffect(showCard ? 1 : 0.9) // масштабирование
                .rotationEffect(.degrees(show ? 0 : 15)) // наклон на 15. но при нажатии наклон 0
                .rotation3DEffect(.degrees(showCard ? 0 : 15), axis: (x: 15, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5), value: show) // анимация появления карточки. С временем продолжения 0.5
            
            BackCardView()
                .background(Color(show ? color1 : color2))
                .cornerRadius(20) // скругление углов
                .shadow(radius: 20)
                .offset(x:0, y:show ? -400 : -40) // сдвиг вверх на 40п
                .offset(x: viewState.width, y: viewState.height)
            
                .offset(y: showCard ? -160 : 0)
                .rotationEffect(.degrees(showCard ? -10 : 0))
                .animation(Animation
                    .default
                    .speed(1.2)
                           , value: showCard)
            
                .scaleEffect(showCard ? 1 : 0.9) // масштабирование
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotation3DEffect(.degrees(showCard ? 0 : 10), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.4), value: show) // анимация появления карточки
            
            BackCardView()
                .background(Color(show ? color3 : .blue))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x:0, y:show ? -200 : -20) // при касании выдвигается вверх на 200п
                .offset(x: viewState.width, y: viewState.height) // дает возможность двигать пока касаешься
            
                .offset(y: showCard ? -130 : 0)
                .rotationEffect(.degrees(showCard ? -5 : 0))
                .animation(Animation
                    .default
                    .speed(1.5)
                           , value: showCard)
            
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotation3DEffect(.degrees(showCard ? 0 : 5), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3), value: show) // анимация появления карточки
            
            CardView()
                .frame(width: showCard ? 375 : 340, height: 220) // рамка
                .background(Color(.black)) // изменение фона
            //                .cornerRadius(20) // скругление углов
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
            
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100 : 0)
                .animation(Animation
                    .default
                    .speed(2)
                           , value: showCard)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: viewState) // анимация пружины
                .onTapGesture { // Модификатор добавляющий действие, выполняемое, когда это представление распознает жест касания.
                    self.showCard.toggle() // добавили возможность переключать с фолс на тру
                    
                }
            
                .gesture( // модификатор перетаскивания
                    DragGesture().onChanged { value in
                        self.viewState = value.translation // значение места расположения будет передаваться в свойство viewState
                        self.show = true
                    }
                        .onEnded { value in
                            self.viewState = .zero
                            self.show = false
                        }
                )
            Text("\(bottomState.height)").offset(y: -340)
            Text("\(self.showFull.description)").offset(y: -325)
            
            BottomCardView()
                
                .blur(radius: show ? 20 : 0)
                .animation(.default, value: show)
                .animation(.default, value: bottomState)
                
                .offset(x: 0, y:showCard ? 400 : 1000) // при нажатии на карточку выходит нижняя карточка
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8), value: showCard)
                .offset(y: bottomState.height)
            
                .gesture( // модификатор перетаскивания
                    DragGesture().onChanged { value in
                        self.bottomState = value.translation // значение места расположения будет передаваться в свойство viewState
                        if self.showFull {
                            self.bottomState.height += -300
                        }
                        if self.bottomState.height < -300 {
                            self.bottomState.height = -300
                        }
                    }
                        .onEnded { value in
                            if self.bottomState.height > 50 {
                                self.showCard = false
                            }
                            if (self.bottomState.height < -100 && !self.showFull) || (self.bottomState.height < -250 && self.showFull) {
                                self.bottomState.height = -300
                                self.showFull = true
                                    
                            } else {
                                self.bottomState = .zero
                                self.showFull = false
                            }
                            
                        }
                )
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(width: 340, height: 220)
        
    }
}

struct CardView: View {
    var body: some View {
        VStack { // вертикальный стак
            HStack { // горизонт стак
                VStack(alignment: .leading) { // вертикальный стак c выравниванием по левой стороне
                    Text("Дизайн в SwiftUI!")
                        .font(.title) // шрифт
                        .fontWeight(.semibold) // жирность полужирный
                        .foregroundColor(.white) // цвет
                    Text("Сертификат")
                        .foregroundColor(Color("Primary"))
                }
                
                Spacer() // сделал пространство между текстом и логотипом
                
                Image("Logo SwiftUI")
                    .resizable() // дает возможность менять размер картинки
                    .aspectRatio(contentMode: .fit) // на выбор fill or fit т.е заполнить или вписать
                    .frame(width: 50) // заключить логотип в рамку
                
            }
            .padding(.horizontal, 20) // отступ по горизонтали в 20п
            .padding(.top)// отсутп только сверху
            
            Image("2")
                .resizable() // возможность менять размер
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 110, alignment: .top)
            
            
            
            
        }
        
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Сертификаты")
                    .font(.largeTitle) // шрифт большой
                    .fontWeight(.bold) // жирный
                Spacer() // отодвинет текст влево
            }
            .padding() // отступ со всех сторон
            Spacer() // отодвинет текст вверх
        }
    }
}

struct BottomCardView: View { // сдвиг вниз на 500п
    var body: some View {
        VStack(spacing: 20) { // расстояние между объектами 20
            Rectangle() // добавил прямоугольник как полосочку
                .frame(width: 40, height: 5)
                .opacity(0.1)
                .cornerRadius(3)
            Text("Изучение особенностей разработки адаптивного дизайна в SwiftUI")
                .multilineTextAlignment(.center) // расположение текста по середине
                .font(.subheadline) // шрифт
                .lineSpacing(4) // пространство между строками
            
            Spacer()
        }
        .padding(.top, 8) // отступ сверху уменьшили со стандартных 16 до 8
        .padding(.horizontal) // добавили отступ по горизонтали от текста до 16 и рамка стала шире
        .frame(maxWidth: .infinity) // затолкали в рамку которую максимально увеличили в ширину
        .background(Color("Background 3"))
        .cornerRadius(30)
        .shadow(radius: 20)
        
    }
}
