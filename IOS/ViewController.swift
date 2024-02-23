//
//  ViewController.swift
//  IOS
//
//  Created by Ivan Sales Mendez on 9/2/24.
//

import UIKit

class ViewController: UIViewController {

    //MARK: LifeCicle
    
    override func loadView() {
        super.loadView()
        //This function is called when view is nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Here can call to api calls or setup view objects with external data∫
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //This function is called before screen appear
        //Sizes and positions of objects, dont calculated
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //This function is called before calculate sub views sizes and positions
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //This function is called after calculate sub views sizes and positions
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //This function is called after screen appear
        //Sizes and positions of objects, is calculated
    }
    
    deinit{
        
    }
    
    //MARK: Functions
    
    func defineFunctionTest(varName: Int /*Type*/) -> Int /*Returned value*/{
        
        return 0
    }
    
    @discardableResult
    func defineFunctionNoWarning(varName: Int /*Type*/) -> Int /*Returned value*/{
        
        return 0
    }
    
    //MARK: VarTypes
    
    func testVariables(){
        var a: Int = 0
        
        a += 1
        
        let b:Int = 0 //constante
        
        //left side of mutating operator isn't mutable: 'b' is a 'let' constant
        //b+=2
    }
    
    //MARK: Optionals
    
    func testOptionals(){
        var a:Int
        
        //Variable 'a' passed by reference before being initialized
        //a+=1
        
        var b:Int = 0
        
        b+=1
        
        var c:Int?
        
        //Como c puede ser null no puede ser asignada a b
        //b = c
        
        //Comprobar si es null
        if var c=c{
            b=c
        }
        
        //b no puede ser null
        //b = nill
        c = nil
        
        //Si c es null, b sera 0
        b = c ?? 0
        
        //Si c es null return
        guard var c = c else {
            return
        }
        
        b=c
        
    }
    
    //MARK: Clases y protocolos
    
    class TestObject{
        
        var a:Int
        let b:Int
        var c:Int?
        
        init(){
            a = 0
            b = 0
        }
        
        init(a: Int, b: Int, c: Int? = nil) {
            self.a = a
            self.b = b
            self.c = c
        }
        
        func addOneToAll(){
            self.a += 1
            //a +=1
            
            //self.b +=1
            
            //Solucion incorrecta
            //self.c!+=1
            
            if var c = c{
                c+=1
            }
        }
    }
    
    func testClass(){
        
        var nonOptionalClass = TestObject()
        
        //No va porque no sabe que tipo es
        //var optionalClass = nil
        var optionalClass:TestObject? = nil
        
        nonOptionalClass.addOneToAll()
        
        //Si la clase es nil no llamara a la funcion ni dara eror
        optionalClass?.addOneToAll()
        
        //No se puede porque eoptionalClass.a puede ser null
        //nonOptionalClass.a = optionalClass?.a
        
        var test: Int? = 2
        var test2: Int? = 3
        nonOptionalClass.a = optionalClass?.a ?? test ?? test2 ?? {return 5}()
        
        if let optionalClass = optionalClass{
            nonOptionalClass.a = optionalClass.a
        }
        
        if optionalClass != nil {
            var i = 0
        }
        
        guard let optionalClass = optionalClass else {
            return
        }
        
        nonOptionalClass.a=optionalClass.a
        
    }
    
}

extension ViewController.TestObject{
    //No  se pueden añadir propiedades nuevas
    //var d:Int
    
    func substractOneToAll(){
        a -= 1
        
        c = (c ?? 0) - 1
        
    }
}

extension ViewController{
    
    func testExtension(){
        var extendedObject = TestObject()
        
        extendedObject.substractOneToAll()
    }
}

protocol ReadableAsText {
    //Los protocolos (interfaces) no pueden tener variables
    //var text:String = ""
    
    //Las clases que implementen la interface deberan tener esta propiedad
    var Text: String { get }
    
    //Lo mismo con funciones
    func toText() -> String
    
}

extension ViewController.TestObject: ReadableAsText{
    var Text: String {
        return toText()
    }
    
    func toText() -> String {
        var s = ""
        
        s += "La variable A es \(a) \n"
        
        //.formatted es .ToString
        s += "La variable b es " + b.formatted() + "\n"
        
        s += "La variable c es \(c)"
        
        return s
    }
    
}

