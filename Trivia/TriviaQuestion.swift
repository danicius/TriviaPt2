//
//  TriviaQuestion.swift
//  Trivia
//
//  Created by Mari Batilando on 4/6/23.
//

import Foundation

struct TriviaQuestion: Decodable {
    let type: String
    let difficulty: String
    
  let category: String
  let question: String
  let correctAnswer: String
  let incorrectAnswers: [String]
    // Coding keys to map the JSON keys to your struct's properties
      private enum CodingKeys: String, CodingKey {
          case type
          case difficulty
          
        case category
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
      }
}
