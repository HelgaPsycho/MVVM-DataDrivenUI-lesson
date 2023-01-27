//
//  MainViewModel.swift
//  MVVM + DataDrivenUI lesson
//
//  Created by Ольга Егорова on 27.01.2023.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) -> ())? { get set}
    func startFetch()
    func error()
}

final class MainViewModel: MainViewModelProtocol{
  
    
    public var updateViewData: ((ViewData) -> ())?
    
    init(){
        updateViewData?(.initial)
    }
    
    func error() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {[weak self] in
            self?.updateViewData?(.failure(ViewData.Data(icon: "x.square",
                                                         title: "error",
                                                         description: "No user",
                                                         numberPhone: nil)))
            
        }
    }
    
    public func startFetch() {
        //start loading
        updateViewData?(.loading(ViewData.Data(icon: "square.and.arrow.up.circle",
                                               title: nil,
                                               description: nil,
                                               numberPhone: nil)))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {[weak self] in
            self?.updateViewData?(.success(ViewData.Data(icon: "checkmark.square",
                                                         title: "success",
                                                         description: "OK",
                                                         numberPhone: nil)))
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 6) {[weak self] in
                self?.updateViewData?(.failure(ViewData.Data(icon: "x.square",
                                                             title: "error",
                                                             description: "No user",
                                                             numberPhone: nil)))
                
            }
        }
        
        
    }
}
