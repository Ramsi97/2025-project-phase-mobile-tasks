# ecommerce_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 🧱 Clean Architecture Structure

This project follows the Clean Architecture pattern with the following layers:

- **Domain Layer**: Contains `entities`, `repositories` (abstract), and `use cases`.
- **Data Layer**: Implements `models`, `repositories`, and `datasources` for local/remote data.
- **Presentation Layer**: Handles UI and state management (Bloc).
- **Core**: Shared logic, error handling, and base classes like `UseCase`.

### 📊 Data Flow

1. UI calls a **Use Case** (e.g., `ViewProductUseCase`)
2. Use Case interacts with **Repository**
3. Repository fetches data from **Data Source** (e.g., API or local storage)
4. Result is passed back up to the UI

### ✅ Testing

- Unit tests for use cases, models, and repositories
- Mockito used for mocking dependencies
- Test files follow the same folder structure as the app code
