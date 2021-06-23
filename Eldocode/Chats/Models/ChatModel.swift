//
//  ChatModel.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 22.06.2021.
//

import Foundation

struct ChatModel {
    let name: String
    let image: String
    let lastMessage: String
}

struct Message {
    let toMe: Bool
    let text: String
}

var chatArray = [
    ChatModel(name: "Чат магазина", image: "eldochat", lastMessage: "Ребят, помогите продать кофемашину 😔"),
    ChatModel(name: "Виталий Пономаренко", image: "vitaly", lastMessage: "Привет, ты выполнил план продаж?"),
    ChatModel(name: "Синицын Даниил", image: "sinic", lastMessage: "Видел новые ноутбуки от Huawei у нас..."),
    ChatModel(name: "Белов Даниил", image: "belov", lastMessage: "Согласен с тобой"),
    ChatModel(name: "Анисимов Антон", image: "anton", lastMessage: "Вы: Давай, удачи"),
    ChatModel(name: "Евдокимов Кирилл", image: "kirill", lastMessage: "Вы: Клиент тебя похвалил"),
    ChatModel(name: "Елена Головач", image: "golovachLena", lastMessage: "Увидимся :)")
]

var sortedArray = chatArray

var messageArray = [
    Message(toMe: true, text: "Когда будет продана кофемашина со стока?"),
    Message(toMe: false, text: "Завтра всё сделаем, всем отделом продадим!"),
    Message(toMe: false, text: "Завтра будет пополнение горящих товаров?"),
    Message(toMe: true, text: "Да, все будет в уведомлениях"),
    Message(toMe: true, text: "Привет, ты выполнил план продаж?"),

    
    
]
