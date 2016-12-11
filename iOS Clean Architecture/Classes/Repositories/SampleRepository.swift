//
//  SampleRepository.swift
//  iOS Clean Architecture
//
//  Created by hayamin on 12/9/16.
//  Copyright © 2016 in.hayam. All rights reserved.
//

import APIKit
import RxSwift

class SampleRepository: BaseRepository {
    
    func get(_ id: UserID) -> Observable<SampleEntity> {
        return Observable.create { observer -> Disposable in
            Session
                .rx_response(GetSampleRequest(id: id))
                .subscribe(
                    onNext: { result in
                        if let sample: SampleEntity = result.sample {
                            // TODO: Save for Realm
                            observer.onNext(sample)
                        } else {
                            observer.onError(RepositoryError.failConvert)
                        }
                },
                    onError: { error in
                        observer.onError(error)
                },
                    onCompleted: {
                        observer.onCompleted()
                })
        }
    }
    
}
