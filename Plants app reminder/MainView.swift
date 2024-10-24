//
//  MainView.swift
//  Plants app reminder
//
//  Created by Reem Abdullah Alnkhali on 20/04/1446 AH.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Image("Plant")
                    .resizable()
                    .frame(width: 164, height: 200)
                    .padding()
                
                Text("Start your plant journey!")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color("color1")) // Ensure this color exists
                    .bold()
                    .padding(.top, 6.0)
                
                Text("Now all your plants will be in one place and we will help you take care of them :) 🪴")
                    .font(.headline)
                    .foregroundColor(Color("color2")) // Ensure this color exists
                    .multilineTextAlignment(.center)
                    .padding(10.0)
                
                // NavigationLink to SetReminderView
                NavigationLink(destination: SetReminderView()) {
                                   Text("Set Plant Reminder")
                                       .frame(width: 250, height: 40)
                                       .background(Color("green1")) // Ensure this color exists
                                       .foregroundColor(.black)
                                       .clipShape(RoundedRectangle(cornerRadius: 8))
                                       .font(.headline)
                               }
                               .padding(.top, 20)
                           }
                           .padding(.top, 20) // Adjusted padding for better layout
                           .navigationTitle("My Plants 🪴")
                      
        
                       }
                   }
               }


#Preview {
    MainView()
}
