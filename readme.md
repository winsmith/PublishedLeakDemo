# Possible Leak in `@Published` on macOS

This is a demo project that tries to reproduce a possible memory leak around `@Published` variables in SwiftUI macOS apps. Below is the bug report sent to Apple, the Radar number is `FB8959642`.

![An animation showing the app's memory footprint increasing](leakanimation.gif)

----

## Memory Leak in SwiftUI @Published var on macOS

Area: SwiftUI Framework
Type: Application Slow/Unresponsive

### Please describe the issue:
Using Xcode Version 12.3 (12C33) on macOS 11.1 (20C69), when I use an ObservableObject that contains a @Published variable, changing that variable results in increased memory usage that does not get released any more. 

The error occurs both when using the ObservableObject as StateObject and as EnvironmentObject. It occurs both when something external (such as a View) changes the variable, and when a member function changes the variable. The leak is also not dependent on the data being displayed in a View. 

See the attached demo project for a small example. The attached video shows the output of the attached sample project, with the memory increasing by a few hundred KBs in Xcode's memory graph with each button press.

### Please list the steps you took to reproduce the issue:
1. Create a new Xcode project, of type App, with platform either multiplatform or macOS
2. Set the interface type to SwiftUI, the lifecycle to SwiftUI App, and the language to Swift
3. Save and finish creating the project
4. Create a new file containing an instance of ObservableObject, e.g. one named DataContainer
5. Add one property to the new DataContainer, that is marked as @Published, e.g.: @Published var someBoolean: Bool = false
6. In the default ContentView, add a button that manipulates the @Published variable. In this example we change it 20 times to make the effect even more visible, e.g.:

```swift
Button("Push this button to increase memory usage!") {
    for _ in 0...20 {
        dataContainer.someBoolean.toggle()
    }
}
```

### What did you expect to happen?
Looking at Xcode's memory usage graph, the memory usage should stay roughly the same.

### What actually happened?
Looking at Xcode's memory usage graph, the memory increases by a few hundred Kilobytes each time the @Published property changes.

