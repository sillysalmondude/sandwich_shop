# Sandwich Shop

A simple Flutter application for managing sandwich orders with customizable options.

## About

This is a learning project that demonstrates basic Flutter concepts including state management, user input handling, and widget composition. The app allows users to build a sandwich order by selecting size, bread type, quantity, and adding special instructions.

## Features

- Add and remove sandwiches from your order with quantity limits
- Choose between six-inch or footlong sizes
- Select from three bread types: white, wheat, or wholemeal
- Add custom notes to your order
- Real-time order summary display
- Input validation with disabled buttons at quantity limits

## Project Structure

The app follows a clean architecture pattern:

- `lib/views/` - UI components and styling
- `lib/repositories/` - Business logic for order management
- `test/` - Widget and unit tests

The `OrderRepository` class handles the core order logic, keeping track of quantities and enforcing constraints. The UI is built using Flutter's stateful widgets with Material Design components.

## Getting Started

Make sure you have Flutter installed on your system.

Install dependencies:
```
flutter pub get
```

Run the app:
```
flutter run
```

Run tests:
```
flutter test
```

## Usage

The interface is straightforward - use the Add and Remove buttons to adjust quantity, toggle the switch for sandwich size, pick your bread type from the dropdown, and optionally add notes in the text field. Your order summary updates in real-time as you make changes.

## Testing

The project includes comprehensive tests covering both UI interactions and business logic. Widget tests verify the counter functionality and user interactions, while repository tests ensure quantity constraints are properly enforced.