https://docs.hashicorp.com/sentinel/writing

# Traces
https://docs.hashicorp.com/sentinel/writing/tracing

Set to fail on `day` is `sunday`.    

Run:
```
sentinel apply traces.sentinel
```

Output:
```
Execution trace. The information below will show the values of all
the rules evaluated. Note that some rules may be missing if
short-circuit logic was taken.

Note that for collection types and long strings, output may be
truncated; re-run "sentinel apply" with the -json flag to see the
full contents of these values.

The trace is displayed due to a failed policy.

Fail - traces.sentinel

traces.sentinel:7:1 - Rule "main"
  Value:
    false

traces.sentinel:5:1 - Rule "is_open_hours"
  Value:
    true

traces.sentinel:4:1 - Rule "is_weekday"
  Value:
    false
```

Note that trace is automatic on CLI.  
You will first see that the `main` rule has failed.  
After the main rule, you will see for all other rules if they passed (true) and failed (false).  

# Traces (non boolean)
https://docs.hashicorp.com/sentinel/writing/tracing#non-boolean-rules-and-the-trace

Set to fail when the `weather` of a weekday is `sunny`.      

Run:
```
sentinel apply traces_non_boolean.sentinel
```

Output:
```
Execution trace. The information below will show the values of all
the rules evaluated. Note that some rules may be missing if
short-circuit logic was taken.

Note that for collection types and long strings, output may be
truncated; re-run "sentinel apply" with the -json flag to see the
full contents of these values.

The trace is displayed due to a failed policy.

Fail - traces_non_boolean.sentinel

traces_non_boolean.sentinel:11:1 - Rule "main"
  Value:
    [
      {
        "weekday": "Sunday"
        "weather": "clouds"
      }
      {
        "weekday": "Monday"
        "weather": "rain"
      }
      {
        "weekday": "Thursday"
        "weather": "clouds"
      }
      {
        "weekday": "Friday"
        "weather": "rain"
      }
    ]
```

Here it lists all the days that are not `sunny`.  

# Test case format
https://docs.hashicorp.com/sentinel/writing/testing#test-case-format

Run:
```
sentinel test test_case_format.sentinel
```

Output:
```
FAIL - test_case_format.sentinel
  FAIL - test/test_case_format/fail.hcl

    trace:
      test_case_format.sentinel:10:1 - Rule "main"
        Value:
          false

      test_case_format.sentinel:8:1 - Rule "is_open_hours"
        Value:
          false
  PASS - test/test_case_format/fail_assert.hcl
  PASS - test/test_case_format/pass.hcl
```

Note that in the fail_assert.hcl we added test rules, so the fails that are expected, pass.  
```
test {
  rules = {
    main          = false
    is_open_hours = false
  }
}
```