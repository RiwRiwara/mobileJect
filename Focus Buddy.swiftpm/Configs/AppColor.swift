import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 8) & 0xff) / 255,
            blue: Double(hex & 0xff) / 255,
            opacity: alpha
        )
    }
}

enum AppColor {
    static let Darker = Color(hex: 0x101822)
    static let DarkActive = Color(hex: 0x151f2c)
    static let DarkHover = Color(hex: 0x1c293b)
    static let Dark = Color(hex: 0x23344a)
    static let Normal = Color(hex: 0x2f4562)
    static let NormalActive = Color(hex: 0x26374e)
    static let NormalHover = Color(hex: 0x2a3e58)
    static let Light = Color(hex: 0xeaecef)
    static let LightActive = Color(hex: 0xbfc5ce)
    static let LightHover = Color(hex: 0xe0e3e7)

}

