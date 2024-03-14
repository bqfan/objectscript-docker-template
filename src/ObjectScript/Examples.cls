/// examples for ObjectScript Tutorial
Class ObjectScript.Examples
{

/// demo of public and private methods, along with a public variable
ClassMethod PrivatePublic()
{
    do ..Private()   // call a private method
    do ..Public(9)   // call a public method

    write !
    return "PrivatePublic() called!"
}

/// a private method with public variable a
ClassMethod Private() [ Private, PublicList = a ]
{
    write !, "setting a"  set a = 1
    write !, "setting b"  set b = 2
    write !, "setting c"  set c = 3
    write !, "setting d"  set d = 4
}

/// a public method with an argument and a return value
ClassMethod Public(num As %Numeric) As %String
{
    write !, "my favorite number is ", num
    return "This is my return value!!!"
}

/// demo of passing arguments by value and reference
ClassMethod PassingArguments(num As %Numeric)
{
    // pass by value
    set dblnum = ..DoubleByVal(num)
    write !, "By Value: ", num, " doubled is: ", dblnum

    // num passed IN and OUT by reference
    write !, "By Reference 1: ", num
    do ..DoubleByRef1(.num)
    write " doubled is: ", num

    // num passed IN by value, result passed OUT by reference
    do ..DoubleByRef2(num, .result)
    write !, "By Reference 2: ", num, " doubled again is: ", result
}

ClassMethod DoubleByVal(anynumber As %Numeric) As %Numeric
{
    return anynumber * 2
}

ClassMethod DoubleByRef1(ByRef anynumber As %Numeric)
{
    set anynumber = anynumber * 2
}

ClassMethod DoubleByRef2(anynumber As %Numeric, Output retnumber As %Numeric)
{
    set retnumber = anynumber * 2
}

/// demo of <UNDEFINED> error
ClassMethod BadMethod()
{
    set a = 1
    set b = 2
    write c
}

// root for my favorite team

ClassMethod Root()
{
    read "Team: ", t
    if (t = "") { quit }  // stop execution if no team is specified
    if (t = "METS") {
        write !, "Go METS!" }
    else {
        write !, "Boo ", t, "!" }
}

/// demos of many Ifs
ClassMethod If()
{
    set x = 5, y = 0, z = -5
    if (x = 5) {write !, "x is equal to 5"} else {write !, "false"}
    if (x = 10) {write !, "x is equal to 10"} else {write !, "false"}
    if (x < y) {write !, "x is less than y"} else {write !, "false"}
    if (x > y) {write !, "x is greater than y"} else {write !, "false"}
    write !
    if (##class(%SYSTEM.Util).NumberOfCPUs() > 2) {write !, "there are more than 2 CPUs"} else {write !, "false"}
    if (x > $zsqr(64)) {write !, "x is greater than square root of 64"} else {write !, "false"}
    write !
    if (x && y) {write !, "both x and y are true (non-zero)"} else {write !, "false"}
    if (x && z) {write !, "both x and z are true (non-zero)"} else {write !, "false"}
    if (x && y && z) {write !, "x, y, and z are all true (non-zero)"} else {write !, "false"}
    if (x || y || z) {write !, "at least one of x, y, or z is true (non-zero)"} else {write !, "false"}
    write !
    if ((x > y) || (y < z)) {write !, "either x is greater than y OR y is less than z"} else {write !, "false"}
    if (x > y || y < z) {write !, "without proper parentheses, this expression is false"} else {write !, "false"}
    if ((x > y) && (z < y)) {write !, "x is greater than y AND z is less than y"} else {write !, "false"}
    if (x > y && z < y) {write !, "without proper parentheses, this expression is also false"} else {write !, "false"}
    write !
    if 'x {write !, "x is not true (zero)"} else {write !, "false"}
    if 'y {write !, "y is not true (zero)"} else {write !, "false"}
    if (x '< y) {write !, "x is not less than y"} else {write !, "false"}
    if '(x < y) {write !, "x is not less than y"} else {write !, "false"}
}

ClassMethod Celebrate()
{
    write !, "Yippee! I won!"
}

ClassMethod Complain()
{
    write !, "Oh well, I lost."
}

/// demos of the For construct
ClassMethod For()
{
    for i = 1:1:8 {
        write !, "I ", i, " the sandbox."
    }
    write !!
    for b = "John", "Paul", "George", "Ringo" {
        write !, "Was ", b, " the leader? "
        read yn
    }
    write !!
    for i = 1:1 {
        read !, "Capital of MA? ", a
        if (a = "BOSTON") {
            write "...did it in ", i, " tries"
            quit
        }
    }
    write !!
    for i = 1:1 {
        read !, "Capital of TX? ", a
        continue:(a '= "AUSTIN")
        write "...did it in ", i, " tries"
        quit
    }
    write !!
    for {
        read !, "Know what? ", wh
        quit:(wh = "NO!")
        write "   That's what!"
    }
}

/// generate Fibonacci sequences
ClassMethod Fibonacci()
{
    read !, "Generate Fibonacci sequence up to where? ", upto
    
    set t1 = 1, t2 = 1, fib = 1
    write !
    do {
        write fib, "  "
        set fib = t1 + t2, t1 = t2, t2 = fib
    }
    while (fib '> upto)

    set t1 = 1, t2 = 1, fib = 1
    write !
    while (fib '> upto) {
        write fib, "  "
        set fib = t1 + t2, t1 = t2, t2 = fib
    }
}

/// examples of system and custom exceptions
ClassMethod Exceptions(x As %Numeric)
{
    // UNDEFINED error throws a system exception
    try {
        write "Hello!", !, xyz
    }
    catch err {
        write !, "Error name: ", ?20, err.Name,
              !, "Error code: ", ?20, err.Code,
              !, "Error location: ", ?20, err.Location,
              !, "Additional data: ", ?20, err.Data, !
    }

    // DIVIDE error throws a system exception
    try {
        write 1/0
    }
    catch err {
        write !, "Error name: ", ?20, err.Name,
              !, "Error code: ", ?20, err.Code,
              !, "Error location: ", ?20, err.Location,
              !, "Additional data: ", ?20, err.Data, !
    }
    
    // create a simple custom exception object and throw it
    set ex = ##class(%Exception.General).%New()
    set ex.Name = "Demo Exception",
        ex.Code = 100000,
        ex.Data = "Tutorial Example"
    try {
        write !, "Hello!", !
        if (x >= 5) throw ex  // throw the exception
    }
    catch err {
        write !, "Error name: ", ?20, err.Name,
              !, "Error code: ", ?20, err.Code,
              !, "Error location: ", ?20, err.Location,
              !, "Additional data: ", ?20, err.Data, !
        if (x = 5) return  // terminate method
    }
    write !, "Finished!"
}

}
