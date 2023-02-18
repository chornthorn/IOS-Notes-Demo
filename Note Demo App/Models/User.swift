//
//  User.swift
//  Note Demo App
//
//  Created by thorn on 18/2/23.
//

import Foundation

// MARK: - User
struct User: Codable {
    let statusCode: Int
    let statusMessage: String
    let data: UserModelData?
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "statusCode"
        case statusMessage = "statusMessage"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        statusCode = try values.decodeIfPresent(Int.self, forKey: .statusCode) ?? 0
        statusMessage = try values.decodeIfPresent(String.self, forKey: .statusMessage) ?? ""
        data = try? values.decodeIfPresent(UserModelData.self, forKey: .data)
    }
    
}

// MARK: - DataClass
struct UserModelData: Codable {
    var id, createdAt, updatedAt, email: String
    var passwordHash, firstName, lastName: String
    var avatar, phone, verifyToken, githubID: String?
    var active: Bool

    enum CodingKeys: String, CodingKey {
        case id, createdAt, updatedAt, email, passwordHash, firstName, lastName, avatar, phone, verifyToken
        case active
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id) ?? ""
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        email = try values.decodeIfPresent(String.self, forKey: .email) ?? ""
        passwordHash = try values.decodeIfPresent(String.self, forKey: .passwordHash) ?? ""
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName) ?? ""
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName) ?? ""
        avatar = try values.decodeIfPresent(String.self, forKey: .avatar) ?? ""
        phone = try values.decodeIfPresent(String.self, forKey: .phone) ?? ""
        verifyToken = try values.decodeIfPresent(String.self, forKey: .verifyToken) ?? ""
        active = try values.decodeIfPresent(Bool.self, forKey: .active) ?? false
    }
    
}
