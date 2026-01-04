✨ App Features
Two-Screen Navigation: Separate interfaces for viewing the task list and entering new task details.

Detailed Task Entry: Each task captures both a Title and a Short Description.

Task Management:

Add: Create new tasks and pass data back to the home screen.

Toggle: Mark tasks as completed with a checkbox.

Delete: Remove tasks instantly using a dedicated delete button.

Persistent Storage: Powered by Hive DB to ensure your data is saved locally on the device and persists even after the app is closed.

🛠️ Tech Stack & Packages
Framework: Flutter

State Management: setState() (Basic State Management)

Database: hive & hive_flutter

Icons: Material Icons

🚀 How to Run the Project
Clone the Repository:

Bash

git clone https://github.com/atulsg88/task-tracker.git
Navigate to Project Folder:

Bash

cd task-tracker-flutter
Install Dependencies:

Bash

flutter pub get
Run the App: Ensure you have an emulator running or a physical device connected:

Bash

flutter run
🧠 What I Learned
While building this project, I gained a deeper understanding of:

Navigation & Routing: Implementing Navigator.push and Navigator.pop to move between screens while successfully passing data objects back and forth.

Managing UI State: Using setState() to trigger UI rebuilds when the underlying data in my TaskList changed.

Efficient List Rendering: Using ListView.builder instead of a standard ListView to optimize performance by only rendering items visible on the screen.

Local Databases: Setting up Hive, initializing boxes, and implementing a database class to handle the Create, Read, and Delete (CRD) operations for tasks.

Widget Structuring: Breaking down the UI into reusable components like TaskTile to maintain a clean and scalable codebase.
