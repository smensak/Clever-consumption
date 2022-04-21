//
//  Tips.swift
//  Clever consumption
//
//  Created by Samuel Mensak on 08/04/2022.
//

import Foundation
import RealmSwift

final class Tips: Object {
    @Persisted var text: String
    @Persisted var category: String
}
