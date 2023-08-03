//
//  APIError.swift
//  WeatherApp
//
//  Created by Anton Godunov on 27.07.2023.
//

import Foundation


enum APIError: Error {
    case badRequest
    case invalidURL
    case notFound
    case noApiKey
    case decodingError(_ error: String)
    case noData
}
