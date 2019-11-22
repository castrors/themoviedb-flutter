# themoviedb

A Flutter project that consumes The Movie Database (TMDb) https://developers.themoviedb.org/3


![screenrecording](https://github.com/castrors/themoviedb-flutter/raw/develop/screenshots/screenrecording.gif)

## Running the application

`flutter run`

## Running tests

`flutter test`

## Third-party libraries used

- Flutter Bloc
    - Implementation of bloc pattern (business logic component). That receives `events` as inputs, process the data inside the `bloc` and as result return a `state`.
- Equatable
    - Helps with objects comparisons
- Dio
    - http client to handle with the requests
- Mockito
    - Mocking framework for unit tests
