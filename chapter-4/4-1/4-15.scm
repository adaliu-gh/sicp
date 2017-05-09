Evaluating (try try)

Case 1:

(try try) is interminable
=> (halts? try try) == false
=> then in the <if> body, 'halted should be executed
=> which violates the assumption that (try try) is interminable

Case 2:

(try try) halts
=> (halts? try try) == true
=> in the <if> body, (run-forever) should be executed
=> which violates the assumption that (try try) halts
