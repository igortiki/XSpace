//
//  LoadState.swift
//  XSpace
//
//  Created by Igor Malasevschi on 9/8/26
//

enum LoadState<T> {
    case idle
    case loading
    case loaded(T)
    case failed(Error)
}
