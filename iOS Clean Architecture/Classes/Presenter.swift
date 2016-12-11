//
//  Presenter.swift
//  iOS Clean Architecture
//
//  Created by hayamin on 12/9/16.
//  Copyright © 2016 in.hayam. All rights reserved.
//

import Foundation

enum SampleStatus {
    case loading
    case normal
    case error
    case timeout
}

class Presenter: SampleUseCaseOutput {
    
    weak var input: SampleViewControllerInput?
    var feedUseCase = SampleUseCase()
    
    internal func load(id: String) {
        feedUseCase.output = self
        feedUseCase.load(id)
        input?.changedStatus(.loading)
    }
    
    // MARK: SampleUseCaseOutput
    internal func load(viewModel: SampleViewModel) {
        DispatchQueue.global(qos: .default).async {
            DispatchQueue.main.async {
                self.input?.setViewModel(viewModel)
                self.input?.changedStatus(.normal)
            }
        }
    }
    
    internal func error(error: Error) {
        input?.onError(error)
        guard let error = error as? DataSourceError else {
            input?.changedStatus(.error)
            return
        }
        switch error {
        case .failRequestTimeout:
            input?.changedStatus(.timeout)
        default:
            input?.changedStatus(.error)
        }
    }
    
}
