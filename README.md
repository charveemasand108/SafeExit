# 🛡️ SafeExit

> Your safety toolkit, ready when you need it.

SafeExit is an iOS safety application designed to provide users with quick, discreet, and accessible safety tools when they need them. The app brings multiple safety features together in one simple interface, including simulated calls and chats, live location sharing, SOS assistance, travel mode, and trusted contacts.

---

## ✨ Features

- 📞 **Fake Call** – Schedule a simulated incoming call to create a discreet exit from an uncomfortable situation.
- 💬 **Fake Chat** – Create a simulated conversation for a discreet way to exit a situation.
- 📍 **Live Location** – View your current location on a map and share it when needed.
- 🆘 **SOS** – Access emergency actions and prepare an emergency message with location information.
- 🚶 **Travel Mode** – Start a journey with a destination and expected arrival time.
- 👥 **Trusted Contacts** – Keep important contacts easily accessible during a journey or emergency.
- 🛠️ **Safety Tools** – Access the main safety features from one centralized screen.

---

# 📱 App Flow & Screenshots

## 1. 🏠 Home Screen

The Home screen acts as the main dashboard of SafeExit.

Users can quickly access:

- Fake Call
- Fake Chat
- Live Location
- SOS
- Trusted Contacts

The screen is designed to keep essential safety features easily accessible.

<p align="center">
  <img src="home.png" width="280">
</p>

---

## 2. 📍 Live Location

The Live Location feature displays the user's current position on an interactive map.

Users can view their location and share it when needed.

<p align="center">
  <img src="map.png" width="280">
</p>

---

## 3. 📍 Location Permission

When a location-based feature is used, SafeExit requests the required location permission from the user.

The application explains why location access is needed before using the location functionality.

<p align="center">
  <img src="location-permission.png" width="280">
</p>

---

## 4. 💬 Fake Chat

Fake Chat provides a simulated conversation that can be used as a discreet way to exit an uncomfortable situation.

The conversation is simulated locally within the application.

<p align="center">
  <img src="fake%20chat.png" width="280">
</p>

---

## 5. 📞 Fake Call

Fake Call allows users to schedule a simulated incoming call.

Users can select the caller and choose a delay before the simulated call appears.

> **Note:** Fake Call is a local simulation and does not place a real phone call.

<p align="center">
  <img src="fake%20call.png" width="280">
</p>

---

## 6. 🆘 SOS

The SOS feature provides an emergency mode for situations where urgent assistance may be required.

It includes:

- Emergency activation
- Emergency message
- Location information

<p align="center">
  <img src="sos.png" width="280">
</p>

---

## 7. 🛠️ Tools

The Tools screen brings SafeExit's major safety features together in one place.

### Exit Tools

- 📞 Fake Call
- 💬 Fake Chat

### Emergency

- 🆘 SOS
- 📍 Live Location

<p align="center">
  <img src="tool.png" width="280">
</p>

---

# 🏗️ Technology Stack

- **Swift**
- **SwiftUI**
- **Core Location**
- **MapKit**
- **Contacts Framework**
- **AVFoundation**
- **SwiftData**

---

# 🍎 Apple Frameworks Used

| Framework | Purpose |
|---|---|
| **SwiftUI** | User interface and application screens |
| **CoreLocation** | Accessing the user's location |
| **MapKit** | Displaying the user's location on a map |
| **Contacts** | Managing trusted contacts |
| **AVFoundation** | Audio functionality for simulated call features |
| **SwiftData** | Local data persistence |

---

# 🔒 Privacy

SafeExit only requests location access when a location-based feature requires it.

Location information is used to provide safety-related functionality such as displaying and sharing the user's current position.

---

# 📂 Project Structure

```text
SafeExit/
│
├── SafeExit/
│   ├── Assets.xcassets
│   ├── ContactsView.swift
│   ├── FakeCallView.swift
│   ├── FakeChatView.swift
│   └── ...
│
├── README.md
├── home.png
├── map.png
├── location-permission.png
├── fake chat.png
├── fake call.png
├── sos.png
└── tool.png
