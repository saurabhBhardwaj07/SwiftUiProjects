//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Macbook Air  on 04/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false;
    let weatherData: [WeatherDay] = [
           WeatherDay(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 47),
           WeatherDay(dayOfWeek: "WED", imageName: "cloud.sleet.fill", temperature: 23),
           WeatherDay(dayOfWeek: "THU", imageName: "cloud.sun.bolt.fill", temperature: 34),
           WeatherDay(dayOfWeek: "FRI", imageName: "cloud.moon.fill", temperature: 67),
           WeatherDay(dayOfWeek: "SAT", imageName: "sun.snow.fill", temperature: 90)
       ]
       
    
    var body: some View {
        ZStack{
            AppBackgroundView(isNight: $isNight)
            VStack(spacing: 15){
                Text("Cupertino, CA").font(.system(size: 32 , weight: .medium , design: .default)).foregroundColor(.white).padding()
                VStack{
                    Image(systemName: isNight ? "moon.stars.fill" :  "cloud.sun.fill")
                        .renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width:180 , height:180)
                    Text("76°").font(.system(size: 60 )).fontWeight(.bold).foregroundColor(.white)
                }.padding(.bottom , 40)
                
                HStack (spacing: 12){
                    ForEach(weatherData, id: \.dayOfWeek) { day in
                                       WeatherDayItemView(dayOfWeak: day.dayOfWeek, imageName: day.imageName, temp: day.temperature)
                                   }
                }
                Spacer()
                Button {
                    isNight = !isNight
                } label: {
                    WeatherButton(title: "Change The Theme", textColor: Color.blue, backgroundColor: Color.white)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayItemView: View {
    var dayOfWeak: String
    var imageName: String
    var temp:Int
    
    var body: some View {
        VStack{
            Text(dayOfWeak).font(.system(size: 25)).fontWeight(.medium).foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.palette)
                .resizable().foregroundStyle(.white , .yellow).aspectRatio(contentMode: .fit).frame(width: 50 , height: 50)
            Text("\(temp)°").font(.system(size: 28 )).fontWeight(.bold).foregroundColor(.white)
            
        }
    }
}

struct AppBackgroundView: View {
   @Binding var isNight : Bool
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [isNight ? .black : .blue  , isNight ? .gray : Color("lightBlue")]),
            startPoint: .topLeading, endPoint: .bottomTrailing ).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//        ContainerRelativeShape().fill( isNight ? Color.black.gradient : Color.blue.gradient).ignoresSafeArea()
    }
}


