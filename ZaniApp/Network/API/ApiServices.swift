//
//  ApiServices.swift
//  ZaniApp
//
//  Created by MacBook Pro on 10/04/23.
//

import Foundation
import Alamofire

class ApiService {
  static let shared: ApiService = ApiService()
  private init() { }
  
  let BASE_URL = "https://api.escuelajs.co/api/v1"
  let SEARCH_URL: String = "https://itunes.apple.com/search"
  
  
  func signUp(user: User, completion: @escaping (Error?) -> Void) {
    let url = "\(BASE_URL)/users/"
    AF.request(url, method: .post, parameters: user)
      .validate()
      .responseDecodable(of: User.self) { response in
        switch response.result {
        case .success:
          completion(nil)
        case.failure(let error):
          completion(error)
        }
      }
  }
  
  func login(email: String, password: String, completion: @escaping( Result<AccessToken, Error>) -> Void){
    
    let url = "\(BASE_URL)/auth/login"
    AF.request(url, method: .post, parameters: ["email": email, "password": password])
      .validate()
      .responseDecodable(of: AccessToken.self) { response in
        switch response.result {
        case .success(let accessToken):
          completion(.success(accessToken))
        case .failure(let error):
          completion(.failure(error))
        }
      }
  }
  
  func getProfile(accessToken: String, completion: @escaping (Result<User, Error>) -> Void) {
    let url = "\(BASE_URL)/auth/profile"
    AF.request(url, method: .get, headers: ["Authorization": " Bearer \(accessToken)"])
      .validate()
      .responseDecodable(of: User.self) { response in
        switch response.result {
        case .success(let user):
          completion(.success(user))
        case .failure(let error):
          completion(.failure(error))
        }
      }
  }
  
  func loadYoasobiSong(completion: @escaping ([Tracks]) -> Void) {
    let parameters: [String: Any] = [
      "term": "yoasobi",
      "media": "music",
      "limit": 8
    ]
    
    AF.request(SEARCH_URL, method: .get, parameters: parameters, encoding: URLEncoding.default)
      .responseDecodable(of: TracksResponse.self) { response in
        switch response.result {
        case .success(let searchResponse):
          completion(searchResponse.results)
        case .failure(let error):
          print(error.errorDescription!)
          completion([])
        }
      }
  }
  
  func loadRadwimpsSong(completion: @escaping ([Tracks]) -> Void) {
    let parameters: [String: Any] = [
      "term": "radwimps",
      "media": "music",
      "limit": 8
    ]
    
    AF.request(SEARCH_URL, method: .get, parameters: parameters, encoding: URLEncoding.default)
      .responseDecodable(of: TracksResponse.self) { response in
        switch response.result {
        case .success(let searchResponse):
          completion(searchResponse.results)
        case .failure(let error):
          print(error.errorDescription!)
          completion([])
        }
      }
  }
  
  func loadGhibliSong(completion: @escaping ([Tracks]) -> Void) {
    let parameters: [String: Any] = [
      "term": "ghibli",
      "media": "music",
      "limit": 15
    ]
    
    AF.request(SEARCH_URL, method: .get, parameters: parameters, encoding: URLEncoding.default)
      .responseDecodable(of: TracksResponse.self) { response in
        switch response.result {
        case .success(let searchResponse):
          completion(searchResponse.results)
        case .failure(let error):
          print(error.errorDescription!)
          completion([])
        }
      }
  }
  
  
}
