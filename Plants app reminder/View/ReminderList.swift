import SwiftUI

struct ReminderList: View {
    @State var reminders: [Reminder] // Use @State to allow changes
    @State private var showSetReminder = false // State variable for showing SetReminder
    @State private var navigateToCompletion = false // State variable for navigation to CompletionView

    var body: some View {
        NavigationStack {
            VStack {
                // Divider and Today's Text
                VStack {
                    Divider()
                    Text("Today")
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, 280.0) // Adjust vertical padding as needed
                }
                .padding(.top, 16) // Add some top padding
                
                List {
                    ForEach(reminders) { reminder in
                        HStack {
                            // Circle for completion
                            Image(systemName: reminder.isCompleted ? "checkmark.circle.fill" : "circle")
                                .padding(.leading)
                                .font(.system(size: 28))
                                .foregroundColor(reminder.isCompleted ? .green : .gray)
                                .onTapGesture {
                                    // Toggle completion state
                                    if let index = reminders.firstIndex(where: { $0.id == reminder.id }) {
                                        reminders[index].isCompleted.toggle()
                                        
                                        // Check if all reminders are completed
                                        if reminders.allSatisfy({ $0.isCompleted }) {
                                            navigateToCompletion = true // Set navigation state
                                        }
                                    }
                                }

                            VStack(alignment: .leading) {
                                // Room
                                HStack {
                                    Image(systemName: "location")
                                        .foregroundColor(.gray)
                                    Text("in \(reminder.selectedRoom)")
                                        .foregroundColor(Color.gray)
                                }

                                // Plant Name
                                HStack {
                                    Text(reminder.plantName)
                                        .font(.title)
                                        .multilineTextAlignment(.center)
                                        .padding(.leading, 10.0)
                                        .padding(.top, 1)
                                }

                                HStack(spacing: 20) {
                                    HStack {
                                        Image(systemName: imageName(for: reminder.selectedLight))
                                        Text(reminder.selectedLight)
                                    }
                                    .foregroundColor(.yellow) // Adjust to a valid color
                                    .padding(6)
                                    .background(
                                        RoundedRectangle(cornerRadius: 40)
                                            .fill(Color(.systemGray6))
                                    )

                                    // Water Background
                                    HStack {
                                        Image(systemName: "drop")
                                        Text(reminder.selectedWater)
                                    }
                                    .foregroundColor(.blue) // Adjust to a valid color
                                    .padding(6)
                                    .background(
                                        RoundedRectangle(cornerRadius: 30)
                                            .fill(Color(.systemGray6))
                                    )
                                }
                            }
                        }
                    }
                    .onDelete(perform: deleteReminder) // Add the delete function
                }
                .listStyle(PlainListStyle())
                
                // New Reminder Button
                Button(action: {
                    showSetReminder = true // Show the SetReminder view
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                        Text("New Reminder")
                            .font(.headline)
                    }
                    .foregroundColor(Color("green1")) // Ensure this color exists
                    .padding()
                }
                .buttonStyle(PlainButtonStyle()) // Remove default button styling
                .frame(maxWidth: .infinity, alignment: .leading) // Align to the left
                .sheet(isPresented: $showSetReminder) {
                    SetReminder(reminders: $reminders) // Present the SetReminder view
                }
            }
            .navigationTitle("My Plants 🌱")
            .background(
                NavigationLink(destination: CompletionView(), isActive: $navigateToCompletion) {
                    EmptyView()
                }
            )
        }
    }

    func deleteReminder(at offsets: IndexSet) {
        reminders.remove(atOffsets: offsets) // Remove the reminder at the specified index
    }

    func imageName(for light: String) -> String {
        switch light {
        case "Full Sun":
            return "sun.max.fill"
        case "Partial Sun":
            return "sun.haze.fill"
        case "Low Light":
            return "moon.fill"
        default:
            return "questionmark" // Fallback for unknown light condition
        }
    }
}

// Preview with sample data
struct ReminderList_Previews: PreviewProvider {
    static var previews: some View {
        ReminderList(reminders: [
            Reminder(plantName: "Lilium", selectedRoom: "Living Room", selectedLight: "Full Sun", selectedWateringDays: "Every 2 days", selectedWater: "50-100 ml")
        ])
    }
}
