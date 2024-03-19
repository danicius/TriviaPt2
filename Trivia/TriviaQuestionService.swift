//
//  TriviaQuestionService.swift
//  Trivia
//
//  Created by Danielle Alvarez on 3/18/24.
//

import Foundation
class TriviaQuestionService {
    func fetchTriviaQuestions(completion: @escaping ([TriviaQuestion]?) -> Void) {
        let urlString = "https://opentdb.com/api.php?amount=5&type=multiple"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                // Decode the top-level response to get to the array of questions
                let decodedResponse = try decoder.decode(TriviaQuestionsResponse.self, from: data)
                completion(decodedResponse.results)
            } catch {
                print("Decoding error: \(error)")
                completion(nil)
            }
        }.resume()
    }
}

// Reflecting the structure of the JSON response for decoding
struct TriviaQuestionsResponse: Decodable {
    let responseCode: Int
    let results: [TriviaQuestion]
    
    private enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}
