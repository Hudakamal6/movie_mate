# Movie Mate App 🎬

A Flutter application for discovering and managing your favorite movies using The Movie Database (TMDB) API.

## Features

- **Movie Discovery**: Browse popular movies with a beautiful grid layout
- **Search Functionality**: Search for movies by name
- **Movie Details**: View detailed information about each movie
- **Favorites Management**: Add and remove movies from your favorites list
- **Offline Support**: Local storage using Hive for favorites and caching
- **Responsive Design**: Optimized for different screen sizes using Flutter ScreenUtil
- **Modern UI**: Clean, material design with smooth animations

## Screenshots

The app includes:
- Animated splash screen with the Movie Mate logo
- Home screen with movie grid and search functionality
- Movie details screen with comprehensive information
- Favorites screen to manage your saved movies
- Bottom navigation for easy access between screens

## Tech Stack

### Core Technologies
- **Flutter**: Cross-platform mobile development framework
- **Dart**: Programming language

### State Management
- **Flutter Bloc**: State management using BLoC pattern
- **Cubit**: Lightweight state management for simpler use cases

### Data & Storage
- **Hive**: Local database for offline storage
- **Dio**: HTTP client for API requests
- **Get It**: Dependency injection

### UI/UX
- **Flutter ScreenUtil**: Responsive design
- **Animated Text Kit**: Text animations
- **Shimmer**: Loading animations
- **Flutter Staggered Grid View**: Grid layout for movies

### Development Tools
- **Build Runner**: Code generation
- **Pretty Dio Logger**: API request logging
- **Flutter Lints**: Code quality

## Project Structure

```
lib/
├── core/
│   ├── app_routing/          # Navigation and routing
│   ├── constants/            # App constants and API endpoints
│   ├── di/                   # Dependency injection
│   ├── dio/                  # HTTP client configuration
│   ├── error/                # Error handling
│   ├── extensions/           # Dart extensions
│   ├── helpers/              # Helper functions and utilities
│   ├── models/               # Data models
│   ├── navBar/               # Bottom navigation
│   ├── network/              # Network status handling
│   ├── theme/                # App theming
│   └── widgets/              # Reusable widgets
├── features/
│   ├── details/              # Movie details feature
│   ├── favourites/           # Favorites management
│   ├── home/                 # Home screen and movie discovery
│   └── Splash/               # Splash screen
└── main.dart                 # App entry point
```

## Architecture

The app follows **Clean Architecture** principles with:

- **Presentation Layer**: UI components, BLoC/Cubit state management
- **Domain Layer**: Business logic, entities, use cases
- **Data Layer**: Data sources, repositories, models

## API Integration

The app integrates with [The Movie Database (TMDB) API](https://www.themoviedb.org/):

- **Base URL**: `https://api.themoviedb.org/3/`
- **Endpoints**:
  - Movie discovery: `/discover/movie`
  - Movie search: `/search/movie`
  - Movie details: `/movie/{id}`
  - Movie images: `https://image.tmdb.org/t/p/w185`

## Getting Started

### Prerequisites

- Flutter SDK (^3.5.4)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd movie_mate_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Configuration

1. **API Key**: You'll need a TMDB API key. Get one from [TMDB](https://www.themoviedb.org/settings/api)
2. **Add API Key**: Update the API key in the appropriate configuration file

## Features in Detail

### Home Screen
- Displays movies in a responsive grid layout
- Search functionality with real-time filtering
- Pull-to-refresh for updating movie list
- Pagination support for loading more movies

### Movie Details
- Comprehensive movie information
- High-quality movie posters
- Add/remove from favorites functionality
- Smooth navigation and animations

### Favorites Management
- Persistent local storage using Hive
- Offline access to favorite movies
- Easy add/remove functionality
- Visual feedback for favorite status

### Search
- Real-time search as you type
- Search results with movie posters
- Clear search functionality

## Dependencies

### Main Dependencies
- `flutter_bloc: ^8.1.3` - State management
- `hive: ^2.2.3` - Local database
- `hive_flutter: ^1.1.0` - Hive Flutter integration
- `dio: ^5.4.0` - HTTP client
- `get_it: ^7.6.6` - Dependency injection
- `flutter_screenutil: ^5.9.0` - Responsive design

### Development Dependencies
- `build_runner: ^2.3.3` - Code generation
- `hive_generator: ^2.0.1` - Hive code generation
- `flutter_lints: ^4.0.0` - Code quality

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [The Movie Database (TMDB)](https://www.themoviedb.org/) for providing the movie data API
- Flutter team for the amazing framework
- All the open-source package contributors



---
✍️ Author Huda kamal https://www.linkedin.com/in/huda-kamal-9084ab275?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app | https://github.com/Hudakamal6
Made with ❤️ using Flutter
