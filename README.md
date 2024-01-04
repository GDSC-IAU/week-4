App Name: Todo List

Features:

Task Management: 
 The app allows users to manage their tasks by adding, editing, and deleting them.

User Account: 
 There is a user account feature with a dedicated screen (account.dart) that includes a welcome message and an associated user widget.

Dark Mode: 
 The app supports a dark mode feature, allowing users to switch between light and dark themes for a personalized experience. The dark mode toggle is available in the settings section of the account screen.

Clean UI: 
 The app features a clean and modern user interface with Google Fonts for text styling, making it visually appealing.

Provider Pattern:
 The app uses the Provider package for state management, ensuring efficient data flow between different parts of the application.


Screens:

Task Screen (TaskScreen): 
 The main screen of the app, displaying the to-do list, a user account button, and a floating action button for adding new tasks.

Account Screen (AccountScreen):
 A dedicated screen for user account information, welcoming the user and providing settings, including the option to enable dark mode.


widgets:

User Widget (User):
 A widget representing user information, possibly including an account button.

Task List Item Widget (TaskListItem):
 A widget representing an individual task in the to-do list.


State Management:

Provider Pattern (TodoProvider and DarkModeProvider): The app utilizes the Provider pattern for efficient state management, ensuring that changes in data are reflected across the app.
Additional Notes:

The app incorporates animations, such as the animated container for task items.
The user can edit task titles by double-tapping on them.
The app includes a splash screen at the beginning, providing a visual introduction to users.