# Wallpaper App
![wallpaper](https://github.com/user-attachments/assets/25fb28a9-9c30-41c4-92b4-605766e7bb99)

A modern **Wallpaper App** built with **Flutter**, featuring **BLoC** for state management. The app allows users to search for images from the **Pexels API** and set them as their **Home Screen**, **Lock Screen**, or both. The app handles API exceptions to ensure a smooth user experience.

## Features

- **Image Search**: Search for high-quality wallpapers using the built-in search functionality, powered by the **Pexels API**.
- **Wallpaper Options**: Set the wallpaper to **Home Screen**, **Lock Screen**, or **Both**.
- **State Management**:
  - **BLoC**: Used for complex state management, ensuring the app's data flow is efficient and scalable.
- **Pexels API**: Fetch wallpapers from the **Pexels API**, which provides free high-quality images.
- **API Error Handling**: Handles API exceptions and provides informative error messages to the user in case of failure.
- **Flutter UI**: A clean, responsive, and user-friendly design optimized for performance across devices.

## Technologies Used

- **Flutter** (UI framework)
- **Dart** (Programming language)
- **BLoC** (State management)
- **Pexels API** (Fetching high-quality images)
- **MVVM** (Model-View-ViewModel architecture)

## Getting Started

### Prerequisites

Ensure you have the following installed on your machine:

- Flutter SDK: [Install Flutter](https://docs.flutter.dev/get-started/install)
- Dart SDK (comes with Flutter)
- A code editor like [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/SauravPatel31/wallpaper_app.git
   ```
2. Navigate to the project directory:
   ```bash
   cd wallpaper_app
   ```
3. Fetch dependencies:
   ```bash
   flutter pub get
   ```
4. Set up your Pexels API key:
   - Go to [Pexels API](https://www.pexels.com/api/) and sign up for an API key.
   - Add your API key in the `lib/services/pexels_service.dart` file (replace the placeholder with your API key).

5. Run the app:
   ```bash
   flutter run
   ```

The application will launch on a connected device or emulator.

## Usage

- **Search for Wallpapers**: Enter keywords to search for wallpapers and explore the available images.
- **Set Wallpaper**: Choose from **Home Screen**, **Lock Screen**, or both options to set your wallpaper.
- **Error Handling**: In case of a failed API request, the app will handle the exceptions and display appropriate error messages.

## Contributing

Contributions are welcome! Follow these steps:

1. Fork the repository.
2. Create a feature branch:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add a meaningful message"
   ```
4. Push your changes:
   ```bash
   git push origin feature-name
   ```
5. Submit a pull request.

## Acknowledgements

- Thanks to the **Pexels API** for providing high-quality, free images.
- Thanks to the Flutter community and open-source libraries used in this project.

## Contact

- **Author**: Saurav Patel
- **Email**: [sauravp3103@gmail.com](mailto:sauravp3103@gmail.com)
- **GitHub**: [SauravPatel31](https://github.com/SauravPatel31)

---

Let me know if you need any further modifications!
