//
//  Modifiers.swift
//  SwiftUITest
//
//  Created by d.halitov on 30.03.2024.
//



import SwiftUI


/*
 В Swift есть Condition Modifiers
 Пример в структуре: ModifiersViewCondition
 */
struct ModifiersViewCondition: View {
    
    @State private var useGreenText = false
    
    var body: some View {
        Button("Hello Kitti!") {
            self.useGreenText.toggle()
            //  простой пример условного модификатора
        } .foregroundStyle(useGreenText ? .green : .blue)
    }
}


/*
 В Swift есть возможонсть создавать кастомные вью и переиспользовать их в основном вью
 CustomText - пример создания customView
 CustomModifier - пример создания CustomModifier
 extension View - пример расширения View ()
 Пример в структуре: ModifiersViewCustom
 */
struct CustomText: View {
    var name: String
    
    var body: some View {
        Text(name)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.green)
            .backgroundStyle(.blue)
    }
}

struct CustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.red)
            .padding()
            .backgroundStyle(.white)
    }
}

extension View {
    func customM() -> some View {
        self.modifier(CustomModifier())
    }
}

struct ModifiersViewCustom: View {
    
    var body: some View {
        VStack(spacing: 30) {
            // создание кастомных views
            CustomText(name: "First")
            CustomText(name: "Second")
            // применение кастомного Modifier
            Text("Third").modifier(CustomModifier())
            Text("Four").customM()
        }
    }
}

#Preview {
//    ModifiersViewCondition()
    ModifiersViewCustom()
}
