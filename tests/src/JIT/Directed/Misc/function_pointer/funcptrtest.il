// Copyright (c) Microsoft. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for full license information.

.assembly extern legacy library mscorlib {}
.assembly funcptrtest
{
}
.class value public auto ansi sealed test
{
  .method public static int32 foo1(int32)
  {
    .maxstack  8
     ldstr "foo1(int32) got ->"
     call void [mscorlib]System.Console::Write(class [mscorlib]System.String)
     ldarg 0
     call void [mscorlib]System.Console::WriteLine(int32)
     ldc.i4 44 //Return a value we will check for
     ret
  }

  .method public static int32 foo2(int32)
  {
    .maxstack  8
     ldstr "foo2(int32) got ->"
     call void [mscorlib]System.Console::Write(class [mscorlib]System.String)
     ldarg 0
     call void [mscorlib]System.Console::WriteLine(int32)
     ldc.i4 55 //Return a value we will check for
     ret
  }

  .method public static int32 bar(method explicit instance int32 *(int32), int32)
  {
    .maxstack  8
    ldarg 1
    ldarg 0
    calli int32 (int32)
    ret
  }

  .method public static int32 main()
  {
    .entrypoint
        ldstr "Starting Test..."
        call void [mscorlib]System.Console::WriteLine(class [mscorlib]System.String)

//Pass a pointer to foo1 -> bar so that bar can call foo1 
        ldstr "Calling foo1(66) via bar..."
        call void [mscorlib]System.Console::WriteLine(class [mscorlib]System.String)
	ldftn int32 test::foo1(int32)
        ldc.i4 66
	call int32 test::bar(method explicit instance int32 *(int32), int32)
        ldc.i4 44
        bne.un FAILURE
	
//Pass a pointer to foo2 -> bar so that bar can call foo2 
        ldstr "Calling foo2(77) via bar..."
        call void [mscorlib]System.Console::WriteLine(class [mscorlib]System.String)
	ldftn int32 test::foo2(int32)
        ldc.i4 77
	call int32 test::bar(method explicit instance int32 *(int32), int32)
        ldc.i4 55
        bne.un FAILURE
	
        ldstr "All Works!"
        call void [mscorlib]System.Console::WriteLine(class [mscorlib]System.String)
        ldc.i4 0x64
	ret
FAILURE:
        ldstr "All DIDNT WORK!"
        call void [mscorlib]System.Console::WriteLine(class [mscorlib]System.String)
        ldc.i4 1
	ret
       
  }
} 


