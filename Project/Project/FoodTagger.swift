//
//  FoodTagger.swift
//  CookbookDemo
//
//  Created by ZhichenRen on 2022/4/22.
//

import CoreML
import Darwin

func findFoods(in recipe: String) -> [String]{
//    var input_text = "肉丝加入生抽，盐，黄酒，姜，进行腌制，大约需要30分，然后加入少许淀粉，再加入一点调和油。"
    do{
        let mlModel = try Food(configuration: MLModelConfiguration()).model
        var input_sequence = [String]()
        for ch in recipe{
            input_sequence.append(String(ch))
        }

        let input = FoodInput(text: input_sequence.joined(separator: " "))

        guard let output = try? mlModel.prediction(from: input) else {
            fatalError("Unexpected runtime error.")
        }

        let labels = FoodOutput(features: output).labels

        var words = [String]()

        var word = ""
        for idx in labels.indices {
            if labels[idx] == "FOOD-E" {
                word += input_sequence[idx]
                words.append(word)
                word = ""
            }
            else if labels[idx] == "FOOD-S" {
                word = input_sequence[idx]
                words.append(word)
                word = ""
            }
            else if labels[idx] == "FOOD-B" || labels[idx] == "FOOD-M"{
                word += input_sequence[idx]
            }
        }

        return words
    } catch {
        print("Unexpected Error\(error).")
    }
    return [String]()
}
