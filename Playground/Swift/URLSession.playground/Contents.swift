import UIKit
import Foundation

var greeting = "Hello, playground"


let defaultSessionConfiguration = URLSessionConfiguration.default
let ephemeralSessionConfiguration = URLSessionConfiguration.ephemeral
let backgroundSessionConfiguration = URLSessionConfiguration.background(withIdentifier: "download")

URLSession.shared.dataTask(with: URL())
URLSession(configuration: defaultSessionConfiguration).dataTask(with: URL())
URLSession(configuration: defaultSessionConfiguration).downloadTask(with: URL())
URLSession(configuration: defaultSessionConfiguration).uploadTask(with: URLRequest(), fromFile: URL())
