// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "2879295f9debca15e2c633ac8898d22c"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Post.self)
  }
}