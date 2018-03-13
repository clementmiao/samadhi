//
//  StatusMenuController.swift
//  Samadhi
//
//  Created by Clement Miao on 3/12/18.
//  Copyright © 2018 Clement Miao. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {
    @IBOutlet weak var statusMenu: NSMenu!

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    override func awakeFromNib() {
        let icon = NSImage(named: NSImage.Name(rawValue: "statusIcon"))
        icon?.isTemplate = true // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
    }

    @IBAction func focusClicked(_ sender: NSMenuItem) {
        DoNotDisturb.isEnabled = true
    }
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }
}
