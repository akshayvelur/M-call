M-call

A Google Contacts-inspired contact management app built using Flutter.

💼 Developer

Name: Akshay  Role: Flutter Developer

🔧 Technologies Used

Flutter (UI framework)

Dart (Programming language)

Material Design (for modern UI)

Firebase or SQLite (for data storage)

🚀 Overview

This mobile application is designed to mimic core functionalities of Google Contacts. Users can add, update, delete, and manage their contacts, mark favorites, and make direct calls from the app. The design follows Material Design guidelines and is responsive across screen sizes.

🔌 Features

Feature

Description

View Contacts

Displays a list of all stored contacts

Add Contact

Allows users to add a new contact with name, phone, email, etc.

Edit Contact

Update an existing contact's details

Delete Contact

Delete a contact with confirmation

Favorite Contact

Mark/unmark contacts as favorites

Favorites Tab

View only favorite contacts

Call Contact

Tap to directly call a contact from within the app

Responsive UI

Works smoothly on various device sizes

🔍 App Structure

lib/
├── controller/              # Business logic controllers
│   ├── authentication_controller.dart
│   ├── caller_controller.dart
│   └── contact_controller.dart
│
├── model/                   # Data models (currently empty)
│
├── view/                    # All UI screens
│   ├── add_contact.dart
│   ├── contact.dart
│   ├── contact_view.dart
│   ├── edit_contact.dart
│   ├── favorite.dart
│   ├── home_screen.dart
│   ├── bottom_navigation.dart
│   ├── login.dart
│   └── splash_screen.dart
│
├── main.dart           # Reusable widgets

🏛️ Home Screen

Bottom navigation bar with two tabs: Contacts and Favorites

Contacts tab shows full contact list

Favorites tab shows only favorite-marked contacts

📂 Database Integration

Option 1: Firebase Firestore

Stores contacts in collections with fields like name, number, email, favorite.


🎨 UI/UX Design

Uses Flutter's Material Design components

Smooth transitions and animations

Clean layout with intuitive navigation and bottom navigation bar

🚪 Installation

git clone https://github.com/your-username/flutter_contacts_app.git
cd flutter_contacts_app
flutter pub get
flutter run

🏒 Build APK

flutter build apk --release

Output: build/app/outputs/flutter-apk/app-release.apk

📷 Screenshots

(Add screenshots of: Home, Add Contact, Contact Profile, Edit, Favorites)

📄 Deliverables

GitHub Repo: [Your Repository URL]

APK File: app-release.apk

This Documentation (PDF/README)

Demo Video (Optional)

✅ Final Checklist



👋 Contact

GitHub: https://github.com/akshayvelurEmail: akshaypurushothaman1998@gmail.com
