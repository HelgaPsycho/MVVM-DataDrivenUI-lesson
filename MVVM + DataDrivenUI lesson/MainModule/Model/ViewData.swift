//
//  ViewData.swift
//  MVVM + DataDrivenUI lesson
//
//  Created by Ольга Егорова on 27.01.2023.
//

import Foundation

enum ViewData {
    case initial
    case loading(Data)
    case success(Data)
    case failure(Data)
    
    
    struct Data {
        let icon: String?
        let title: String?
        let description: String?
        let numberPhone: String?
    }
    
}
