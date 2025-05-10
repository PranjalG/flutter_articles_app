# flutter_articles_app - Articles
Flutter application with beautiful UI that fetches and displays a list of articles from a public API and displays them as a collection of cards.

## Features
- List of articles
- Search functionality
- Detail view
- Responsive UI
- Favourites Tab
  
## Setup Instructions

1. Clone the repo:
git clone 
cd flutter_article_app

3. Install dependencies:
flutter pub get

5. Run the app:
flutter run

## Tech Stack
- Flutter SDK: Flutter 3.22.2 • channel stable 
Engine • revision edd8546116
Tools • Dart 3.4.3 • DevTools 2.34.3
- State Management: HydratedCubit, which is based on Bloc.
- HTTP Client: http
- Persistence: hydrated_bloc

## State Management Explanation
The app uses Bloc/Cubit for predictable and scalable state management. 
I chose HydratedCubit to persist state locally, ensuring user preferences—like favorite articles—are retained across app restarts. 
All business logic is handled in the Cubit, with a unidirectional data flow that keeps the UI reactive and easy to maintain.

## Screenshots

<img src="https://github.com/user-attachments/assets/2aace48c-cba8-4a01-bb99-8534a1b3b19f" alt="Screenshot 1" width="300"/>

<img src="../../Downloads/Screenshot_20250510_114439.jpg" alt="Screenshot 2" width="300"/>

<img src="../../Downloads/Screenshot_20250510_121158.jpg" alt="Screenshot 3" width="300"/>

<img src="../../Downloads/Screenshot_20250509_221236.jpg" alt="Screenshot 4" width="300"/>

<img src="../../Downloads/Screenshot_20250510_121302.jpg" alt="Screenshot 5" width="300"/>

<img src="../../Downloads/Screenshot_20250510_120058.jpg" alt="Screenshot 6" width="300"/>

<img src="../../Downloads/Screenshot_20250509_221222.jpg" alt="Screenshot 7" width="300"/>

<img src="../../Downloads/Screenshot_20250510_121250.jpg" alt="Screenshot 8" width="300"/>

<img src="../../Downloads/Screenshot_20250510_121306.jpg" alt="Screenshot 9" width="300"/>

<img src="../../Downloads/Screenshot_20250510_121340.jpg" alt="Screenshot 10" width="300"/>

<img src="../../Downloads/Screenshot_20250510_103125.jpg" alt="Screenshot 11" width="300"/>


