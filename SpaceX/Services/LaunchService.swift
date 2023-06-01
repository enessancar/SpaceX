//
//  LaunchService.swift
//  SpaceX
//
//  Created by Enes Sancar on 1.06.2023.
//

import Foundation

protocol LaunchServiceProtocol {
    func downloadLaunches(type: LaunchType, completion: @escaping([Launch]?) -> Void)
    func downloadLaunchDetail(id: String, completion: @escaping(Launch?) -> Void)
}

final class LaunchService: LaunchServiceProtocol {
    
    func downloadLaunches(type: LaunchType, completion: @escaping ([Launch]?) -> Void) {
        var urlString = ""
        
        switch type {
        case .upcoming:
            urlString = APIURLs.upcoming
        case .past:
            urlString = APIURLs.past
        }
        guard let url = URL(string: urlString) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let _ = self else { return }
            switch result {
            case .success(let data):
                completion(NetworkManager.shared.handleWithData(data, type: [Launch].self))
            case .failure(let error):
                NetworkManager.shared.handleWithError(error)
                completion(nil)
            }
        }
    }
    
    func downloadLaunchDetail(id: String, completion: @escaping (Launch?) -> Void) {
        guard let url = URL(string: APIURLs.launchDetail(id: id)) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let _ = self else { return }
            switch result {
            case .success(let data):
                completion(NetworkManager.shared.handleWithData(data, type: Launch.self))
            case .failure(let error):
                NetworkManager.shared.handleWithError(error)
                completion(nil)
            }
        }
    }
}
