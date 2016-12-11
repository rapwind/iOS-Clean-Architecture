//
//  SampleUseCase.swift
//  iOS Clean Architecture
//
//  Created by hayamin on 12/9/16.
//  Copyright © 2016 in.hayam. All rights reserved.
//

import Foundation
import RxSwift

protocol SampleUseCaseOutput: class {
    func load(viewModel: SampleViewModel)
    func error(error: Error)
}

class SampleUseCase {
    
    weak var output: SampleUseCaseOutput?
    
    lazy var sampleRepository: SampleRepository = SampleRepository()
    let disposeBag = DisposeBag()
    
    func load(_ id: String) {
        sampleRepository
            .get(id)
            .subscribe(
                onNext: { [weak self] entity in
                    let vm = SampleTranslator.generateModel(entity)
                    self?.output?.load(viewModel: vm)
            },
                onError: { [weak self] error in
                    // TODO: send error
                    self?.output?.error(error: error)
            },
                onCompleted: {
            })
            .addDisposableTo(disposeBag)
    }

}
