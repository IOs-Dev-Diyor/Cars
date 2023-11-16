//
//  BaseFonts.swift
//  Planeta Festorum
//
//  Created by Shohzod Rajabov on 13/10/23.
//


import UIKit

extension UIFont {
public enum nameOf: String {
    case Copperplate_Light = "Copperplate-Light"
    case Copperplate = "Copperplate"
    case Copperplate_Bold = "Copperplate-Bold"
    case AppleSDGothicNeo_Thin = "AppleSDGothicNeo-Thin"
    case AppleSDGothicNeo_Light = "AppleSDGothicNeo-Light"
    case AppleSDGothicNeo_Regular = "AppleSDGothicNeo-Regular"
    case AppleSDGothicNeo_Bold = "AppleSDGothicNeo-Bold"
    case AppleSDGothicNeo_SemiBold = "AppleSDGothicNeo-SemiBold"
    case AppleSDGothicNeo_UltraLight = "AppleSDGothicNeo-UltraLight"
    case AppleSDGothicNeo_Medium = "AppleSDGothicNeo-Medium"
    case Thonburi = "Thonburi"
    case Thonburi_Light = "Thonburi-Light"
    case Thonburi_Bold = "Thonburi-Bold"
    case GillSans_Italic = "GillSans-Italic"
    case GillSans_SemiBold = "GillSans-SemiBold"
    case GillSans_UltraBold = "GillSans-UltraBold"
    case GillSans_Light = "GillSans-Light"
    case GillSans_Bold = "GillSans-Bold"
    case GillSans = "GillSans"
    case GillSans_SemiBoldItalic = "GillSans-SemiBoldItalic"
    case GillSans_BoldItalic = "GillSans-BoldItalic"
    case GillSans_LightItalic = "GillSans-LightItalic"
    case MarkerFelt_Thin = "MarkerFelt-Thin"
    case MarkerFelt_Wide = "MarkerFelt-Wide"
    case HiraMaruProN_W4 = "HiraMaruProN-W4"
    case CourierNewPS_ItalicMT = "CourierNewPS-ItalicMT"
    case CourierNewPSMT = "CourierNewPSMT"
    case CourierNewPS_BoldItalicMT = "CourierNewPS-BoldItalicMT"
    case CourierNewPS_BoldMT = "CourierNewPS-BoldMT"
    case KohinoorTelugu_Regular = "KohinoorTelugu-Regular"
    case KohinoorTelugu_Medium = "KohinoorTelugu-Medium"
    case KohinoorTelugu_Light = "KohinoorTelugu-Light"
    case AvenirNextCondensed_Heavy = "AvenirNextCondensed-Heavy"
    case AvenirNextCondensed_MediumItalic = "AvenirNextCondensed-MediumItalic"
    case AvenirNextCondensed_Regular = "AvenirNextCondensed-Regular"
    case AvenirNextCondensed_UltraLightItalic = "AvenirNextCondensed-UltraLightItalic"
    case AvenirNextCondensed_Medium = "AvenirNextCondensed-Medium"
    case AvenirNextCondensed_HeavyItalic = "AvenirNextCondensed-HeavyItalic"
    case AvenirNextCondensed_DemiBoldItalic = "AvenirNextCondensed-DemiBoldItalic"
    case AvenirNextCondensed_Bold = "AvenirNextCondensed-Bold"
    case AvenirNextCondensed_DemiBold = "AvenirNextCondensed-DemiBold"
    case AvenirNextCondensed_BoldItalic = "AvenirNextCondensed-BoldItalic"
    case AvenirNextCondensed_Italic = "AvenirNextCondensed-Italic"
    case AvenirNextCondensed_UltraLight = "AvenirNextCondensed-UltraLight"
    case TamilSangamMN = "TamilSangamMN"
    case TamilSangamMN_Bold = "TamilSangamMN-Bold"
    case HelveticaNeue_UltraLightItalic = "HelveticaNeue-UltraLightItalic"
    case HelveticaNeue_Medium = "HelveticaNeue-Medium"
    case HelveticaNeue_MediumItalic = "HelveticaNeue-MediumItalic"
    case HelveticaNeue_UltraLight = "HelveticaNeue-UltraLight"
    case HelveticaNeue_Italic = "HelveticaNeue-Italic"
    case HelveticaNeue_Light = "HelveticaNeue-Light"
    case HelveticaNeue_ThinItalic = "HelveticaNeue-ThinItalic"
    case HelveticaNeue_LightItalic = "HelveticaNeue-LightItalic"
    case HelveticaNeue_Bold = "HelveticaNeue-Bold"
    case HelveticaNeue_Thin = "HelveticaNeue-Thin"
    case HelveticaNeue_CondensedBlack = "HelveticaNeue-CondensedBlack"
    case HelveticaNeue = "HelveticaNeue"
    case HelveticaNeue_CondensedBold = "HelveticaNeue-CondensedBold"
    case HelveticaNeue_BoldItalic = "HelveticaNeue-BoldItalic"
    case TimesNewRomanPS_ItalicMT = "TimesNewRomanPS-ItalicMT"
    case TimesNewRomanPS_BoldItalicMT = "TimesNewRomanPS-BoldItalicMT"
    case TimesNewRomanPS_BoldMT = "TimesNewRomanPS-BoldMT"
    case TimesNewRomanPSMT = "TimesNewRomanPSMT"
    case Georgia_BoldItalic = "Georgia-BoldItalic"
    case Georgia_Italic = "Georgia-Italic"
    case Georgia = "Georgia"
    case Georgia_Bold = "Georgia-Bold"
    case SinhalaSangamMN_Bold = "SinhalaSangamMN-Bold"
    case SinhalaSangamMN = "SinhalaSangamMN"
    case ArialRoundedMTBold = "ArialRoundedMTBold"
    case Kailasa_Bold = "Kailasa-Bold"
    case Kailasa = "Kailasa"
    case KohinoorDevanagari_Regular = "KohinoorDevanagari-Regular"
    case KohinoorDevanagari_Light = "KohinoorDevanagari-Light"
    case KohinoorDevanagari_Semibold = "KohinoorDevanagari-Semibold"
    case KohinoorBangla_Regular = "KohinoorBangla-Regular"
    case KohinoorBangla_Semibold = "KohinoorBangla-Semibold"
    case KohinoorBangla_Light = "KohinoorBangla-Light"
    case NotoSansOriya_Bold = "NotoSansOriya-Bold"
    case NotoSansOriya = "NotoSansOriya"
    case ChalkboardSE_Bold = "ChalkboardSE-Bold"
    case ChalkboardSE_Light = "ChalkboardSE-Light"
    case ChalkboardSE_Regular = "ChalkboardSE-Regular"
    case NotoSansKannada_Bold = "NotoSansKannada-Bold"
    case NotoSansKannada_Light = "NotoSansKannada-Light"
    case NotoSansKannada_Regular = "NotoSansKannada-Regular"
    case AppleColorEmoji = "AppleColorEmoji"
    case PingFangTC_Regular = "PingFangTC-Regular"
    case PingFangTC_Thin = "PingFangTC-Thin"
    case PingFangTC_Medium = "PingFangTC-Medium"
    case PingFangTC_Semibold = "PingFangTC-Semibold"
    case PingFangTC_Light = "PingFangTC-Light"
    case PingFangTC_Ultralight = "PingFangTC-Ultralight"
    case GeezaPro_Bold = "GeezaPro-Bold"
    case GeezaPro = "GeezaPro"
    case DamascusBold = "DamascusBold"
    case DamascusLight = "DamascusLight"
    case Damascus = "Damascus"
    case DamascusMedium = "DamascusMedium"
    case DamascusSemiBold = "DamascusSemiBold"
    case Noteworthy_Bold = "Noteworthy-Bold"
    case Noteworthy_Light = "Noteworthy-Light"
    case Avenir_Oblique = "Avenir-Oblique"
    case Avenir_HeavyOblique = "Avenir-HeavyOblique"
    case Avenir_Heavy = "Avenir-Heavy"
    case Avenir_BlackOblique = "Avenir-BlackOblique"
    case Avenir_BookOblique = "Avenir-BookOblique"
    case Avenir_Roman = "Avenir-Roman"
    case Avenir_Medium = "Avenir-Medium"
    case Avenir_Black = "Avenir-Black"
    case Avenir_Light = "Avenir-Light"
    case Avenir_MediumOblique = "Avenir-MediumOblique"
    case Avenir_Book = "Avenir-Book"
    case Avenir_LightOblique = "Avenir-LightOblique"
    case KohinoorGujarati_Light = "KohinoorGujarati-Light"
    case KohinoorGujarati_Bold = "KohinoorGujarati-Bold"
    case KohinoorGujarati_Regular = "KohinoorGujarati-Regular"
    case DiwanMishafi = "DiwanMishafi"
    case AcademyEngravedLetPlain = "AcademyEngravedLetPlain"
    case PartyLetPlain = "PartyLetPlain"
    case Futura_CondensedExtraBold = "Futura-CondensedExtraBold"
    case Futura_Medium = "Futura-Medium"
    case Futura_Bold = "Futura-Bold"
    case Futura_CondensedMedium = "Futura-CondensedMedium"
    case Futura_MediumItalic = "Futura-MediumItalic"
    case ArialHebrew_Bold = "ArialHebrew-Bold"
    case ArialHebrew_Light = "ArialHebrew-Light"
    case ArialHebrew = "ArialHebrew"
    case Farah = "Farah"
    case MuktaMahee_Light = "MuktaMahee-Light"
    case MuktaMahee_Bold = "MuktaMahee-Bold"
    case MuktaMahee_Regular = "MuktaMahee-Regular"
    case NotoSansMyanmar_Regular = "NotoSansMyanmar-Regular"
    case NotoSansMyanmar_Bold = "NotoSansMyanmar-Bold"
    case NotoSansMyanmar_Light = "NotoSansMyanmar-Light"
    case Arial_BoldMT = "Arial-BoldMT"
    case Arial_BoldItalicMT = "Arial-BoldItalicMT"
    case Arial_ItalicMT = "Arial-ItalicMT"
    case ArialMT = "ArialMT"
    case Chalkduster = "Chalkduster"
    case Kefa_Regular = "Kefa-Regular"
    case HoeflerText_Italic = "HoeflerText-Italic"
    case HoeflerText_Black = "HoeflerText-Black"
    case HoeflerText_Regular = "HoeflerText-Regular"
    case HoeflerText_BlackItalic = "HoeflerText-BlackItalic"
    case Optima_ExtraBlack = "Optima-ExtraBlack"
    case Optima_BoldItalic = "Optima-BoldItalic"
    case Optima_Italic = "Optima-Italic"
    case Optima_Regular = "Optima-Regular"
    case Optima_Bold = "Optima-Bold"
    case Galvji_Bold = "Galvji-Bold"
    case Galvji = "Galvji"
    case Palatino_Italic = "Palatino-Italic"
    case Palatino_Roman = "Palatino-Roman"
    case Palatino_BoldItalic = "Palatino-BoldItalic"
    case Palatino_Bold = "Palatino-Bold"
    case MalayalamSangamMN_Bold = "MalayalamSangamMN-Bold"
    case MalayalamSangamMN = "MalayalamSangamMN"
    case AlNile = "AlNile"
    case AlNile_Bold = "AlNile-Bold"
    case LaoSangamMN = "LaoSangamMN"
    case BradleyHandITCTT_Bold = "BradleyHandITCTT-Bold"
    case HiraMinProN_W3 = "HiraMinProN-W3"
    case HiraMinProN_W6 = "HiraMinProN-W6"
    case PingFangHK_Medium = "PingFangHK-Medium"
    case PingFangHK_Thin = "PingFangHK-Thin"
    case PingFangHK_Regular = "PingFangHK-Regular"
    case PingFangHK_Ultralight = "PingFangHK-Ultralight"
    case PingFangHK_Semibold = "PingFangHK-Semibold"
    case PingFangHK_Light = "PingFangHK-Light"
    case Helvetica_Oblique = "Helvetica-Oblique"
    case Helvetica_BoldOblique = "Helvetica-BoldOblique"
    case Helvetica = "Helvetica"
    case Helvetica_Light = "Helvetica-Light"
    case Helvetica_Bold = "Helvetica-Bold"
    case Helvetica_LightOblique = "Helvetica-LightOblique"
    case Courier_BoldOblique = "Courier-BoldOblique"
    case Courier_Oblique = "Courier-Oblique"
    case Courier = "Courier"
    case Courier_Bold = "Courier-Bold"
    case Cochin_Italic = "Cochin-Italic"
    case Cochin_Bold = "Cochin-Bold"
    case Cochin = "Cochin"
    case Cochin_BoldItalic = "Cochin-BoldItalic"
    case TrebuchetMS_Bold = "TrebuchetMS-Bold"
    case TrebuchetMS_Italic = "TrebuchetMS-Italic"
    case Trebuchet_BoldItalic = "Trebuchet-BoldItalic"
    case TrebuchetMS = "TrebuchetMS"
    case DevanagariSangamMN = "DevanagariSangamMN"
    case DevanagariSangamMN_Bold = "DevanagariSangamMN-Bold"
    case Rockwell_Italic = "Rockwell-Italic"
    case Rockwell_Regular = "Rockwell-Regular"
    case Rockwell_Bold = "Rockwell-Bold"
    case Rockwell_BoldItalic = "Rockwell-BoldItalic"
    case SnellRoundhand = "SnellRoundhand"
    case SnellRoundhand_Bold = "SnellRoundhand-Bold"
    case SnellRoundhand_Black = "SnellRoundhand-Black"
    case ZapfDingbatsITC = "ZapfDingbatsITC"
    case BodoniSvtyTwoITCTT_Bold = "BodoniSvtyTwoITCTT-Bold"
    case BodoniSvtyTwoITCTT_BookIta = "BodoniSvtyTwoITCTT-BookIta"
    case BodoniSvtyTwoITCTT_Book = "BodoniSvtyTwoITCTT-Book"
    case Verdana_Italic = "Verdana-Italic"
    case Verdana = "Verdana"
    case Verdana_Bold = "Verdana-Bold"
    case Verdana_BoldItalic = "Verdana-BoldItalic"
    case AmericanTypewriter_CondensedBold = "AmericanTypewriter-CondensedBold"
    case AmericanTypewriter_Condensed = "AmericanTypewriter-Condensed"
    case AmericanTypewriter_CondensedLight = "AmericanTypewriter-CondensedLight"
    case AmericanTypewriter = "AmericanTypewriter"
    case AmericanTypewriter_Bold = "AmericanTypewriter-Bold"
    case AmericanTypewriter_Semibold = "AmericanTypewriter-Semibold"
    case AmericanTypewriter_Light = "AmericanTypewriter-Light"
    case AvenirNext_Medium = "AvenirNext-Medium"
    case AvenirNext_DemiBoldItalic = "AvenirNext-DemiBoldItalic"
    case AvenirNext_DemiBold = "AvenirNext-DemiBold"
    case AvenirNext_HeavyItalic = "AvenirNext-HeavyItalic"
    case AvenirNext_Regular = "AvenirNext-Regular"
    case AvenirNext_Italic = "AvenirNext-Italic"
    case AvenirNext_MediumItalic = "AvenirNext-MediumItalic"
    case AvenirNext_UltraLightItalic = "AvenirNext-UltraLightItalic"
    case AvenirNext_BoldItalic = "AvenirNext-BoldItalic"
    case AvenirNext_Heavy = "AvenirNext-Heavy"
    case AvenirNext_Bold = "AvenirNext-Bold"
    case AvenirNext_UltraLight = "AvenirNext-UltraLight"
    case Baskerville_SemiBoldItalic = "Baskerville-SemiBoldItalic"
    case Baskerville_SemiBold = "Baskerville-SemiBold"
    case Baskerville_BoldItalic = "Baskerville-BoldItalic"
    case Baskerville = "Baskerville"
    case Baskerville_Bold = "Baskerville-Bold"
    case Baskerville_Italic = "Baskerville-Italic"
    case KhmerSangamMN = "KhmerSangamMN"
    case Didot_Bold = "Didot-Bold"
    case Didot = "Didot"
    case Didot_Italic = "Didot-Italic"
    case SavoyeLetPlain = "SavoyeLetPlain"
    case BodoniOrnamentsITCTT = "BodoniOrnamentsITCTT"
    case Symbol = "Symbol"
    case Charter_BlackItalic = "Charter-BlackItalic"
    case Charter_Bold = "Charter-Bold"
    case Charter_Roman = "Charter-Roman"
    case Charter_Black = "Charter-Black"
    case Charter_BoldItalic = "Charter-BoldItalic"
    case Charter_Italic = "Charter-Italic"
    case Menlo_BoldItalic = "Menlo-BoldItalic"
    case Menlo_Bold = "Menlo-Bold"
    case Menlo_Italic = "Menlo-Italic"
    case Menlo_Regular = "Menlo-Regular"
    case NotoNastaliqUrdu = "NotoNastaliqUrdu"
    case NotoNastaliqUrdu_Bold = "NotoNastaliqUrdu-Bold"
    case BodoniSvtyTwoSCITCTT_Book = "BodoniSvtyTwoSCITCTT-Book"
    case DINAlternate_Bold = "DINAlternate-Bold"
    case Papyrus_Condensed = "Papyrus-Condensed"
    case Papyrus = "Papyrus"
    case HiraginoSans_W3 = "HiraginoSans-W3"
    case HiraginoSans_W6 = "HiraginoSans-W6"
    case HiraginoSans_W7 = "HiraginoSans-W7"
    case PingFangSC_Medium = "PingFangSC-Medium"
    case PingFangSC_Semibold = "PingFangSC-Semibold"
    case PingFangSC_Light = "PingFangSC-Light"
    case PingFangSC_Ultralight = "PingFangSC-Ultralight"
    case PingFangSC_Regular = "PingFangSC-Regular"
    case PingFangSC_Thin = "PingFangSC-Thin"
    case MyanmarSangamMN = "MyanmarSangamMN"
    case MyanmarSangamMN_Bold = "MyanmarSangamMN-Bold"
    case AppleSymbols = "AppleSymbols"
    case Zapfino = "Zapfino"
    case BodoniSvtyTwoOSITCTT_BookIt = "BodoniSvtyTwoOSITCTT-BookIt"
    case BodoniSvtyTwoOSITCTT_Book = "BodoniSvtyTwoOSITCTT-Book"
    case BodoniSvtyTwoOSITCTT_Bold = "BodoniSvtyTwoOSITCTT-Bold"
    case EuphemiaUCAS = "EuphemiaUCAS"
    case EuphemiaUCAS_Italic = "EuphemiaUCAS-Italic"
    case EuphemiaUCAS_Bold = "EuphemiaUCAS-Bold"
    case DINCondensed_Bold = "DINCondensed-Bold"
    }
}
    
