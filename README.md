# Hacker News reader

This app features an MVVM architecture with a Redux-like state logic implementation.

The next step will be to add an FRP framework.

Right now, the state change reaction is being implemented by handlers that are passed from the Views to the ViewModels.
However, making the view observe the ViewModel's attributes might seem like a better solution in order to further decouple both components. 
