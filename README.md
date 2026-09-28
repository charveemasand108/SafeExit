# 🛡️ SafeExit

### A personal safety and emergency assistance iOS application built with SwiftUI.

SafeExit is an iOS safety application designed to help users handle uncomfortable or potentially unsafe situations quickly and discreetly.

The application brings multiple safety tools into one simple interface, allowing users to access features such as **Fake Call, Fake Chat, Travel Mode, Trusted Contacts, Location Support, and SOS assistance**.

---

## 🚨 Why SafeExit?

In an uncomfortable or unsafe situation, users may not have enough time to navigate through multiple applications or manually contact someone.

SafeExit focuses on providing quick-access safety tools that can be triggered with minimal interaction.

### The goal is simple:

> **Give users a fast and discreet way to access safety features when they need them.**

---

## ✨ Features

### 📞 Fake Call

Simulates an incoming phone call to help users exit uncomfortable situations.

- Custom caller name
- Simulated incoming call interface
- Call timer
- Ringtone playback
- Discreet activation

---

### 💬 Fake Chat

Provides a simulated chat conversation that can appear like a real conversation.

Users can use the feature as a discreet way to create an excuse to leave an uncomfortable situation.

---

### 🚗 Travel Mode

Designed for situations where the user wants additional awareness while travelling.

Travel Mode can be used to keep important safety information accessible during a journey.

---

### 📍 Location Support

SafeExit uses Apple's location services to support safety-related functionality.

The application can work with:

- Current location
- Location-based safety features
- Map-based assistance

Location functionality is handled using Apple's **Core Location** framework.

---

### 👥 Trusted Contacts

Users can maintain a list of people they trust and may need to contact during an emergency.

The application integrates with Apple's Contacts framework to make trusted contacts easier to access.

---

### 🆘 SOS

Provides quick access to emergency assistance.

The SOS functionality is designed around reducing the number of steps required when the user needs help.

---

### 🕘 Safety History

Keeps track of relevant safety actions and activities within the application.

This provides users with a simple way to review previous safety-related interactions.

---

## 🧑‍💻 Technology Stack

| Technology | Purpose |
|------------|---------|
| **Swift** | Core programming language |
| **SwiftUI** | User interface |
| **Core Location** | Location services |
| **Contacts Framework** | Trusted contacts |
| **MapKit** | Map and location visualization |
| **AVFoundation** | Audio and ringtone playback |
| **SwiftData** | Local data persistence |
| **MVVM** | Application architecture |
| **Xcode** | Development environment |

---

## 🏗️ Architecture

SafeExit follows a modular SwiftUI architecture with separation between the user interface, application logic, and data.

```text
SafeExit
│
├── Home / Dashboard
│
├── Fake Call
│   └── FakeCallViewModel
│
├── Fake Chat
│
├── Travel Mode
│
├── Trusted Contacts
│
├── SOS
│
├── Location Services
│
├── Safety History
│
└── Profile
