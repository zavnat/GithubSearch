//
//  Welcome.swift
//  GithubSearch
//
//  Created by admin on 30.04.2020.
//  Copyright © 2020 Natali. All rights reserved.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

// MARK: - Item
struct Item: Codable {
    let id: Int
    let nodeID, name, fullName: String
    //   let owner: Owner
    //    let itemPrivate: Bool
    //    let htmlURL: String
    //  let itemDescription: String
    //    let fork: Bool
    //    let url: String
    //    let createdAt, updatedAt, pushedAt: Date
    //    let homepage: String
    //    let size, stargazersCount, watchersCount: Int
    //    let language: String
    //    let forksCount, openIssuesCount: Int
    //    let masterBranch, defaultBranch: String
    let score: Int

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
//        case owner
//        case itemPrivate = "private"
//        case htmlURL = "html_url"
//        case itemDescription = "description"
//        case fork, url
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case pushedAt = "pushed_at"
//        case homepage, size
//        case stargazersCount = "stargazers_count"
//        case watchersCount = "watchers_count"
//        case language
//        case forksCount = "forks_count"
//        case openIssuesCount = "open_issues_count"
//        case masterBranch = "master_branch"
//        case defaultBranch = "default_branch"
        case score
    }
}

// MARK: - Owner
struct Owner: Codable {
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let url, receivedEventsURL: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case receivedEventsURL = "received_events_url"
        case type
    }
}
