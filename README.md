![launch_splash_screen_debug](https://github.com/user-attachments/assets/b2a5ea76-e4bd-4a0c-94dd-0652207a22b4)# flutter_articles_app - Articles
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

On Launch App - Splash Screen 
![launch_splash_screen_debug](https://github.com/user-attachments/assets/ab0495c6-d309-4a50-b222-359e9e43b679)

Loading Screen - Shimmer effect
![landing_screen_loading_shimmers](https://github.com/user-attachments/assets/3549f5d4-0863-4fc7-a7e1-3c9a8f05395f)
![landing_screen_shimmers_debug_mode](https://github.com/user-attachments/assets/c192ae8e-1e20-4c03-ad9d-c0ea5a896947)

When all data is loaded - 
![landing_screen_loaded](https://github.com/user-attachments/assets/e31fe822-ed8e-43ae-b916-58741e1d3172)

Search functionality -
![landing_screen_search](https://github.com/user-attachments/assets/5fffd846-b9ba-4ba4-ae89-220785084e79)

User can select favourites -
![landing_screen_favourites_selected](https://github.com/user-attachments/assets/67e5cdc0-986e-413f-bdbd-69d3d72214d1)

User can view favourites in second tab -
![favourites_screen](https://github.com/user-attachments/assets/5c011150-aa53-4919-9c3c-779e46b3bc1d)

Clicking on any articles leads to detail screen -
![detail_screen](https://github.com/user-attachments/assets/09fb0748-5752-480e-9eea-210e3e17f017)

Error handling -
![error_handling](https://github.com/user-attachments/assets/43d2d4cf-8a43-4688-bd95-56d3b9fedfd3)
