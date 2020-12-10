



import Foundation
import UIKit
// MARK: - Welcome
struct StoreAPIData: Codable {
    let status: Bool
    let data: [Datum]
    let message: String
}

// MARK: - Datum
struct Datum: Codable {
    let createdDate: String
    let courseID: Int
    let courseName, arabicName, courseDescription, arabicDescription: String
    let price: String
    let studentLimit, instituteID: Int
    let instructorName, avatarPath, avatarName: String
    let isApproved: Bool
    let institute: Institute
    let onlinecourse: Onlinecourse?
    let sectionID: JSONNull?

    enum CodingKeys: String, CodingKey {
        case createdDate
        case courseID = "courseId"
        case courseName, arabicName, courseDescription, arabicDescription, price, studentLimit
        case instituteID = "instituteId"
        case instructorName, avatarPath, avatarName, isApproved, institute, onlinecourse
        case sectionID = "sectionId"
    }
}

// MARK: - Institute
struct Institute: Codable {
    let createdDate: String
    let instituteID: Int
    let instituteName, arabicName, instituteDescription, arabicDescription: String
    let email, avatarPath, avatarName: String
    let isPremium: Bool
    let addedByID: Int
    let registrationToken, lastLogged: String
    let isActive: Bool
    let addressID, supplierID, supplierCode: Int

    enum CodingKeys: String, CodingKey {
        case createdDate
        case instituteID = "instituteId"
        case instituteName, arabicName
        case instituteDescription = "description"
        case arabicDescription, email, avatarPath, avatarName, isPremium
        case addedByID = "addedById"
        case registrationToken, lastLogged, isActive
        case addressID = "addressId"
        case supplierID = "supplierId"
        case supplierCode
    }
}

// MARK: - Onlinecourse
struct Onlinecourse: Codable {
    let createdDate: String
    let sectionID: Int
    let name, onlinecourseDescription, arabicName, arabicDescription: String
    let duration: String
    let totalContents, totalVideos, totalNotes, courseID: Int
    let classcourseID: JSONNull?

    enum CodingKeys: String, CodingKey {
        case createdDate
        case sectionID = "sectionId"
        case name
        case onlinecourseDescription = "description"
        case arabicName, arabicDescription, duration, totalContents, totalVideos, totalNotes
        case courseID = "courseId"
        case classcourseID = "classcourseId"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

