# Getting started

## How Chopper works

Due to reflection being disabled in Flutter, Chopper uses code generation with the help of the [build](https://pub.dev/packages/build) and [source\_gen](https://pub.dev/packages/source_gen) packages published and maintained by the Dart Team. There are several annotations you can use to make network API call definitions a breeze.

## Installation

First, you need to add the `chopper` and `chopper_generator` packages to your project dependencies:

```yaml
# pubspec.yaml

dependencies:
  chopper: ^3.0.2

dev_dependencies:
  build_runner: ^1.0.0
  chopper_generator: ^3.0.4
```

Then run the `pub get` command in a terminal from the project's root folder or with the IDE of your choice.

## Defining your API classes

### ChopperApi

To define an API class, use the `@ChopperApi` annotation on a class that extends the `ChopperService` class provided by the library.

```dart
// FILE_NAME.dart

import "dart:async";
import 'package:chopper/chopper.dart';

// This is necessary for the generated code to find your class
part "FILE_NAME.chopper.dart";

@ChopperApi(baseUrl: "/todos")
abstract class TodosListService extends ChopperService {

  // An obligatory method that helps instantiating the service
  static TodosListService create([ChopperClient client]) =>
      _$TodosListService(client);
}
```

The `@ChopperApi` annotation takes one optional parameter, the `baseUrl`, that will prefix all the endpoints defined in the class.

### Defining request methods

To define a request method, use one of the following annotations:

- `@Get`
- `@Post`
- `@Put`
- `@Patch`
- `@Delete`

Every request method must return a `Future<Response>`.

Let's say you want to make a `GET` request on the `/todos/{id}` endpoint. You can add the following method declaration to your API class to define said request:

```dart
@Get(path: "/{id}")
Future<Response> getTodo(@Path() String id);
```

By using a replacement block (`{id}`) and the `@Path` annotation, your are telling Chopper to replace `{id}` in the URL with the value of the `id` parameter.

### Running the code generator

To generate code that implements the defined API classes, run one of the following commands in a terminal from the project's root folder:

- If you're using Dart without Flutter:
```terminal
$ pub run build_runner build  # Dart SDK
```
- If you're using Flutter:
```terminal
$ flutter pub run build_runner build  # Flutter SDK
```
- You can also make build_runner watch your project and rebuild automatically after every change:
```terminal
$ flutter pub run build_runner watch  # Flutter SDK
```

## ChopperClient

After defining API classes, you need to instantiate them by passing a `ChopperClient` to their `create` methods. The `ChopperClient` will manage the server hostname of every call made with it and can handle multiple `ChopperService` classes. It is also responsible for applying [interceptors](interceptors.md) and [converters]() to your requests.

```dart
import "dart:async";
import 'package:chopper/chopper.dart';

import 'FILE_NAME.dart';

void main() async {
  final chopper = ChopperClient(
      baseUrl: "http://my-server:8000",
      services: [
        // Pass the generated service(s)
        TodosListService.create()
      ],
    );

  // Retrieve your service from the ChopperClient...
  final todosService = chopper.getService<TodosListService>();
  // ...or create a new one, optionally with another ChopperClient if you'd like
  final todosService = TodosListService.create(chopper);

  // Call your request methods like this
  final response = await todosService.getTodosList();

  if (response.isSuccessful) {
    final body = response.body;
  } else {
    // The server responded with an error (with a code out
    final code = response.statusCode;
    final error = response.error;
  }
}

```

###