class BFont {
    static let font1 = UIFont.systemFont(ofSize: 22, weight: .regular)
    
    static func Zapfino(_ size: CGFloat) -> UIFont{
        return UIFont(name: "Zapfino", size: size) ?? font1
    }
    static func Menlo_Bold(_ size: CGFloat) -> UIFont{
        return UIFont(name: "Menlo-Bold", size: size) ?? font1
    }
    
}
    

struct BaseFonts {
    
    static func academyEngravedLetPlain(size: CGFloat) -> UIFont {
        UIFont(name: "AcademyEngravedLetPlain", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    static func alNile(size: CGFloat) -> UIFont {
        UIFont(name: "AlNile", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    static func alNile_Bold(size: CGFloat) -> UIFont {
        UIFont(name: "AlNile-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
    static func chalkboardSE_Bold(size: CGFloat) -> UIFont {
        UIFont(name: "ChalkboardSE-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    static func americanTypewriter(size: CGFloat) -> UIFont {
        UIFont(name: "AmericanTypewriter", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func americanTypewriter_CondensedBold(size: CGFloat) -> UIFont {
        UIFont(name: "AmericanTypewriter-CondensedBold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    static func appleColorEmoji(size: CGFloat) -> UIFont {
        UIFont(name: "AppleColorEmoji", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func zapfino(size: CGFloat) -> UIFont {
        UIFont(name: "Zapfino", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func zapfDingbatsITC(size: CGFloat) -> UIFont {
        UIFont(name: "ZapfDingbatsITC", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func verdana(size: CGFloat) -> UIFont {
        UIFont(name: "Verdana", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func verdana_Bold(size: CGFloat) -> UIFont {
        UIFont(name: "Verdana-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func verdana_BoldItalic(size: CGFloat) -> UIFont {
        UIFont(name: "Verdana-BoldItalic", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func trebuchetMS(size: CGFloat) -> UIFont {
        UIFont(name: "TrebuchetMS", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func trebuchetMS_Bold(size: CGFloat) -> UIFont {
        UIFont(name: "TrebuchetMS-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func trebuchet_BoldItalic(size: CGFloat) -> UIFont {
        UIFont(name: "Trebuchet-BoldItalic", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func timesNewRomanPSMT(size: CGFloat) -> UIFont {
        UIFont(name: "TimesNewRomanPSMT", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func timesNewRomanPS_BoldMT(size: CGFloat) -> UIFont {
        UIFont(name: "TimesNewRomanPS-BoldMT", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func timesNewRomanPS_BoldItalicMT(size: CGFloat) -> UIFont {
        UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func thonburi(size: CGFloat) -> UIFont {
        UIFont(name: "Thonburi", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func thonburi_Bold(size: CGFloat) -> UIFont {
        UIFont(name: "Thonburi-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func tamilSangamMN(size: CGFloat) -> UIFont {
        UIFont(name: "TamilSangamMN", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func tamilSangamMN_Bold(size: CGFloat) -> UIFont {
        UIFont(name: "TamilSangamMN-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func snellRoundhand(size: CGFloat) -> UIFont {
        UIFont(name: "SnellRoundhand", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func snellRoundhand_Bold(size: CGFloat) -> UIFont {
        UIFont(name: "SnellRoundhand-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    static func noteworthy_Bold(size: CGFloat) -> UIFont {
        UIFont(name: "Noteworthy Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    
    
    
    
    
    
    
    
    
    static func regular(size: CGFloat) -> UIFont {
        UIFont(name: "Circe-Regular", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    static func extraBold(size: CGFloat) -> UIFont {
        UIFont(name: "Circe-ExtraBold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .semibold)
    }
    static func bold(size: CGFloat) -> UIFont {
        UIFont(name: "Circe-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
    static func light(size: CGFloat) -> UIFont {
        UIFont(name: "Circe-Light", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
    static func extraLight(size: CGFloat) -> UIFont {
        UIFont(name: "Circe-ExtraLight", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
}
