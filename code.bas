$regfile = "m16def.dat"


config kbd = Porta, Delay = 15
config PORTc = Output
config portd.0 = Output
config portd.1 = Output

config lcdpin = pin , port = PORTc , rs = portd.0 , e = portd.1
config LCD = 16x2

dim num1 as Integer
dim num2 as Integer
dim operation as Byte
dim result as Integer
dim count as Integer
dim x as Integer
dim x_Asc as Integer
dim x_char as String * 2

Do
  Begin:
     count = 0


     Do
       x = Getkbd()
       if x = 1 or x = 4 or x = 5 or x = 6 or x = 8 or x = 9 or x = 10 or x = 12 or x = 13 or x = 14 then
       x_Asc = Lookup(x , Calculator)
       x_char = Chr(x_Asc)
       LCD x_char
       num1 = x_Asc - 48
       count = count + 1
       elseif x = 0 Then
       CLS
       GoTo Begin
       Endif
     Loop Until count = 1


     count = 0
     Do
       x = Getkbd()
       if x = 3 or x = 7 Then
       x_Asc = Lookup(x , Calculator)
       x_char = Chr(x_Asc)
       LCD x_char
       operation = x
       count = count + 1
       elseif x = 0 Then
       CLS
       GoTo Begin
       elseif x = 2 Then
       lowerline
       LCD num1
       Endif
     Loop Until count = 1



     count = 0
     Do
         x = Getkbd()
         if x = 1 or x = 4 or x = 5 or x = 6 or x = 8 or x = 9 or x = 10 or x = 12 or x = 13 or x = 14 then
         x_Asc = Lookup(x , Calculator)
         x_char = Chr(x_Asc)
         LCD x_char
         num2 = x_Asc - 48
         count = count + 1
         elseif x = 0 Then
         CLS
         GoTo Begin
         Endif
     Loop Until count = 1



     count = 0
     Do
        x = Getkbd()
        if x = 2 and operation = 3 Then
        result = num1 + num2
        LowerLine
        LCD result
        Cursor Off
        count = count + 1
        elseif x = 2 and operation = 7 Then
        result = num1 * num2
        LowerLine
        LCD result
        Cursor Off
        count = count + 1
        elseif x = 0 Then
        CLS
        GoTo Begin
        Endif
     Loop Until count = 1

Loop

End

Calculator:
   Data "c" , "0" , "=" , "+" , "1" , "2" , "3" , "*" , "4" , "5" , "6" , "" , "7" , "8" , "9" , ""