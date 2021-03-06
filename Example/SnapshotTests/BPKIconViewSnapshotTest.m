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

#import <FBSnapshotTestCase/FBSnapshotTestCase.h>

#import <Backpack/Color.h>
#import <Backpack/Icon.h>

@interface BPKIconViewSnapshotTest : FBSnapshotTestCase

@end

NS_ASSUME_NONNULL_BEGIN
@implementation BPKIconViewSnapshotTest

- (void)setUp {
    [super setUp];

    self.recordMode = NO;
}

- (void)testLargeIconWithDefaultTint {
    BPKIconView *view = [[BPKIconView alloc] initWithIconName:BPKIconNameAccessibility size:BPKIconSizeLarge];

    FBSnapshotVerifyView(view, nil);
}

- (void)testLargeWithTint {
    BPKIconView *view = [[BPKIconView alloc] initWithIconName:BPKIconNameAccessibility size:BPKIconSizeLarge];
    view.tintColor = BPKColor.red500;

    FBSnapshotVerifyView(view, nil);
}

- (void)testSmallWithTint {
    BPKIconView *view = [[BPKIconView alloc] initWithIconName:BPKIconNameAccessibility size:BPKIconSizeSmall];
    view.tintColor = BPKColor.red500;

    FBSnapshotVerifyView(view, nil);
}

@end

NS_ASSUME_NONNULL_END
