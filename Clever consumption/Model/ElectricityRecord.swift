//
//  ElectricityRecord.swift
//  Clever consumption
//
//  Created by Samuel Mensak on 08/04/2022.
//

import Foundation
import RealmSwift

final class ElectricityRecord: Object {
    @Persisted var amount: Float
    @Persisted var units: String
    @Persisted var date: Date
}
