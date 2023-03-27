//
//  File.swift
//
//
//  Created by Abdul Rehman Amjad on 21/02/2023.
//

import Foundation

@objc public class SmilesBaseMainRequestManager: NSObject {
    
    public static let shared = SmilesBaseMainRequestManager()
    public var baseMainRequestConfigs: SmilesBaseMainRequest?
    
    @objc public func setupBaseRequestConfigs(additionalInfo: [BaseMainResponseAdditionalInfo], appVersion: String?, authToken: String?, channel: String?, deviceId: String?, handsetModel: String?, imsi: String?, isGpsEnabled: Bool = false, isNotificationEnabled: Bool = false, langauge: String?, msisdn: String?, osVersion: String?, token: String?, hashId: String?, deviceHashId: String?, userInfo: BaseRequestAppUserInfo?, deviceHashIdV2: String?) {
        
        baseMainRequestConfigs = SmilesBaseMainRequest(additionalInfo: additionalInfo, appVersion: appVersion, authToken: authToken, channel: channel, deviceId: deviceId, handsetModel: handsetModel, imsi: imsi, isGpsEnabled: isGpsEnabled, isNotificationEnabled: isNotificationEnabled, langauge: langauge, msisdn: msisdn, osVersion: osVersion, token: token, hashId: hashId, deviceHashId: deviceHashId, userInfo: userInfo, deviceHashIdV2: deviceHashIdV2)
        
    }
    
    @objc public func getConfigsAsDictionary() -> [String: Any] {
        guard let configs = baseMainRequestConfigs else { return [:] }
        return (try? JSONSerialization.jsonObject(with: JSONEncoder().encode(configs))) as? [String: Any] ?? [:]
    }
    
}
