## **App architecture**

Stepper follows the Clean Architecture for Flutter application so that it enables multi-teams collaboration, generates independent layers within project structure, and makes it easy to scale when adding/removing features. Therefore Stepper can be easily maintained at any time.
</br></br></br>
![image](https://miro.medium.com/max/556/0*zUtZYiJ1bDTugOYY)
</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*Clean architecture diagram*
</br></br></br>

### Data layer
In the diagram above, the bottom data layer is responsible for handling directly with the raw data from different data sources. In Stepper case, we first used local data source (Hive) but then switch to remote data source with Firebase due to the online/offline support of this solution. Then, the raw data then will be mapped or converted into models (dart objects) using some serialization methods to serialize/deserialize data (Json, Xml, …etc) from and into.

Furthermore, data layer includes classes which implement the abstraction of the domain layer's repositories classes. Therefore, we can change or add more functionalities without touching the domain layer, that's why, we call they are loosely-coupling. The block of code below demonstrates how `PostRepositoryImpl` class implements the `savePost `function from `PostRepository` abstract class.

```dart
  @override
  Future<void> savePost(Post post) async {
    await postFirebaseService.savePost(post);
  }
```

### Domain layer
This is the coolest layer in the project's architecture, which handles only the internal entities and repository abstractions so that this layer will be completely unattached to any changes happen from other layers. Both Presentation and Data layers depending on this layer, since the data layer will implement what ever contracts written here.. and the presentation layer will use those contracts with the implementations to be used as an injected dependencies.

Abstractions from `PostRepository` class:

```dart
abstract class PostRepository {
  Future<void> savePost(Post post);

  Future<UploadTask?> uploadImage(File file);

  Future<List<Post>> getPostsByAreaName(String areaName);

  Future<Post?> getPostById(String? postId);

  Future<Post?> getDraftPostByAreaName(String areaName);

  Future<void> deletePost(String postId);

  Stream<List<Post>> watchAllPosts();
}
```

### Presentation layer
This layer includes two important pieces: Cubits and UI widgets
If there is any user interactions that require data from outside this presentation layer, a Cubit will act as a middleware to handle those interactions. Cubit is a subset of the implementation of Bloc pattern, thus simplifies the way of emitting states and updates UI accordingly. Let's look at one example of the `AuthenticationCubit`:

```dart
Future<void> registerWithEmailAndPassword(
    String emailAddress, String password) async {
  try {
    await userRepository.registerWithEmailAndPassword(
        emailAddress: emailAddress, password: password);
    await _setupUserSettings();
    emit(AuthenticatedState(
      userEmail: emailAddress,
      userName: emailAddress.split('@')[0].capitalizeFirstLetter(),
    ));
  } on AuthException catch (e) {
    emit(AuthenticationError(e.toString()));
  }
}
```

When user presses the register button, userRepository proceeds with Firebase new user registration, setup user settings, then emit `AuthenticatedState` to notify the related UI change. The reason why most of developers like using cubit/bloc is because of the code separation (event, state, cubit/bloc) and this is also plays good role of having clean code.

## **Dependency injection**

Dependency injection is an object-oriented technique which delivers the relationship of another object to an object. Using dependency injection, the creation and restriction of dependent objects can be moved outside the classes. Therefore, this concept brings a more significant level of adaptability, decoupling, and simpler testing. In Stepper, we utilize `get_it` package to instantiate objects creation when the app is initialized:

```dart
final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Features
  sl.registerLazySingleton<AreaRepository>(() => AreaRepositoryImpl(
        bandService: sl(),
        settingFirebaseService: sl(),
        postFirebaseService: sl(),
        areaFirebaseService: sl(),
      ));
  ...
}
```