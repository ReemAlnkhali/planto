//
//  set reminder.swift
//  Plants app reminder
//
//  Created by Reem Abdullah Alnkhali  on 20/04/1446 AH.
//

import SwiftUI

struct SetReminderView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var plantName = ""
    @State private var selectedRoom: String = ""
    @State private var selectedLight: String = ""
    @State private var selectedWateringDays: String = ""
    @State private var waterAmount: String = ""
    
    let rooms = ["Living Room", "Bedroom", "Kitchen", "Bathroom"]
    let lights = ["Full Sun", "Partial Sun", "Low Light"]
    let wateringDays = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
    let waterAmountOptions = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    // Plant Name Input
                    HStack {
                        Text("Plant Name")
                        Divider()
                            .frame(width: 2, height: 30)
                            .overlay(Color("green1"))
                        TextField("Lilium", text: $plantName, onCommit: {
                            print("Entered plant name: \(plantName)")
                        })
                        .textFieldStyle(PlainTextFieldStyle())
                        .submitLabel(.done)
                        .padding(.horizontal)
                    }
                    
                    // Room Picker
                    Picker("Room", selection: $selectedRoom) {
                        ForEach(rooms, id: \.self) { room in
                            Text(room).tag(room)
                        }
                    }
                    .disabled(plantName.isEmpty)
                    
                    // Light Picker
                    Picker("Light", selection: $selectedLight) {
                        ForEach(lights, id: \.self) { light in
                            Text(light).tag(light)
                        }
                    }
                    .disabled(plantName.isEmpty)
                    
                    // Watering Days Picker
                    Picker("Watering Days", selection: $selectedWateringDays) {
                        ForEach(wateringDays, id: \.self) { days in
                            Text(days).tag(days)
                        }
                    }
                    .disabled(plantName.isEmpty)
                    
                    // Water Amount Picker
                    Picker("Water Amount", selection: $waterAmount) {
                        ForEach(waterAmountOptions, id: \.self) { option in
                            Text(option).tag(option)
                            
                        }
                    }
                    .disabled(plantName.isEmpty)
                    
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Set Reminder")
            .toolbar {
                // Cancel Button
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        print("Cancel tapped")
                        dismiss()
                    }) {
                        Text("Cancel")
                            .foregroundColor(Color("green1"))
                        
                    }
                }
                
                // Save Button
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Save tapped")
                        // Add save logic here
                        dismiss() // Dismiss after saving
                    }) {
                        Text("Save")
                            .foregroundColor(Color("green1"))
                        
                    }
        
                 
                        
                    }
                }
              
            }
          
            }
        }
    



#Preview {
    SetReminderView()
}
