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

#import "ThemeSettings.h"
#import "ThemeHelpers.h"

@implementation ThemeSettings

+ (void)setActiveTheme:(ThemeEnum)theme {
    id<BPKThemeDefinition> themeDefinition = [ThemeHelpers themeDefinitionForTheme:theme];

    NSString *themeName = [themeDefinition themeName];

    [NSUserDefaults.standardUserDefaults setValue:themeName forKey:@"theme"];
}

+ (ThemeEnum)activeTheme {
    NSString *currentTheme = [NSUserDefaults.standardUserDefaults valueForKey:@"theme"];

    if ([currentTheme isEqual:@"London"]) {
        return london;
    } else if ([currentTheme isEqual:@"Hong Kong"]) {
        return hongKong;
    } else if ([currentTheme isEqual:@"Doha"]) {
        return doha;
    }

    return none;
}

@end
