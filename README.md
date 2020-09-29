# Library Demo

Just a simple app to exercise [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) in iOS and test 2 libraries: 

- [Kingfisher](https://github.com/onevcat/Kingfisher) - For downloading and caching images from the web.
- [SwiftSoup](https://github.com/scinfu/SwiftSoup) - For HTML parsing

The app has 2 screen where the first one displays the fetched image from the web and a parsed HTML text (it will extract text from `<p>` tags and display them split into separated lines) and the second view will receive the same image URL from the first view and display the image.

**Notes:**
- There's no real HTTP request for the HTML sample. A fake gateway was used instead for the sake of simplicity.
- There's no domain layer (also for the sake of simplicity), so the presenters will talk directly to the data layer.
- There are unit tests for presentation and data layers.

## Installation

- Clone this repository.
- Run `carthage bootstrap --platform iOS` to download the libraries.
- Import the project into [Xcode]
(https://developer.apple.com/xcode/) and build it with a simulator.

## Copyright

Project developed by Márcio Souza de Oliveira.
