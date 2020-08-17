# PSATest

## Introduction

This project is a technical test requested by Groupe PSA. It is not intended for third-party users or distribution.

The subject is included in the directory 'Test_iOS_EN.pdf.

The Application deals with the requested functionalities (2 part):
- one user interface application (this project).
- a component part as framework who collect information from an API.

Delivery date 17-09-20 (1 week for completion).

## Application Part

The project is an iphone mobile application that collects weather data from a city.

The interface is made with the UIKit framework and storyboards. The design is inspired by the native weather app on iOS (without their beautifull animation...).

The application is made of 3 screens (contains in Main.storyboard) :
- a screen with a list displaying city added by the user (ListViewController)
- a screen for search and add a valid city. (AddCityViewController)
- a screen for show somes details information from the API (DetailViewController).

The project use the MVVM pattern. 

A Context allows the sharing ressources.

CoreData is used for manage the application Model.

## Framework Part

The source code of the framework has its own [repository](https://github.com/luccasim/MyOpenWeather)

The framework use 2 services :
- Weather for valid a city added by the user, and retrieve the coordinates.
- OneCall for retrieve a complete information and forecast from the city.

For more informations about how this framework work, please check his README.md

**The Framework is compiled under the x86_64 architecture (for the iOS simulator)**

## Developpement

Xcode : Version 11.6 (11E708)
iOS : 13.6
Swift : 5

Framework :
- **UIKit** with storyboard
- **Foundation** Swift Standard librairy
- **CoreData** For manage the app Model.
- **OpenWeatherFramework** My own framework developped as demand by the subject.

### By Luc CASIMIR.
