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
            }
        }
    }
    
    struct COLOR {
        
        static let PRIMARY = UIColor(red: 25.0/255.0, green: 53.0/255.0, blue: 101.0/255.0, alpha: 1.0)
        
        static let PRIMARY_LIGHT = UIColor(red: 35.0/255.0, green: 74.0/255.0, blue: 142.0/255.0, alpha: 1.0)
    }
    
    struct CONTACT {
        
        struct NUMBER {
            
            static let WORK = "tel://+62213450765"
            
            struct ALERT {
                
                static let TITLE = "Call MLMFOTO"
                static let MESSAGE = "Apakah anda yakin ingin menghubungi showroom MLMFOTO? \n(+62)21 - 3450 765"
            }
        }
    }
}
