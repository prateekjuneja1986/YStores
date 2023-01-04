# YStores
YStores will show the list of products and its details.

YStores is a sample iOS App developed in order to utilize the public APIs for Products and display a list of all products. 
User can view list of Products and also can view their product details . 
This app also provides the details for the product such as Product Title, Deescription,Price.

Technical Specification:
- Project is developed in Xcode 13.2.1 and Deploymemt Target is iOS 15.0 .

Use cases:
- To display list of all Products and show details once selected.

APIs integrated(Public APIs):
- https://dummyjson.com/products

Licenses and credit details:
- https://dummyjson.com/docs

Project Architectural Details:
- This application follows MVVM architecture with Protocol Oriented Programming(POP).
- APIClient/ NetworkClient is written to handle the network calls.
- Products module has different layes as per MVVM architecture.
- Image caching done using iOS native caching mechanism.
- Data binding is done using native Combine framework using property observers. 
- Module level API Service layer is also written in order to segregate the load and to introduce scope of test cases.
- Mock API service is also used to mock the success/ failure scenarios.
- Test cases are also written and executed.
- ViewModel layer test cases are done with mock responses and mock errors.
- Mock Product object is created in order to perform test scenarios.


ScreenShots:

![Simulator Screen Shot - iPhone 14 Pro - 2023-01-04 at 22 30 13](https://user-images.githubusercontent.com/64911146/210609254-f2a3ab7f-4840-4eaf-8081-84d969eb61db.png)

![Simulator Screen Shot - iPhone 14 Pro - 2023-01-04 at 22 24 23](https://user-images.githubusercontent.com/64911146/210609337-48fc66a2-d29f-4725-9d7b-a01f2709e041.png)



SwiftLint:

Note:- Due to some dependency issues on Mac, SwiftLint is not integrated. 

