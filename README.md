# TheShoppingApp

## Brief Description About Architecture and Approach

In this project, networking and UI extension modules were separated with a modular structure. This is because of cost-effective, speed of build, testability and flexibility of use. In addition, the networking layer is an independent module. We can use this module also for MacOS platform. The app develop by focusing on MVVM + Delegate pattern. It would be useful and easy to extend it to handle errors, limit data fetching, etc. I didn't use any dependencies in my project.

## Models
The models won't store business logic. They will only act as data stores.

## Views
The `Views` (or `ViewControllers` in this case) only responsability will be displaying the data provided by its `ViewModel`, and forwarding all events to their respective `ViewModel`.

## ViewModel
The `ViewModel` is the component in charge of managing the state of each view, and any processing necesary of the data to be displayed.

# Third-party dependencies
- [Swiftlint](https://github.com/realm/SwiftLint) - A tool to enforce Swift style and conventions, loosely based on GitHub's Swift Style Guide.

