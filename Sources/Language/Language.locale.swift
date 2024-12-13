//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 19/06/2020.
//

import Foundation

public typealias LanguageTypealias = Language

extension Locale {
    public init(_ language: LanguageTypealias){
        switch language {
        case .english: self = .init(identifier: "US_us")
        case .dutch: self = .init(identifier: "NL_nl")
        case .spanish: self = .init(identifier: "ES_es")
        case .german: self = .init(identifier: "DE_de")
        case .french: self = .init(identifier: "FR_fr")
        case .arabic: self = .init(identifier: "ar")
        case .bengali: self = .init(identifier: "bn")
        case .chinese: self = .init(identifier: "zh")
        case .danish: self = .init(identifier: "da_DK")
        case .hindi: self = .init(identifier: "hi_IN")
        case .indonesian: self = .init(identifier: "id_ID")
        case .irish: self = .init(identifier: "ga_IE")
        case .italian: self = .init(identifier: "it_IT")
        case .japanese: self = .init(identifier: "ja_JP")
        case .javanese: self = .init(identifier: "jv")
        case .korean: self = .init(identifier: "ko_KR")
        case .polish: self = .init(identifier: "pl_PL")
        case .portuguese: self = .init(identifier: "pt_PT")
        case .romanian: self = .init(identifier: "ro_RO")
        case .russian: self = .init(identifier: "ru_RU")
        case .slovak: self = .init(identifier: "sk_SK")
        case .slovenian: self = .init(identifier: "sl_SI")
        case .swedish: self = .init(identifier: "sv_SE")
        case .turkish: self = .init(identifier: "tr_TR")
        case .abkhazian: self = .init(identifier: "ab")
        case .afar: self = .init(identifier: "aa")
        case .afrikaans: self = .init(identifier: "af_ZA")
        case .akan: self = .init(identifier: "ak")
        case .albanian: self = .init(identifier: "sq_AL")
        case .amharic: self = .init(identifier: "am_ET")
        case .aragonese: self = .init(identifier: "an")
        case .armenian: self = .init(identifier: "hy_AM")
        case .assamese: self = .init(identifier: "as")
        case .auEnglish: self = .init(identifier: "en_AU")
        case .avaric: self = .init(identifier: "av")
        case .avestan: self = .init(identifier: "ae")
        case .aymara: self = .init(identifier: "ay")
        case .azerbaijani: self = .init(identifier: "az_AZ")
        case .bambara: self = .init(identifier: "bm")
        case .bashkir: self = .init(identifier: "ba")
        case .basque: self = .init(identifier: "eu_ES")
        case .belarusian: self = .init(identifier: "be_BY")
        case .bihari: self = .init(identifier: "bh")
        case .bislama: self = .init(identifier: "bi")
        case .bosnian: self = .init(identifier: "bs_BA")
        case .breton: self = .init(identifier: "br_FR")
        case .bulgarian: self = .init(identifier: "bg_BG")
        case .burmese: self = .init(identifier: "my_MM")
        case .catalan: self = .init(identifier: "ca_ES")
        case .caEnglish: self = .init(identifier: "en_CA")
        case .chamorro: self = .init(identifier: "ch")
        case .chechen: self = .init(identifier: "ce")
        case .chuvash: self = .init(identifier: "cv")
        case .cornish: self = .init(identifier: "kw")
        case .corsican: self = .init(identifier: "co")
        case .cree: self = .init(identifier: "cr")
        case .croatian: self = .init(identifier: "hr_HR")
        case .czech: self = .init(identifier: "cs_CZ")
        case .dzongkha: self = .init(identifier: "dz")
        case .esperanto: self = .init(identifier: "eo")
        case .estonian: self = .init(identifier: "et_EE")
        case .ewe: self = .init(identifier: "ee")
        case .faroese: self = .init(identifier: "fo_FO")
        case .fijian: self = .init(identifier: "fj")
        case .finnish: self = .init(identifier: "fi_FI")
        case .galician: self = .init(identifier: "gl_ES")
        case .gaelicScottish: self = .init(identifier: "gd")
        case .georgian: self = .init(identifier: "ka_GE")
        case .greek: self = .init(identifier: "el_GR")
        case .guarani: self = .init(identifier: "gn")
        case .gujarati: self = .init(identifier: "gu_IN")
        case .haitianCreole: self = .init(identifier: "ht")
        case .hausa: self = .init(identifier: "ha")
        case .hebrew: self = .init(identifier: "he_IL")
        case .herero: self = .init(identifier: "hz")
        case .hiriMotu: self = .init(identifier: "ho")
        case .hungarian: self = .init(identifier: "hu_HU")
        case .icelandic: self = .init(identifier: "is_IS")
        case .ido: self = .init(identifier: "io")
        case .igbo: self = .init(identifier: "ig")
        case .interlingua: self = .init(identifier: "ia")
        case .interlingue: self = .init(identifier: "ie")
        case .inuktitut: self = .init(identifier: "iu")
        case .inupiak: self = .init(identifier: "ik")
        case .kannada: self = .init(identifier: "kn_IN")
        case .kanuri: self = .init(identifier: "kr")
        case .kashmiri: self = .init(identifier: "ks")
        case .kazakh: self = .init(identifier: "kk_KZ")
        case .khmer: self = .init(identifier: "km_KH")
        case .kikuyu: self = .init(identifier: "ki")
        case .kinyarwanda: self = .init(identifier: "rw_RW")
        case .kirundi: self = .init(identifier: "rn")
        case .kyrgyz: self = .init(identifier: "ky_KG")
        case .komi: self = .init(identifier: "kv")
        case .kongo: self = .init(identifier: "kg")
        case .kurdish: self = .init(identifier: "ku")
        case .kwanyama: self = .init(identifier: "kj")
        case .lao: self = .init(identifier: "lo_LA")
        case .latin: self = .init(identifier: "la")
        case .latvian: self = .init(identifier: "lv_LV")
        case .limburgish: self = .init(identifier: "li")
        case .lingala: self = .init(identifier: "ln")
        case .lithuanian: self = .init(identifier: "lt_LT")
        case .lugaKatanga: self = .init(identifier: "lu")
        case .luxembourgish: self = .init(identifier: "lb")
        case .manx: self = .init(identifier: "gv")
        case .macedonian: self = .init(identifier: "mk_MK")
        case .malagasy: self = .init(identifier: "mg")
        case .malay: self = .init(identifier: "ms_MY")
        case .malayalam: self = .init(identifier: "ml_IN")
        case .maltese: self = .init(identifier: "mt_MT")
        case .maori: self = .init(identifier: "mi")
        case .marathi: self = .init(identifier: "mr_IN")
        case .marshallese: self = .init(identifier: "mh")
        case .moldavian: self = .init(identifier: "ro_MD")
        case .mongolian: self = .init(identifier: "mn_MN")
        case .nauru: self = .init(identifier: "na")
        case .navajo: self = .init(identifier: "nv")
        case .ndonga: self = .init(identifier: "ng")
        case .northernNdebele: self = .init(identifier: "nd")
        case .nepali: self = .init(identifier: "ne_NP")
        case .norwegian: self = .init(identifier: "no_NO")
        case .norwegianBokmål: self = .init(identifier: "nb_NO")
        case .norwegianNynorsk: self = .init(identifier: "nn_NO")
        case .occitan: self = .init(identifier: "oc")
        case .ojibwe: self = .init(identifier: "oj")
        case .oriya: self = .init(identifier: "or")
        case .oromo: self = .init(identifier: "om")
        case .ossetian: self = .init(identifier: "os")
        case .pāli: self = .init(identifier: "pi")
        case .persian: self = .init(identifier: "fa_IR")
        case .punjabi: self = .init(identifier: "pa_IN")
        case .quechua: self = .init(identifier: "qu")
        case .romansh: self = .init(identifier: "rm")
        case .sami: self = .init(identifier: "se")
        case .samoan: self = .init(identifier: "sm")
        case .sango: self = .init(identifier: "sg")
        case .sanskrit: self = .init(identifier: "sa")
        case .serbian: self = .init(identifier: "sr_RS")
        case .serboCroatian: self = .init(identifier: "sh")
        case .sesotho: self = .init(identifier: "st")
        case .setswana: self = .init(identifier: "tn")
        case .shona: self = .init(identifier: "sn")
        case .sindhi: self = .init(identifier: "sd")
        case .sinhalese: self = .init(identifier: "si_LK")
        case .somali: self = .init(identifier: "so")
        case .southernNdebele: self = .init(identifier: "nr")
        case .sundanese: self = .init(identifier: "su")
        case .swahili: self = .init(identifier: "sw")
        case .swati: self = .init(identifier: "ss")
        case .tagalog: self = .init(identifier: "tl_PH")
        case .tahitian: self = .init(identifier: "ty")
        case .tajik: self = .init(identifier: "tg")
        case .tamil: self = .init(identifier: "ta_IN")
        case .tatar: self = .init(identifier: "tt")
        case .telugu: self = .init(identifier: "te_IN")
        case .thai: self = .init(identifier: "th_TH")
        case .tibetan: self = .init(identifier: "bo")
        case .tigrinya: self = .init(identifier: "ti")
        case .tonga: self = .init(identifier: "to")
        case .tsonga: self = .init(identifier: "ts")
        case .turkmen: self = .init(identifier: "tk")
        case .twi: self = .init(identifier: "tw")
        case .uyghur: self = .init(identifier: "ug")
        case .ukEnglish: self = .init(identifier: "en_GB")
        case .ukrainian: self = .init(identifier: "uk_UA")
        case .urdu: self = .init(identifier: "ur_PK")
        case .usEnglish: self = .init(identifier: "en_US")
        case .uzbek: self = .init(identifier: "uz_UZ")
        case .venda: self = .init(identifier: "ve")
        case .vietnamese: self = .init(identifier: "vi_VN")
        case .volapük: self = .init(identifier: "vo")
        case .wallon: self = .init(identifier: "wa")
        case .welsh: self = .init(identifier: "cy_GB")
        case .wolof: self = .init(identifier: "wo")
        case .westernFrisian: self = .init(identifier: "fy")
        case .xhosa: self = .init(identifier: "xh")
        case .yoruba: self = .init(identifier: "yo")
        case .zulu: self = .init(identifier: "zu")
        }
    }
}

extension LanguageTypealias {
    public var locale: Locale {
        .init(self)
    }
}

public extension Language {
    static func preferredLanguageForUser() -> Self {

        if let language = Locale.preferredLanguages.first {
            switch language {
            case "en", "en-US", "en-UK": return .english
            case "fr", "fr-FR": return .french
            case "de", "de-DE": return .german
            case "es", "es-ES": return .spanish
            case "nl-NL", "nl": return .dutch
            default: return .english
            }

        } else {
            return .english
        }
    }
}