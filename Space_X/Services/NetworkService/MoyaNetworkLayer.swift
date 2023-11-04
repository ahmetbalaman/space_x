//
//  MoyaNetworkLayer.swift
//  Space_X
//
//  Created by Ahmet Balaman on 15.08.2023.
//

import Foundation
import Moya



enum MoyaNetworkLayer {
    case LaunchesAPIRequest(whichLaunches: String)
    case RocketAPIRequest


}

extension MoyaNetworkLayer: TargetType {

    var baseURL: URL {
        guard let url = URL(string: "https://api.spacexdata.com/v3/") else { fatalError() }
        return url
    }

    var path: String {
        switch self {
        case .LaunchesAPIRequest(let whichLaunches):
            return "Launches/\(whichLaunches)"
        case .RocketAPIRequest:
            return "rockets"

        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Moya.Task {
        let parameters:[String: Any] = [String: Any]()


        switch self {
        case .LaunchesAPIRequest(_):
           // let newParams = parameters.merging(["limit":30 , "offset": 0], uniquingKeysWith:  {$1} )
          //  print(newParams)
            break
        case .RocketAPIRequest:
            

            break


        }


//URLENCODİNG KISMINA İYİCE BAK
        return Task.requestParameters(parameters: parameters, encoding: URLEncoding.default)

    }

    var headers: [String: String]? {
        ["Content-type": "application/json"]
    }




}