extension ViewController {
    
    func testProtocol(){
        var extendedObject = TestObject()
        
        var aString = extendedObject.Text
        var bString = extendedObject.toText()
    }
}

//MARK: Iterations

extension ViewController {
    
    func testIterations(){
    
        var list:[Int] = []
        
        list.append(0)
        list.append(1)
        list.append(2)
        list.append(3)
        
        list.forEach { item in
            print(item)
            debugPrint(item)
        }
        
        print(list)
        debugPrint(list)
        
        for item in list{
            print(item)
        }
        
        for i in 0...list.count {
            print(list[i])
        }
        
        //Crea lista de 0 a 100
        var otherList = [Int](0...100)
        
        for number in otherList where number % 2 == 0{
            print(number)
        }
        
        var objectClass: [TestObject] = []
        objectClass.append(TestObject(a: 1, b: 1, c: 1))
        objectClass.append(TestObject(a: 2, b: 2, c: nil))
        objectClass.append(TestObject(a: 3, b: 3, c: 3))
        objectClass.append(TestObject(a: 4, b: 4, c: nil))
        objectClass.append(TestObject(a: 5, b: 5, c: 5))
        
        for item in objectClass where item.c != nil {
            print(item.c)
        }
        
        var i = 0
        
        while(i < 5){
            i += 1
        }
    }
    
}

//MARK: Enums

enum DayOfWeek{
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

extension ViewController{
    
    func testEnumDayOfWeek() {
        
        //let day = DayOfWeek.friday
        let day: DayOfWeek = .friday
        
        switch(day){
        case .monday:
            break
        case .tuesday:
            break
        case .wednesday:
            break
        case .thursday:
            break
        case .friday:
            break
        case .saturday:
            break
        case .sunday:
            break
        }
        
        switch(day){
        case .monday, .tuesday, .wednesday, .thursday, .friday:
            print("Se curra")
            break
        case .saturday, .sunday:
            print("No se curra")
            break
        }
        
    }
}

extension DayOfWeek: CaseIterable{
    
    var TranslatedText: String {
        get {
            switch(self) {
            case .monday:
                return "Lunes"
            case .tuesday:
                return "Martes"
            case .wednesday:
                return "Miercoles"
            case .thursday:
                return "Jueves"
            case .friday:
                return "Viernes"
            case .saturday:
                return "Sabado"
            case .sunday:
                return "Domingo"
            }
        }
    }
}

extension ViewController{
    
    func testEnumDayOfWeekIterable(){
        let allDaysOfWeek = DayOfWeek.allCases
        
        for day in allDaysOfWeek {
            print(day.TranslatedText)
        }
    }
}

enum OperationResult<T>{
    case Success(value: T)
    case Failure(error: Error, code: Int)
}

extension ViewController {
    
    func testEnumOperation(){
        let opResult = OperationResult<String>.Success(value: "aaaa")
        
        switch(opResult){
            
        case .Success(value: let value):
            print(value)
            break
        case .Failure(error: let error, code: let code):
            print(code)
            break
        }
    }
}

enum MathOperation{
    case Add(a:Double, b:Double)
    case Substract(a:Double, b:Double)
    case Multiply(a:Double, b:Double)
    case Divide(a:Double, b:Double)
    case Module(a:Double, b:Double)
    
    var Result: Double{
        get{
            switch(self){
                
            case .Add(a: let a, b: let b):
                return a+b
            case .Substract(a: let a, b: let b):
                return a-b
            case .Multiply(a: let a, b: let b):
                return a*b
            case .Divide(a: let a, b: let b):
                return a/b
            case .Module(a: let a, b: let b):
                return a.truncatingRemainder(dividingBy: b)
            }
        }
    }
}

extension ViewController {
    
    func testEnumOperations() {
        let mathOp: MathOperation = .Add(a: 5, b: 3)
        print(mathOp.Result)
        
        //let result = MathOperation.Add(a: 3, b: 3) + MathOperation.Multiply(a: 3, b: 3)
        //print(result)
        
        var enumopt: MathOperation? = nil
        
        /*switch(enumopt){
        case .none:
            <#code#>
        case .some(_):
            <#code#>
        }*/
    }
}
