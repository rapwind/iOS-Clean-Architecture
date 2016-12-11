//
//  GetSampleResponse.swift
//  iOS Clean Architecture
//
//  Created by hayamin on 12/9/16.
//  Copyright © 2016 in.hayam. All rights reserved.
//

import Himotoki

struct GetSampleResponse {
    let sample: SampleEntity?
}

extension GetSampleResponse: Decodable {
    // MARK: Decodable
    static func decode(_ e: Extractor) throws -> GetSampleResponse {
        return GetSampleResponse(
            sample: try e <|? "sample"
        )
    }
}
