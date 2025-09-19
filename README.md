# Travel Journal App  

This project was developed to practice **Flutter** and **Dart**, focusing on **MVVM architecture**, **Firebase integration**, and **routing/navigation**. The app allows users to track their travels to different countries, save trips, and view them with dates, ratings, and country flags.  

The project was tested on:  
- **Android**: Pixel 5 emulator with Android 16.0 "Baklava"  
- **Web**: Chrome browser  

## Features  

1. **Authentication**  
   - Users start at the **Login Page**.  
   - Users can navigate to **Register Page** to create an account.  
   - After registration, users are automatically logged in and redirected to the dashboard.  
   - Access control: Users cannot access dashboard or add-country pages unless logged in.  

2. **Dashboard**  
   - Displays all user trips in a scrollable view.  
   - Shows **country name** and **flag image** from [REST Countries API](https://restcountries.com), **visited from-to dates**, and **trip rating**.  
   - Includes **Logout Button** to sign out the current user.  
   - **Add New Country Button** navigates to Add Country page.  

3. **Add Country Page**  
   - User selects a country from a **dropdown** (countries fetched from [REST Countries API](https://restcountries.com)).  
   - Pick **from and to dates** using a **date picker**.  
   - Select **trip rating** with a **slider**.  
   - **Add Country Button** saves the trip to **Firebase Firestore** and redirects back to Dashboard.  
   - **Go Back Button** returns to Dashboard without saving.  

4. **Firebase Integration**  
   - Authentication with **Firebase Auth**.  
   - Trip data stored in **Cloud Firestore**, under each user.  
   - Real-time updates: Adding a trip instantly updates the dashboard.  

5. **Routing**  
   - Implemented with **GoRouter**.  
   - Conditional routing based on authentication status.  

6. **Responsive UI**  
   - Tested in **portrait mode** on Android and web.  
   - Uses **custom app icon** and assets (`airplane_app_icon.png`, `background_sky.jpg`, `airplane_header_image.png`).  

## Project Configuration  

- **Flutter SDK**: 3.9.2  
- **Project Name**: `uppgift4_travel_journal`  
- **Platform**: Android (emulator) & Web (Chrome)  
- **Main Dependencies**: `firebase_core`, `firebase_auth`, `cloud_firestore`, `provider`, `go_router`, `http`

## Installation Guide  

1. **Clone the repository**:  
   ```bash
   git clone  https://github.com/fridastephanie/Mobilt_java24_Frida_Hassel_Flutter_v_3.git
2. **Open in Android Studio**  
   Select Open an existing project
3. **Install dependencies**
   flutter pub get
4. **Run the project**  
   flutter run -d emulator-5554   # Android  
   flutter run -d chrome          # Chrome  

## Screenshots  

#### Android 
<img width="210" height="400" alt="image" src="https://github.com/user-attachments/assets/41032920-250d-42d5-b224-c39fec80ef4b" />
<img width="210" height="400" alt="image" src="https://github.com/user-attachments/assets/1df2d4db-8bb4-485f-bacc-037d7874576a" />
<img width="210" height="400" alt="image" src="https://github.com/user-attachments/assets/947d7a00-d98d-416b-9b61-d7608dd1e27f" />
<img width="210" height="400" alt="image" src="https://github.com/user-attachments/assets/918028db-bd03-40f7-8a1e-c27f06b3f558" />

#### Chrome
<img width="420" height="270" alt="image" src="https://github.com/user-attachments/assets/e0819454-66c3-4a22-a5bf-9f8a7cb79897" />
<img width="420" height="270" alt="image" src="https://github.com/user-attachments/assets/b30d1dbd-903e-4f05-8738-59550f52d56b" />
<img width="420" height="270" alt="image" src="https://github.com/user-attachments/assets/1ad624b6-6e20-4c73-8fe2-405941952c84" />
<img width="420" height="270" alt="image" src="https://github.com/user-attachments/assets/446814f9-27be-4467-a162-3f6a3d29dcdf" />
