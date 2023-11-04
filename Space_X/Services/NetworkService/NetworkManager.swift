//
//  NetworkManager.swift
//  Space_X
//
//  Created by Ahmet Balaman on 15.08.2023.
//

import Foundation
import Moya

protocol NetworkProtocol{
    static var shared:NetworkManager { get }
    var prodiver: MoyaProvider<MoyaNetworkLayer>{ get }
    
    
    func LaunchesAPI(whichOne:String,completion: @escaping (Result<[LaunchesModel]?,Error>) ->())
    func RocketAPI(completion: @escaping (Result<[RocketModel]?,Error>) ->())
    
    
    
}

class NetworkManager: NetworkProtocol{

    
    
    public static var shared: NetworkManager = NetworkManager()
    var prodiver = MoyaProvider<MoyaNetworkLayer>()

    func LaunchesAPI(whichOne: String, completion: @escaping (Result<[LaunchesModel]?, Error>) -> ()) {
        request(target: .LaunchesAPIRequest(whichLaunches: whichOne), completion: completion)
    }
    func RocketAPI(completion: @escaping (Result<[RocketModel]?,Error>) ->()){
        request(target: .RocketAPIRequest, completion: completion)
    }
    
    
    
    
    
    
}


extension NetworkManager{
    
    func request<T:Decodable>(target: MoyaNetworkLayer, completion: @escaping (Result<T, Error>) -> ()){
        
        showOverlay()
        self.prodiver.request(target) {
           result in
            
           switch result{
           case .success(let response):
               
               do{
                   let results = try JSONDecoder().decode(T.self, from: response.data)
                   
                   completion(.success(results))
               }catch let error{
                   completion(.failure(error))
               }
               break
           case .failure(let error):
               print("error in \(target.baseURL) \(target.path)")
               print(error)
               break
           }
            hideOverlay()
            
            
       }
        
    }
    
    
    
}
