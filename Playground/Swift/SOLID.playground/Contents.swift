import UIKit
import XCTest


/*
 What is the difference between Dependency Injection and Dependency Inversion?
 Dependency Injection is the way to do Dependency Inversion efficiently.
*/

/*
💡 How to Present This in an Interview
"In my ViewModel architecture, I follow the Open/Closed Principle by defining small, focused protocols. For example, I separate UI-related methods (ViewModelProtocol) from user data management (UserInfoProtocol). Then, I use protocol composition with a typealias to build scalable and modular ViewModels. When new features are added, like logging or analytics, I introduce new protocols and extend the ViewModel through extensions — without modifying existing code. This keeps the codebase stable, testable, and open for future growth."

✅ Final Thoughts
Your design is:
Clean
Scalable
OCP-compliant
Easy to test and extend
*/

/*
 RECAP of Your Sample
 
 ViewModel layer depending on multiple small protocols (ViewModelProtocol, UserInfoProtocol, LoginInfoProtocol)

 NetworkSessionProtocol to abstract network logic

 ViewController is injected with a ViewModelProtocol

 ViewModel is injected with a NetworkSessionProtocol


 🔍 SOLID Principles Breakdown

 ✅ 1. S — Single Responsibility Principle (SRP)
 A class should have only one reason to change.

 ViewController is only responsible for calling ViewModel logic.

 ViewModel is responsible for business/UI logic.

 NetworkSession is isolated and focused only on making network requests.

 The protocols (UserInfoProtocol, LoginInfoProtocol, etc.) keep responsibilities well-separated.

 ✅ SRP is well implemented. Each component has a single clear responsibility.
 
 

 ✅ 2. O — Open/Closed Principle (OCP)
 Open for extension, closed for modification.

 You can extend ViewModel behavior by adding new protocol conformances in extensions (e.g.,UserSettingsProtocol, AnalyticsTrackingProtocol) without changing the core ViewModel code.

 New logic can be added through extensions and protocol composition, not by editing existing logic.
 
 You could inject different types of NetworkSessionProtocol (mock/live/custom retry logic) without touching the core logic.

 ✅ OCP is implemented. Your code is easy to extend without modifying existing parts.
 
 

 ✅ 3. L — Liskov Substitution Principle (LSP)
 Subtypes must be substitutable for their base types.

 ViewController depends on ViewModelProtocol. You can pass any class conforming to that (e.g. MockViewModel, RealViewModel).
 
 NetworkSessionProtocol can be swapped with a mock or test service.

 ✅ LSP is satisfied. Substitution with conforming types won’t break functionality.
 
 
 ✅ 4. I — Interface Segregation Principle (ISP)
 No client should be forced to depend on methods it does not use.

 You split protocols: ViewModelProtocol, UserInfoProtocol, LoginInfoProtocol

 You then compose them with typealias ViewModelProtocols

 This way, a ViewModel or consumer can conform to only the protocols it needs.

 ✅ ISP is well respected. Protocols are minimal and focused.
 
 

 ✅ 5. D — Dependency Inversion Principle (DIP)
 High-level modules should not depend on low-level modules, but on abstractions.

 ViewModel depends on NetworkSessionProtocol, not directly on concrete NetworkSession.

 ViewController depends on ViewModelProtocol, not directly on concrete ViewModel.

 ✅ DIP is clearly followed. Code is loosely coupled and testable.
 

 📊 Summary Table
 Principle    Status    Notes
 SRP        ✅ Yes    Separated responsibilities across ViewModel, Network, and Controller
 OCP        ✅ Yes    Extensions and protocol composition allow scalability
 LSP        ✅ Yes    You can swap out implementations (e.g. mocks)
 ISP        ✅ Yes    Focused, granular protocol definitions
 DIP        ✅ Yes    ViewModel and ViewController rely on abstractions

 ✅ Bonus: Best Practices You're Following
 ✅ Protocol-Oriented Design — allows clean architecture and testing
 ✅ Typealias Composition — makes it easier to group behaviors without inheritance
 ✅ Dependency Injection — supports testability and separation of concerns
 ✅ Extension-Based Conformance — improves readability and modularity
 */

