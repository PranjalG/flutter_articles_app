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

On Launch App - Splash Screen :

<img src="https://github.com/user-attachments/assets/ab0495c6-d309-4a50-b222-359e9e43b679" alt="launch_splash_screen_debug" height="500"/>




Loading Screen - Shimmer effect :

<img src="https://github.com/user-attachments/assets/3549f5d4-0863-4fc7-a7e1-3c9a8f05395f" alt="landing_screen_loading_shimmers" height="500"/>
<img src="https://github.com/user-attachments/assets/c192ae8e-1e20-4c03-ad9d-c0ea5a896947" alt="landing_screen_shimmers_debug_mode" height="500"/>




When all data is loaded - 

<img src="https://github.com/user-attachments/assets/e31fe822-ed8e-43ae-b916-58741e1d3172" alt="landing_screen_loaded" height="500"/>




Search functionality -

<img src="https://github.com/user-attachments/assets/5fffd846-b9ba-4ba4-ae89-220785084e79" alt="landing_screen_search" height="500"/>




User can select favourites -

<img src="https://github.com/user-attachments/assets/67e5cdc0-986e-413f-bdbd-69d3d72214d1" alt="landing_screen_favourites_selected" height="500"/>




User can view favourites in second tab -

<img src="https://github.com/user-attachments/assets/5c011150-aa53-4919-9c3c-779e46b3bc1d" alt="favourites_screen" height="500"/>




Clicking on any articles leads to detail screen -

<img src="https://github.com/user-attachments/assets/09fb0748-5752-480e-9eea-210e3e17f017" alt="detail_screen" height="500"/>





Error handling -

<img src="https://github.com/user-attachments/assets/43d2d4cf-8a43-4688-bd95-56d3b9fedfd3" alt="error_handling" height="500"/>

