Overview
This is a simple music player application built using UIKit and follows the MVC (Model-View-Controller) architecture.

Features
Play, Pause, and Stop music functionality.
Audio playback using AVFoundation.

Requirement
Xcode 14+ (or the latest available version)
Swift 5+
iOS 15.6+

Project Structure
📂 MusicPlayerApp
├── 📂 Model
│   ├── CategoryModel.swift
│
├── 📂 View
│   ├── Main.storyboard 
│   ├── categoryCVC.swift
    ├── ContinueCVC.swift
    ├── MusicPlaylistCVC.swift
    ├── TrendingListCVC.swift
    ├── ListCVC.swift
    ├── RecommendedCVC.swift
│
├── 📂 Controller
│   ├── ViewController.swift 
    ├── MusicPlayerVC.swift
    ├── MusicListVC.swift
│
├── 📂 Assets
│
├── 📜 Info.plist

Installation & Setup
Clone the repository:

How It Works
1. The app loads the main UI with a play, pause, and stop button.
2. When the play button is pressed, the app streams music rang-pilu.
3. The pause button pauses the playback.
4. The stop button stops the audio and resets playback. 

Technologies Used
* UIKit: For building the user interface. 
* AVFoundation: For audio playback. 
* Auto Layout: To ensure responsiveness across different devices. 
* Git: For version control and tracking changes. 
Author
* Your Name - Aditya Upadhyay 
* Email - adityaupadhyay919@gamil.com 
* GitHub - https://github.com/AdityaU1107/MusicPlayer.git
