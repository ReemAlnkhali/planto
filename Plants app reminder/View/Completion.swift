import SwiftUI

struct CompletionView: View {
	@State private var timer: Timer? = nil
	@Environment(\.dismiss) var dismiss // Use this to dismiss the view

	var body: some View {
		NavigationStack {
		

			VStack {
				// Image indicating completion
				Image("Done")
					.resizable()
					.scaledToFit()
					.frame(height: 250)
					.padding(.top)

				// Completion Title
				Text("All Done! 🎊")
					.font(.title)
					.fontWeight(.bold)
					.foregroundColor(Color("offwhite"))

				// Completion Message
				Text("All Reminders Complete")
					.foregroundColor(Color("brown"))
					.padding(.bottom, 90.0)

				// Navigation link to add a new reminder
				NavigationLink(destination: SetReminder(reminders: .constant([]))) { // Provide a binding here
					HStack {
						Image(systemName: "plus.circle.fill")
							.font(.title)
							.foregroundColor(Color("green1"))
						Text("New Reminder")
							.font(.headline)
							.foregroundColor(Color("green1"))
					}
					.padding()
				}
				.buttonStyle(PlainButtonStyle())
				.frame(maxWidth: .infinity, alignment: .leading)
			}
			.padding(.top, 70.0)
			.navigationTitle("My Plants 🌱")
			.navigationBarBackButtonHidden(true)
			.navigationBarTitleDisplayMode(.large)
			.accessibilityIdentifier("CompletionViewIdentifier")
		}
		.onAppear {
			startTimer()
		}
		.onDisappear {
			timer?.invalidate()
		}
	}

	private func startTimer() {
		timer = Timer.scheduledTimer(withTimeInterval: 15, repeats: false) { _ in
			dismiss() // Dismiss the view instead of exiting the app
		}
	}
}

#Preview {
	CompletionView()
}
