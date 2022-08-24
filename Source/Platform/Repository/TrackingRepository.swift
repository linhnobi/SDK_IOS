//
//  TrackingRepository.swift
//  MobioSDKSwift
//
//  Created by Sun on 23/02/2022.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
protocol TrackingRepositoryType {
    func getTrackingData(event: String, properties: MobioSDK.Dictionary, type: TrackType)
}

@available(iOSApplicationExtension, unavailable)
final class TrackingRepository: ServiceBaseRepository {
    var maxRetryTime = 3
    let failAPIRepository = FailAPIRepository(manager: DBManager.shared)
}

@available(iOSApplicationExtension, unavailable)
extension TrackingRepository: TrackingRepositoryType {
    
    func getTrackingData(event: String, properties: MobioSDK.Dictionary, type: TrackType = .default) {
        let input = TrackingRequest(event: event, properties: properties, type: type.rawValue)
        let analytics = MobioSDK.shared
        if analytics.configuration.trackable == false {
            mergeTrackData(input: input)
        } else {
            api.request(input: input) { [weak self] (object: TrackingResponse?, error) in
                guard let self = self else { return }
                if error != nil {
                    self.mergeTrackData(input: input)
                }
            }
        }
    }
    
    private func mergeTrackData(input: ServiceBaseRequest) {
        let trackList = failAPIRepository.getList(by: "type == 'track'")
        if let oldFailAPI = trackList.first,
           var oldTrackDictionary = oldFailAPI.params["track"] as? MobioSDK.Dictionary,
           var oldEventDictionaryArray = oldTrackDictionary["events"] as? [MobioSDK.Dictionary],
           let newTrackDictionary = input.params["track"] as? MobioSDK.Dictionary,
           let newEventDictionaryArray = newTrackDictionary["events"] as? [MobioSDK.Dictionary] {
            oldEventDictionaryArray.append(contentsOf: newEventDictionaryArray)
            oldTrackDictionary["events"] = oldEventDictionaryArray
            oldFailAPI.params = ["track": oldTrackDictionary]
            DictionaryPrinter.printBeauty(with: oldFailAPI.params)
        }
        else {
            super.createFailApi(input: input)
        }
    }
}
