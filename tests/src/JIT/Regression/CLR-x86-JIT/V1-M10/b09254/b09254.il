// Copyright (c) Microsoft. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for full license information.

.assembly extern legacy library mscorlib {}
.assembly b09254
{
}

.method static int32 main(class System.String[]) {
	.entrypoint
	.locals (int32)
	.maxstack		20
	ldc.i4	0xABBA
	stloc 0
	ldloca 0
	mkrefany int32
	refanytype
	pop
	ldc.i4 100
	ret
}
