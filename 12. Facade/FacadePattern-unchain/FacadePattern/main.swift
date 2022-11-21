//
//  main.swift
//  FacadePattern
//
//  Created by 오경식 on 2022/11/21.
//

import Foundation

protocol Facade {
    func order()
}

class Operator: Facade {
    var stock = 10
    let stockManager = Stock()
    let sellManager = Sell()
    let deliveryManager = Delivery()
    let address: String

    init(address: String) {
        self.address = address
    }

    func order() {
        stock = sellManager.sellStock(product: stock)
        stockManager.checkStock(count: stock)
        deliveryManager.deliveryProduct(address: address)
    }
}

struct Stock {
    func checkStock(count: Int) {
        print("남은 재고 \(count)")
    }
}

struct Sell {
    func sellStock(product: Int) -> Int {
        print("상품을 1개 팔았습니다.")
        return product - 1
    }
}

struct Delivery {
    func deliveryProduct(address: String) {
        print("상품을 \(address)로 배송하겠습니다.")
    }
}

class Client {
    let counselor: Operator

    init(counselor: Operator) {
        self.counselor = counselor
    }
}

let customer: Client = Client(counselor: Operator(address: "서울"))

customer.counselor.order()