//SOLID principle -Open/Close - Open for extension but closed for modification
class ViewController {
    var viewModel: ViewModelProtocol
    
    init(viewModel: ViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    func viewDidload() {
        self.viewModel.fetchData()
    }
}


protocol NetworkSessionProtocol {
    func dataTask(param: [String: Any],
                  requestId: String,
                  useDefaultHeaders: Bool,
                  success: @escaping (_ responseHeader: Any?, _ serviceResponse: Any?) throws -> Void,
                  failure: @escaping (NSError?) -> Void)
}


class NetworkSession: NetworkSessionProtocol {
    func dataTask(param: [String: Any],
                  requestId: String,
                  useDefaultHeaders: Bool,
                  success: @escaping (_ responseHeader: Any?, _ serviceResponse: Any?) throws -> Void,
                  failure: @escaping (NSError?) -> Void) {
        
    }
}

protocol ViewModelProtocol {
    func fetchData()
    func loadUI()
    func updateUI()
}

protocol UserInfoProtocol {
    func saveUserInfo()
    func updateUserInfo()
    func deleteUserInfo()
}

protocol LoginInfoProtocol {
    func login()
    func logout()
}

typealias UserManagementProtocol = UserInfoProtocol & LoginInfoProtocol

typealias ViewModelProtocols = ViewModelProtocol & UserManagementProtocol

class ViewModel: ViewModelProtocols {
    
    var networkSession: NetworkSessionProtocol
    init( networkSession: NetworkSessionProtocol) {
        self.networkSession = networkSession
    }
}

// MARK: - ViewModelProtocol
extension ViewModel {
    func fetchData() {
        networkSession.dataTask(param: ["String" : "Any"], requestId: "request", useDefaultHeaders: true) { responseHeader, serviceResponse in
            
        } failure: { error in
            
        }
    }
    
    func loadUI() {
        
    }
    
    func updateUI() {
        
    }
}

// MARK: - UserDetailsProtocol
extension ViewModel {
    
    func saveUserInfo() {
        
    }
    
    func updateUserInfo() {
        
    }
    
    func deleteUserInfo() {
        
    }
}

// MARK: - LoginInfoProtocol
extension ViewModel {
    
    func login() {
        
    }
    
    func logout() {
        
    }
}


//MARK: - Mock NetworkSession
class MockNetworkSession: NetworkSessionProtocol {
    var didCallDataTask = false
    var shouldSucceed = true

    func dataTask(param: [String: Any],
                  requestId: String,
                  useDefaultHeaders: Bool,
                  success: @escaping (_ responseHeader: Any?, _ serviceResponse: Any?) throws -> Void,
                  failure: @escaping (NSError?) -> Void) {
        didCallDataTask = true

        if shouldSucceed {
            try? success(["Header": "Mock"], ["data": "MockResponse"])
        } else {
            let error = NSError(domain: "TestError", code: 999, userInfo: nil)
            failure(error)
        }
    }
}

class ViewModelTests: XCTestCase {
    
    func testFetchDataSuccess() {
        let mockNetwork = MockNetworkSession()
        mockNetwork.shouldSucceed = true
        
        let viewModel = ViewModel(networkSession: mockNetwork)
        viewModel.fetchData()
        
        XCTAssertTrue(mockNetwork.didCallDataTask, "Expected dataTask to be called on success.")
    }
    
    func testFetchDataFailure() {
        let mockNetwork = MockNetworkSession()
        mockNetwork.shouldSucceed = false
        
        let viewModel = ViewModel(networkSession: mockNetwork)
        viewModel.fetchData()
        
        XCTAssertTrue(mockNetwork.didCallDataTask, "Expected dataTask to be called on failure.")
    }
}
