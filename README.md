
# Connecting Life - Blood Donation Service App

**Connecting Life** is a mobile application designed to connect blood donors and recipients. The app provides a platform where users can search for blood donors, post blood requests, and directly connect with potential donors. Built using **MVVM** architecture and **Provider** for state management, the app ensures a smooth and efficient experience for users.

## Table of Contents
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Architecture](#architecture)
- [State Management](#state-management)
- [Pages and Functionality](#pages-and-functionality)
- [App Images](#app-images)
- [Setup](#setup)
- [Contributors](#contributors)
- [License](#license)

---

## Features
- **User Authentication**: Secure login and registration.
- **Search for Donors**: Locate donors based on blood group and location.
- **Post Blood Requests**: Submit a request for blood and find available donors.
- **Connect with Donors**: Directly contact a donor via the app.
- **MVVM Architecture**: For better scalability and maintainability.
- **Provider for State Management**: Efficient and responsive data handling.

---

## Technology Stack
- **Framework**: Flutter
- **Language**: Dart
- **Architecture**: Model-View-ViewModel (MVVM)
- **State Management**: Provider
- **Backend**: Firebase/REST API
- **Database**: Firebase Firestore or any preferred NoSQL database

---

## Architecture
The app follows the **MVVM (Model-View-ViewModel)** architecture pattern to ensure clean separation of UI, business logic, and data. The architecture simplifies testing, maintenance, and scalability.

### Key Components:
- **Model**: Represents the data and business logic, handling the interaction with APIs or databases.
- **View**: The UI elements (screens like Login, Register, Dashboard) that are rendered to the user.
- **ViewModel**: Acts as a bridge between the Model and View, handling data transformations and user input.

---

## State Management
We use **Provider** to manage state across the app. Provider helps in separating the business logic from UI elements and allows real-time updates as the app interacts with various services.

### Why Provider?
- **Lightweight**: Reduces overhead and complexity.
- **Reactive**: Automatically updates the UI whenever the state changes.
- **Simple and Scalable**: Easy to manage state across different screens.

---

## Pages and Functionality

1. **Login Page**
   - Users can log in using their credentials to access the app's services.
   - Includes secure authentication.
   
2. **Register Page**
   - Allows new users to sign up by providing basic information such as name, blood group, and contact details.
   
3. **Dashboard**
   - Acts as the home screen, displaying an overview of available features, including quick access to search for donors, post blood requests, and more.
   
4. **Search Donor Page**
   - Users can search for blood donors based on their location and required blood group.
   - Filters help to narrow down the search results.

5. **Post Blood Request**
   - Users can post a request specifying the blood group, quantity required, and location.
   - Requests are visible to potential donors in the area.

6. **Connect with Donor**
   - Users can connect directly with potential donors via phone or in-app messaging to arrange blood donations.
   - The app ensures secure communication between donors and recipients.

---

## App Images
Here are some screenshots of the key screens:

1. **Splash Page**  
   ![WhatsApp Image 2024-09-14 at 5 55 45 PM](https://github.com/user-attachments/assets/820b9517-286b-4f4f-b875-9e39ecf19936)


2. **Login Page**  
   ![WhatsApp Image 2024-09-14 at 5 55 45 PM (1)](https://github.com/user-attachments/assets/fbc308d0-795c-4fcd-b45a-29270a60ad75)


---

## Setup
To run the app locally, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/nagendrainvweb/connecting-life.git
   ```

2. Navigate to the project directory:
   ```bash
   cd connecting-life
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

Ensure you have your Firebase or any other backend service configured and integrated before running the app.

---

## Contributors
- **Nagendra Prajapati** - Lead Developer

---

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

You can update the image paths and other details as per your project's requirements.
