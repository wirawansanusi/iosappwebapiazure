//
//  GLOBAL_VALUES.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/5/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

struct GLOBAL_VALUES {
    
    struct API {
        
        struct VERSION {
            
            struct INDEX {
                
                static func URL() -> String {
                    
                    return "http://appmlmfoto.cloudapp.net/api"
                }
            }
        }
        
        struct CATEGORY {
            
            struct INDEX {
                
                static func URL() -> String {
                    
                    return "http://appmlmfoto.cloudapp.net/api/category"
                }
            }
        }
        
        struct POST {
            
            struct DETAIL {
                
                struct INDEX {
                
                    static func URL(categoryId: Int) -> String {
                    
                        return "http://appmlmfoto.cloudapp.net/api/category/\(categoryId)/post"
                    }
                }
            }
            
            struct THUMBNAIL {
                
                struct INDEX {
                
                    static func URL(categoryId: Int, postId: Int) -> String {
                    
                        return "http://appmlmfoto.cloudapp.net/api/category/\(categoryId)/post/\(postId)"
                    }
                }
                
                struct SHOW {
                    
                    static func URL(categoryId: Int, postId: Int, thumbnailId: Int) -> String {
                        
                        return "http://appmlmfoto.cloudapp.net/api/category/\(categoryId)/post/\(postId)/thumbnail/\(thumbnailId)"
                    }
                }
                
                struct SHOWLARGE {
                    
                    static func URL(categoryId: Int, postId: Int, thumbnailId: Int) -> String {
                        
                        return "http://appmlmfoto.cloudapp.net/api/category/\(categoryId)/post/\(postId)/thumbnail/\(thumbnailId)/large"
                    }
                }
            }
        }
    }
    
    struct COLOR {
        
        static let PRIMARY = UIColor(red: 25.0/255.0, green: 53.0/255.0, blue: 101.0/255.0, alpha: 1.0)
        
        static let PRIMARY_LIGHT = UIColor(red: 35.0/255.0, green: 74.0/255.0, blue: 142.0/255.0, alpha: 1.0)
    }
    
    struct CONTACT {
        
        struct SHOWROOM {
            
            static let URL = NSURL(string: "tel://+62213450765")!
            
            struct ALERT {
                
                static let TITLE = "Call MLMFOTO"
                static let MESSAGE = "Apakah anda yakin ingin menghubungi showroom MLMFOTO? \n(+62)21 - 3450 765"
            }
        }
        
        struct WHATSAPP {
            
            static let URL = NSURL(string: "whatsapp://send?abid=+6285780070729")
            static let TITLE = "WA: 0857 800 707 29"
            static let IMAGE = UIImage(named: "WA")!
            
            struct ALERT {
                
                static let TITLE = "Tidak dapat membuka aplikasi"
                static let MESSAGE = "Pastikan aplikasi WhatsApp sudah terinstall terlebih dahulu."
            }
        }
        
        struct BBM {
            
            static let URL = NSURL(string: "pin://2B5A2E6E")
            static let TITLE = "BBM PIN 2B 5A 2E 6E"
            static let IMAGE = UIImage(named: "BBM")!
            
            struct ALERT {
                
                static let TITLE = "Tidak dapat membuka aplikasi"
                static let MESSAGE = "Pastikan aplikasi BBM sudah terinstall terlebih dahulu."
            }
        }
        
        struct EMAIL {
            
            static let URL = NSURL(string: "mailto:Contact_us@mlmfoto.com")
            static let TITLE = "EMAIL Contact_us@mlmfoto.com"
            static let IMAGE = UIImage(named: "EMAIL")!
            
            struct ALERT {
                
                static let TITLE = "Tidak dapat membuka aplikasi"
                static let MESSAGE = "Pastikan aplikasi email sudah terinstall terlebih dahulu."
            }
        }
    }
}
