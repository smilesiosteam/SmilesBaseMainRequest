//
//  File.swift
//  
//
//  Created by Abdul Rehman Amjad on 27/03/2023.
//

import Foundation

@objc public class BaseRequestAppUserInfo: NSObject, Codable {
    
    public var isLocationUpdated: Bool?
    public var latitude: String?
    public var location: String?
    public var locationId: String?
    public var longitude: String?
    public var mambaId: String?
    public var cityId : Int?
    public var nickName : String?
    public var cityName: String?
    
    
    enum CodingKeys: String, CodingKey {
        case isLocationUpdated
        case latitude
        case location
        case locationId
        case longitude
        case mambaId
        case cityId
        case nickName
        case cityName
    }
    
    public override init() {}
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isLocationUpdated = try values.decodeIfPresent(Bool.self, forKey: .isLocationUpdated)
        latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
        location = try values.decodeIfPresent(String.self, forKey: .location)
        locationId = try values.decodeIfPresent(String.self, forKey: .locationId)
        longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
        mambaId = try values.decodeIfPresent(String.self, forKey: .mambaId)
        cityId =  try values.decodeIfPresent(Int.self, forKey: .cityId)
        nickName = try values.decodeIfPresent(String.self, forKey: .nickName)
        cityName = try values.decodeIfPresent(String.self, forKey: .cityName)
    }
    
    public func asDictionary() -> [String: Any] {
        return (try? JSONSerialization.jsonObject(with: JSONEncoder().encode(self))) as? [String: Any] ?? [:]
    }
    
}
