# GAWE APP

A simple application to get list jobs using Flutter!

Ilustration [Dribbble](https://dribbble.com/shots/15762733-GAWE-APP)

## Features

1. Get recommendation jobs
2. Find jobs based on name, location, and type

## Supported Device

- Android device with minimum API 19 **(KitKat)**

## Build App requirements

- Recommended using Flutter 2.2.1 in this [Stable channel](https://github.com/flutter/flutter.git)
- Using Dart v2.13.1

## Instructions

1. Clone from this repository
   - Copy repository url
   - Open your fav code editor _(Recommended using Android Studio)_
   - New -> Project from Version Control..
   - Paste the url, click OK
2. Run "flutter pub get" in the project directory or click the highlighted instruction in Android Studio
3. Prepare the Android Virtual Device or real device
4. Run main.dart

## Code Design & Structure

This project directory consist of 5 directories:
1. **Model**: consists models or data structure that being used in the project
   - `job`: provide the model to parse JSON job
2. **Pages**: consists page that shown to the user
   - `about_page`: provide the about/credit screen for the components and declare the basic functional
   - `detail_page`: provide the detail cases screen for the components and declare the basic functional
   - `error_page`:  provide the error screen for the components and declare the basic functional
   - `home_page`:  provide the main screen for the components and declare the basic functional
   - `search_page`:  provide the search screen for the components and declare the basic functional
   - `splash_page`:  provide the splash screen for the components and declare the basic functional
3. **Providers**: consists class to consume API
   - `jobd_provider`: provide the class to consume [Github Job API](https://jobs.github.com/api)
4. **Utils**: consists tools that support the component's function
   - `date_util`: function to substring date string
   - `inderedlist_util`: function to support bullet numbering test
5. **Widgets**: consists widgets that build the screen and do it's function
   - `bottom_button`: widget that provide custom bottom button
   - `job_card`: widget that provide card for job list
   - `recommendation_card`: widget that provide card for recommendation job
   - `search_card`:  widget that provide widget to search function

## API

API that use in this project : [Hithub Job API](https://jobs.github.com/api)

## Credit

- Pixabay
- Flaticon

## Inspiration

Dribbble [Tamer Magdy](https://dribbble.com/shots/10616495-Job-Portal-App-Concept)
