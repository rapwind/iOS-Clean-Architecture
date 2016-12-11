//
//  Session+Extension.swift
//  iOS Clean Architecture
//
//  Created by hayamin on 12/9/16.
//  Copyright © 2016 in.hayam. All rights reserved.
//

import APIKit
import RxSwift

extension Session {
    public static func rx_response<T: Request>(_ request: T) -> Observable<T.Response> {
        return Observable.create { observer in
            let task = send(request) { result in
                switch result {
                case .success(let response):
                    observer.onNext(response)
                    observer.onCompleted()
                case .failure(let error):
                    // TODO: Add Error Logger
                    switch error {
                    case .connectionError(let connectionError as NSError):
                        switch connectionError.code {
                        case -1001:
                            // if timeout
                            observer.onError(DataSourceError.failRequestTimeout)
                        default:
                            observer.onError(DataSourceError.failGetRequest)
                        }
                    default:
                        observer.onError(error)
                    }
                }
            }
            let t = task
            t?.resume()
            
            return Disposables.create {
                task?.cancel()
            }
        }
    }
}
