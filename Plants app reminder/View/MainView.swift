
import SwiftUI

struct MainView: View {
    @State private var reminders: [Reminder] = [] // State to hold reminders
    @State private var showingSetReminder = false // State to control sheet presentation

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Divider()
                    .padding(.top, -50)
                
                // Plant Image
                Image("Plant")
                    .resizable()
                    .frame(width: 164, height: 200)
                    .scaledToFit()

                // Title
                Text("Start your plant journey!")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color("offwhite"))
                    .bold()
                
                // Description Text
                Text("Now all your plants will be in one place and we will help you take care of them :) 🪴")
                    .font(.headline)
                    .foregroundColor(Color("brown"))
                    .multilineTextAlignment(.center)
                    .padding(10.0)

                // Button to show Set Plant Reminder sheet
                Button(action: {
                    showingSetReminder = true
                }) {
                    Text("Set Plant Reminder")
                        .frame(width: 250, height: 40)
                        .background(Color("green1"))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .font(.headline)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding(.top, 50.0)
            .navigationTitle("My Plant 🌱")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarBackButtonHidden(true)
        }
        .sheet(isPresented: $showingSetReminder) {
            SetReminder(reminders: $reminders) // Present the SetReminder view as a sheet
        }
    }
}

#Preview {
    MainView()
}
