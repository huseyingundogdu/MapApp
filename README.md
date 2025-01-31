
<h1>Map App<img src="https://github.com/user-attachments/assets/b560dc59-9570-4b9d-9105-035d8eac137d" alt="drawing" width="75"/></h1>
  

## Overview
iOS application that allows users to create, save, and view map entries on an interactive map.
Users can add entries by providing a title, description, and selecting a location on the map.
The saved entries are displayed as annotations, making it easy to revisit and explore previously saved places.

## Features
- **User Authentication:** Secure login and signup using Firebase Authentication.
- **Entry Creation:** Users can add entries with a title, description, and a location on the map.
- **Map Integration:** Interactive map with annotations representing saved entries using MapKit.
- **Photo Support:** Users can attach images to their entries using PhotosUI.
- **Cloud Storage:** Entries and images are stored securely using Firebase Firestore and Firebase Storage.
- **Smooth Navigation:** SwiftfulRouting ensures a seamless user experience with intuitive navigation.

## Technologies Used
- **SwiftUI** - Modern declarative UI framework for building the app.
- **MapKit** - For integrating maps and displaying annotations.
- **PhotosUI** - For selecting and handling images.
- **FirebaseAuth** - User authentication and management.
- **FirebaseStorage** - Storing images in the cloud.
- **FirebaseFirestore** - Storing and managing journal entries.
- **SwiftfulRouting** - Simplified navigation within SwiftUI.
- **Swift Package Manager (SPM)** - Managing dependencies.

## Installation
1. Clone the repository:
   ```sh
   git clone <repository_url>
   cd MapApp
   ```
2. Open the project in Xcode.
3. Ensure all dependencies are installed via Swift Package Manager.
4. Set up Firebase:
   - Create a Firebase project.
   - Add an iOS app and download the `GoogleService-Info.plist` file.
   - Place `GoogleService-Info.plist` in the Xcode project under the correct target.
   - Enable Firestore, Firebase Authentication, and Firebase Storage in the Firebase console.
5. Build and run the app on a simulator or physical device.

## Usage
1. **Sign Up / Log In** - Users must authenticate to access the app.
2. **Create an Entry** - Tap the "New" button, select a location on the map then enter a title, image and description.
3. **Attach an Image** - Select an image using the built-in PhotosUI picker -it's not optinal you should at least 1 photo-.
4. **View Saved Entries** - Entries appear on the map as custom annotations.
5. **Tap on an Annotation** - View details sheet will appear as a sheet of saved entries.

## Future Improvements
- Offline support for saving entries locally.
- Enhanced search and filtering for saved locations.
- Sharing feature to allow users to share entries with friends.
- Custom hashtags for entries for a more personalized experience.


## Demo

https://github.com/user-attachments/assets/c40604f0-a2e2-417f-a599-2f056ec5abb5
