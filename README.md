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


![Simulator Screen Shot - iPhone 12 - 2022-12-24 at 23 40 26](https://user-images.githubusercontent.com/64911146/209447203-6e555cf6-5fcb-41e8-a8ae-3c173c2c37eb.png)



![Simulator Screen Shot - iPhone 12 - 2022-12-24 at 23 40 33](https://user-images.githubusercontent.com/64911146/209447198-2364853b-2bca-44c1-a6d5-88e3b3b64b2c.png)


SwiftLint:

Note:- Due to some dependency issues on Mac, SwiftLint is not integrated. 

