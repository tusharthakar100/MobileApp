//
//  Inspections.swift
//  Tendable
//
//  Created by KranTush on 10/06/24.
//

import Foundation

// MARK: - Inspections
struct Inspections: Codable {
    let inspection: Inspection
}

// MARK: - Inspection
struct Inspection: Codable {
    let area: Area
    let id: Int
    let inspectionType: InspectionType
    let survey: Survey
}

// MARK: - Area
struct Area: Codable {
    let id: Int
    let name: String
}

// MARK: - InspectionType
struct InspectionType: Codable {
    let access: String
    let id: Int
    let name: String
}

// MARK: - Survey
struct Survey: Codable {
    var categories: [Category]
    let id: Int
}

// MARK: - Category
struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    var questions: [Question]
}

// MARK: - Question
struct Question: Codable, Identifiable {
    var answerChoices: [AnswerChoice]
    let id: Int
    let name: String
    let selectedAnswerChoiceID: Int?

    enum CodingKeys: String, CodingKey {
        case answerChoices, id, name
        case selectedAnswerChoiceID = "selectedAnswerChoiceId"
    }
}

// MARK: - AnswerChoice
struct AnswerChoice: Codable, Identifiable {
    let id: Int
    let name: String
    let score: Double
    var selected: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case score, id, name
    }
}
