import SwiftUI

struct SetReminder: View {
    @Environment(\.dismiss) var dismiss
    @State private var plantName = ""
    @State private var selectedRoom = ""
    @State private var selectedLight = ""
    @State private var selectedWateringDays = ""
    @State private var selectedWater = ""

    let rooms = ["Living Room", "Bedroom", "Kitchen", "Bathroom"]
    let lights = ["Full Sun", "Partial Sun", "Low Light"]
    let wateringDays = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
    let waterAmountOptions = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]

    @State private var showingAlert = false
    @Binding var reminders: [Reminder]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("Plant Name")
                        Divider()
                            .frame(width: 2, height: 30)
                            .overlay(Color("green1"))
                        TextField("Lilium", text: $plantName)
                            .padding(.horizontal)
                    }
                }

                Section(header: Text("Reminder Details")) {
                    // Room Picker
                    HStack {
                        Image(systemName: "location.fill")
                        Picker("Room", selection: $selectedRoom) {
                            ForEach(rooms, id: \.self) { room in
                                Text(room).tag(room)
                            }
                        }
                    }

                    // Light Picker
                    HStack {
                        Image(systemName: "sun.max.fill")
                        Picker("Light", selection: $selectedLight) {
                            ForEach(lights, id: \.self) { light in
                                Text(light).tag(light)
                            }
                        }
                    }

                    // Watering Days Picker
                    HStack {
                        Image(systemName: "drop")
                        Picker("Watering Days", selection: $selectedWateringDays) {
                            ForEach(wateringDays, id: \.self) { days in
                                Text(days).tag(days)
                            }
                        }
                    }

                    // Water Amount Picker
                    HStack {
                        Image(systemName: "drop")
                        Picker("Water", selection: $selectedWater) {
                            ForEach(waterAmountOptions, id: \.self) { option in
                                Text(option).tag(option)
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }.foregroundColor(.green)
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Set Reminder")
                        .font(.headline)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if validateInputs() {
                            saveReminder()
                            dismiss() // This will dismiss the SetReminder view
                        } else {
                            showingAlert = true
                        }
                    }.foregroundColor(.green)
                }
            }
            .alert("Please complete all choices🙏🏼", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }

    func validateInputs() -> Bool {
        return !plantName.isEmpty &&
               !selectedRoom.isEmpty &&
               !selectedLight.isEmpty &&
               !selectedWateringDays.isEmpty &&
               !selectedWater.isEmpty
    }

    func saveReminder() {
        let newReminder = Reminder(
            id: UUID(), // Ensure you have an id property in your Reminder struct
            plantName: plantName,
            selectedRoom: selectedRoom,
            selectedLight: selectedLight,
            selectedWateringDays: selectedWateringDays,
            selectedWater: selectedWater
        )
        
        reminders.append(newReminder) // Add new reminder to the array
        
        // Reset the fields after saving
        resetFields()
    }

    func resetFields() {
        plantName = ""
        selectedRoom = ""
        selectedLight = ""
        selectedWateringDays = ""
        selectedWater = ""
    }
}

#Preview {
    SetReminder(reminders: .constant([]))
}
