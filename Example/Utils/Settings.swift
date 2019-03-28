/*
 * Backpack - Skyscanner's Design System
 *
 * Copyright 2018-2019 Skyscanner Ltd
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Foundation

class Settings: NSObject {

    @objc class func setActiveTheme(theme: ThemeHelpers.ThemeEnum) {
        let themeDefinition = ThemeHelpers.themeDefinition(forTheme: theme)

        let themeName = themeDefinition.themeName

        UserDefaults.standard.set(themeName, forKey: "theme")
    }

    @objc class func activeTheme() -> ThemeHelpers.ThemeEnum {
        guard let currentTheme = UserDefaults.standard.value(forKey: "theme") as? String else {
            return .none
        }

        switch currentTheme {
        case "London":
            return .london
        case "Hong Kong":
            return .hongKong
        case "Doha":
            return .doha
        default:
            return .none
        }
    }
}
