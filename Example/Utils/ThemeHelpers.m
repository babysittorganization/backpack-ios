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

#import "ThemeHelpers.h"

#import <Backpack/Theme.h>

@implementation ThemeHelpers

+ (void)applyAllThemes {
    [BPKTheme applyTheme:[BPKDefaultTheme new]];
    [BPKTheme applyTheme:[BPKLondonTheme new]];
    [BPKTheme applyTheme:[BPKDohaTheme new]];
    [BPKTheme applyTheme:[BPKHongKongTheme new]];
}

+ (id<BPKThemeDefinition>)themeDefinitionForTheme:(ThemeEnum)theme {
    switch (theme) {
    case none:
        return [BPKDefaultTheme new];
        break;
    case london:
        return [BPKLondonTheme new];
        break;
    case hongKong:
        return [BPKHongKongTheme new];
        break;
    case doha:
        return [BPKDohaTheme new];
        break;
    default:
        return [BPKDefaultTheme new];
        break;
    }
}

@end
