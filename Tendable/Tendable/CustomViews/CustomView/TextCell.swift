//
//  TextCell.swift
//  Tendable
//
//  Created by KranTush on 12/06/24.
//

import SwiftUI

struct TextCell: View {
    
    @Binding var questions:[Question]
    var action: ((IndexModel) -> Void)
    var categoryIndex: Int = 0
    var body: some View {
        
            ForEach(Array(questions.enumerated()), id: \.element.id){ queindex, que in
                
                VStack(alignment: .leading, spacing: 20){
                    Text(que.name).font(.subheadline)
                    
                    Text("Choose Option:").font(.caption2)
                        .foregroundColor(Color.black).fontWeight(.bold)
                    //TODO custom view of answer choice
                    ForEach(Array(que.answerChoices.enumerated()), id: \.element.id){ ansindex, ans in
                        
                        HStack(alignment: .center, spacing: 8)
                        {
                            RadioButton(selected: $questions[queindex].answerChoices[ansindex].selected)
                                .onTapGesture {
                                    action(IndexModel(catIndex: categoryIndex, queIndex: queindex, ansIndex: ansindex))
                                }
                            Text(ans.name).font(.caption)
                            Spacer()
                        }
                    }
            }
        }
    }
    
}

struct RadioButton: View {
    
    @Binding var selected:Bool
    var body: some View{

        Circle()
            .fill(selectionColor)
            .padding(4)
            .overlay {
                Circle()
                    .stroke(Color.black, lineWidth: 1)
                    .frame(width: 20, height: 20)
            }.frame(width: 20, height: 20)
    }
}

extension RadioButton
{
    var selectionColor:Color{
        return selected ? Color.black : Color.clear
    }
}

//struct TextCell_Previews: PreviewProvider {
//    static var previews: some View {
//
//
//        TextCell(category: .constant([Category(id: 1, name: "", questions: [Question(answerChoices: [AnswerChoice(id: 1, name: "yes", score: 1.0)], id: 1, name: "bye", selectedAnswerChoiceID: 1)])]), action:{})
//    }
//}
