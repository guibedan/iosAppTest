//
//  ContentView.swift
//  My-FirstApp
//
//  Created by Guilherme Bedan on 29/09/22.
//

import SwiftUI

class Counter: ObservableObject {
    
    @Published var sec = 0
    @Published var min = 0
    @Published var hours = 0
    @Published var days = 0
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { Timer in
            // encremento de contador
            let calendar = Calendar.current
            
            let components = calendar.dateComponents([.day, .hour, .minute, .second], from: Date())
            
            /*
            let currentDate = calendar.date(from: components)
            
            var eventDateComponents = DateComponents()
            eventDateComponents.year = 2022
            eventDateComponents.month = 9
            eventDateComponents.day = 30
            eventDateComponents.hour = 20
            eventDateComponents.minute = 23
            eventDateComponents.second = 0
            
            let eventDate = calendar.date(from: eventDateComponents)
            */
            
            self.sec = components.second!
            self.min = components.minute!
            self.hours = components.hour!
            self.days = components.day!
        }
    }
}


struct ContentView: View {
    
    @StateObject var counter = Counter()
    
    var body: some View {
        ZStack {
            Color(hue: 0, saturation: 0, brightness: 0.1).edgesIgnoringSafeArea(.all)
            VStack() {
                
                Text("Olá meu rapaz!")
                    .padding(20)
                    .background(Color(hue: 0.719, saturation: 0.808, brightness: 0.599), alignment: .center)
                    .font(.largeTitle)
                    .foregroundColor(Color(hue: 0.732, saturation: 0.0, brightness: 1.0))
                    .cornerRadius(10.0)
                    .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                
                HStack {
                    Text("\(counter.days) Days |")
                        .foregroundColor(Color(hue: 0.732, saturation: 0.0, brightness: 1.0))
                    Text("\(counter.hours) Hour |")
                        .foregroundColor(Color(hue: 0.732, saturation: 0.0, brightness: 1.0))
                    Text("\(counter.min) Min |")
                        .foregroundColor(Color(hue: 0.732, saturation: 0.0, brightness: 1.0))
                    Text("\(counter.sec) Sec")
                        .foregroundColor(Color(hue: 0.732, saturation: 0.0, brightness: 1.0))
                }
                .padding(.top,30)
                Text("Relógio Hora do Sistema!")
                    .foregroundColor(Color(hue: 0.732, saturation: 0.0, brightness: 1.0))
                    .padding(.top,19)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
