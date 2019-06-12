/*:
 # Primeros pasos Swift 📱
 Curso iOS básico
 */
/*:
 ## Variables y constantes:
 */


let numero1 = 5
var numero2 = 10

//numero1+=1
numero2+=1

print(numero1)
print(numero2)


/*:
 
 ## Tipos de datos:
 
 */
//Booleano
var falso:Bool = true
var verdadero:Bool = false

//Enteros
var unEntero:Int = 10
var otroEntero:Int = 100
var EnteroSinSigno:UInt = 1

//Flotantes
var unDecimal:Float = 10.0
var otroDecimal:Float = 100.0

//Doubles
var unDouble:Double = 10.0
var otroDouble:Double = 100.0

//Oraciones (String o cadenas de texto)
var unString:String = "Jailhouse Rock"
var otroString:String = "Unchained Melody"


import UIKit
var unColor:UIColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)  //ColorLiteral

var perro = "🐶"

var 🐶 = "perro"

print(perro)
print(🐶)


/*:
 ## Operadores:
 
Lógicos, aritméticos y relacionales
 */
//Suma
print(6+7)
//Resta
print(8-9)
//Multiplicación
print(8*9)
//División
print(14/7)

6 < 9
7 < 2
5 == 5
2 != 2

var numeroBonito = 10
numeroBonito+=1



/*:
 ## Control de flujo
 
 if/else - switch - for - while - repeat
 
 */
var room = 101
if room >= 100 {
    print("El cuarto está en el primer piso... ")
}else{
    print("El cuarto no se encuentra en el primer piso... ")
}

var esProfesor = true
var nivelBuenaOnda = 8
var puntual = 8

if (nivelBuenaOnda > 7 && puntual >= 5) || esProfesor {
    print("Hola profe!")
}

switch(room){
    case 100:
    print("El cuarto es el número 100")
    break
    case 101:
    print("El cuarto es el número 101")
    break
    default:
    print("No es ninguno de los anteriores")
}


//Ciclo for
for i in 1...10 {
    print(i)
}

// imprime del 0 a 9
for j in 0..<10 {
    print(j)
}

//While
var i = 1
while i <= 10 {
    print(i)
    i = i + 1
}

//repeat
var l = 1
repeat {
    print(l)
    l = l + 1
} while l < 10


/*:
 ## Arreglos
 
 */

//Los arreglos son conjuntos de elementos que son del mismo tipo.

//Declarar de manera EXPLÍCITA
var arregloNumerosEnteros:[Int] = [1,4,6,8,9,4,2]
var arregloNumerosDecimales:[Float] = [2.0,4.4,5.6]

var arregloStrings = ["Hola","Adiós","Genial"]
var arregloColores = [#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1) ,#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1) ,#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1) ,#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) ,#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1) ]


