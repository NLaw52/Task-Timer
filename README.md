# Task-Timer iOS App

* An iOS app that tracks time spent on tasks. Users can input their own task titles and start and stop the task-specific clock to keep track of time spent on the task.
* The app:
  * Leverages SwiftUI framework
  * Employs the MVC design pattern
  * Utilizes CoreData framework for local data storage and persistence

* Example:
  * App starts with a blank list of tasks and projects. If the user has existing items on their list, it will display here.
  <p align="center">
   <img src="https://user-images.githubusercontent.com/116110636/234710117-0c78b6a6-ba8a-4f20-9d4b-21aabee5ab9f.png" width="400">
  </p>
  
  * By clicking the "+" button the user will be prompted with a window to add a new task item.
  <p align="center">
   <img src="https://user-images.githubusercontent.com/116110636/234710445-4ba17625-1208-40b9-a6f4-a8f20fddc71a.png" width="400">
  </p>
  
  * Enter "IOS Project" as a new task title.
  <p align="center">
   <img src="https://user-images.githubusercontent.com/116110636/234710518-2391c62a-3330-4012-a9fa-6da1b60db863.png" width="400">
  </p>

  * A new cell will be added to the list of tasks and projects with corresponding time tracking information.
  <p align="center">
   <img src="https://user-images.githubusercontent.com/116110636/234710730-2f29f80c-288c-490c-b796-5f40bc412265.png" width="400">
  </p>

  * Let's add a few more tasks and projects to populate the list.
  <p align="center">
   <img src="https://user-images.githubusercontent.com/116110636/234710864-da8d4029-3aa8-4bf1-83b5-d2ae4d5ee554.png" width="400">
  </p>

  * A task's timer is enabled by clicking the play button in the corresponding cell. The cell's color will turn green and remain colorized while it's timer is running. The "Current Session" label will also appear and begin tracking the time, updating at every second.
  <p align="center">
   <img src="https://user-images.githubusercontent.com/116110636/234711481-72a52814-84b1-4078-85a9-fdbb85a320b5.png" width="400">
  </p>

  * Click the pause button to stop a task's timer. The cell will revert its color and the "Current Session" label will disappear. The time that elasped in the session is added to the "Total Time" description accumulating time over all the previous sessions.
  <p align="center">
   <img src="https://user-images.githubusercontent.com/116110636/234712262-209429dd-4a1d-4991-afe9-39a3f921a83e.png" width="400">
  </p>

  * Another task timer can be enabled without effecting any of the other tasks, keeping track of the specific task time elapsed in the session.
  <p align="center">
   <img src="https://user-images.githubusercontent.com/116110636/234712444-db5b6e33-605e-4994-84ce-69e32cd4c8c5.png" width="400">
   <img src="https://user-images.githubusercontent.com/116110636/234712514-cdbc217f-63b5-44e6-940e-4e12ad587044.png" width="400">
  </p>
  
  * A task can be deleted by swiping on the cell or clicking "Edit" in the navigation bar at the top. The screenshot below shows the effect of using a "swipe-to-delete" gesture.
  <p align="center">
   <img src="https://user-images.githubusercontent.com/116110636/234712824-ac840e15-006c-421c-a89a-cabb29ff723f.png" width="400">
   <img src="https://user-images.githubusercontent.com/116110636/234712948-cba09dc5-75e3-4266-91e8-0472ab1c65e5.png" width="400">
  </p>
