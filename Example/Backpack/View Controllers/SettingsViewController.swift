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

import UIKit
import Backpack

class SettingsViewController: UITableViewController {
    @IBOutlet weak var closeButton: UIBarButtonItem!
    @IBOutlet weak var enableThemeSwitch: Switch!
    var showThemeList: Bool = false
    @IBOutlet var selectableCells: [UITableViewSelectableCell]!

    override func viewDidLoad() {
        super.viewDidLoad()

        closeButton.tintColor = Color.blue500
        closeButton.target = self
        closeButton.action = #selector(SettingsViewController.btnAction)
        enableThemeSwitch.addTarget(self, action: #selector(SettingsViewController.themingToggled), for: .touchUpInside)

        let theme = ThemeSettings.activeTheme()
        applyTheme(theme: theme)
    }

    @objc func btnAction() {
        self.dismiss(animated: true, completion: nil)
    }

    @objc func themingToggled() {
        if enableThemeSwitch.isOn {
            applyTheme(theme: .london)
        } else {
            applyTheme(theme: nil)
        }
    }

    func applyTheme(theme: ThemeEnum?) {
        var themeDefinition = DefaultTheme() as BPKThemeDefinition

        showThemeList = false
        enableThemeSwitch.isOn = false
        for cell in selectableCells {
            cell.setApplied(applied: false)
        }

        if theme != nil {
            themeDefinition = ThemeHelpers.themeDefinition(forTheme: theme!)
            showThemeList = true
            ThemeSettings.setActiveTheme(theme!)

            switch theme! {
            case .london:
                selectableCells[0].setApplied(applied: true)
            case .hongKong:
                selectableCells[1].setApplied(applied: true)
            case .doha:
                selectableCells[2].setApplied(applied: true)
            case .none:
                break
            }
        }
        enableThemeSwitch.isOn = showThemeList
        guard let tcc = UIApplication.shared.keyWindow?.rootViewController as? ThemeContainerController else {
            fatalError("rootviewController should be of type ThemeContainerController")
        }
        tcc.themeContainer = Backpack.Theme.container(for: themeDefinition)
        tableView.reloadData()
    }

    // MARK: Table View

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        applyTheme(theme: ThemeEnum(rawValue: 1 + UInt(indexPath.row))!)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return showThemeList ? 2 : 1
    }

}
