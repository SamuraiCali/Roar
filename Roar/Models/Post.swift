// swiftlint:disable all
import Amplify
import Foundation

public struct Post: Model {
  public let id: String
  public var videoURL: String?
  public var teamTag: String?
  public var sportTag: String?
  public var timestamp: Temporal.DateTime?
  public var description: String
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      videoURL: String? = nil,
      teamTag: String? = nil,
      sportTag: String? = nil,
      timestamp: Temporal.DateTime? = nil,
      description: String) {
    self.init(id: id,
      videoURL: videoURL,
      teamTag: teamTag,
      sportTag: sportTag,
      timestamp: timestamp,
      description: description,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      videoURL: String? = nil,
      teamTag: String? = nil,
      sportTag: String? = nil,
      timestamp: Temporal.DateTime? = nil,
      description: String,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.videoURL = videoURL
      self.teamTag = teamTag
      self.sportTag = sportTag
      self.timestamp = timestamp
      self.description = description
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}