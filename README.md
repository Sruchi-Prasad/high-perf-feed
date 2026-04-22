# High Performance Feed App

## Overview

This is a Flutter app where I built a simple Instagram-like feed using Supabase as backend. The main focus of this project was to make the app smooth and efficient.

---

## Features

* Infinite scrolling feed (loads posts in parts)
* Pull to refresh
* Like button with instant update (optimistic UI)
* Hero animation when opening a post
* Detail screen with better image quality
* Basic error handling (like offline case)

---

## Performance Improvements

* Used `RepaintBoundary` to avoid unnecessary UI redraws
* Used `memCacheWidth` to reduce image memory usage
* Only thumbnails are shown in feed for better performance

---

## State Management

* Used Riverpod
* Managed feed data using StateNotifier

---

## Tech Used

* Flutter
* Riverpod
* Supabase

---

## Demo

(Add your screen recording link here)

---

## How to Run

```bash
flutter pub get
flutter run
```

---

## Note

This project was made as part of an assignment to understand performance optimization and smooth UI handling in Flutter.

---

## Author

Sruchi Prasad
