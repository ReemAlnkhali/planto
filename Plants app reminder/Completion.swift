import SwiftUI

struct ComplationView: View {
    var body: some View {
        NavigationStack {
            VStack {
                // This will create the navigation bar at the top
             
                
                // Divider added here
                Divider()
                    .padding(.horizontal) // Optional: Add some horizontal padding

                Image("Done")
                Text("All Done! 🎊")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("color2"))
                
                Text("All Reminders Complete")
                    .foregroundColor(Color("color1"))
                    .padding(.bottom, 260.0)
                
                // Navigation link for plus image
                NavigationLink(destination: SetReminderView()) {
                    Image(systemName: "plus.diamond.fill")
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("green1"))
                        .padding(.trailing, 350.0)
                }
                .buttonStyle(PlainButtonStyle()) // To remove default button styling
            }
            .padding(.bottom, 100.0)
            .navigationTitle("My Plants 🌱") // This sets the title for the navigation bar
            .accessibilityIdentifier("Identifier")
        }
    }
}



#Preview {
    ComplationView()
}
/*/struct AddPlantView: View {
	var body: some View {
		VStack {
			Text("Add a New Plant")
				.font(.largeTitle)
				.padding()

			// Add your form or other content here
			Text("Form for adding a plant will go here.")
			
			Spacer()
				.padding()
			
	//*/*    }/*
   //     .navigationTitle("Add Plant")
	 //   .navigationBarTitleDisplayMode(.inline)
			   '/*'*/*/*/*/*/
