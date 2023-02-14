# Your first policy
https://docs.hashicorp.com/sentinel/intro/getting-started/first-policy  

File: first_policy.sentinel

run:  
```
sentinel apply first_policy.sentinel
```
output:
```
Pass - first_policy.sentinel
```

# Rules
https://docs.hashicorp.com/sentinel/intro/getting-started/rules 

File: rules.sentinel

run:  
```
sentinel apply rules.sentinel
```
output:
```
Pass - rules.sentinel
```

# Logic
https://docs.hashicorp.com/sentinel/intro/getting-started/logic

File: logic.sentinel

run:  
```
sentinel apply logic.sentinel
```
output:
```
Pass - logic.sentinel
```

# Imports
https://docs.hashicorp.com/sentinel/intro/getting-started/imports

File: imports.sentinel

run:  
```
sentinel apply imports.sentinel
```
output:
```
Pass - imports.sentinel
```

# Testing
https://docs.hashicorp.com/sentinel/intro/getting-started/testing

File: testing.sentinel

Note that there is a test folder.  
In this test folder there is another folder with the name of the policy, here testing.  
In `/test/testing/` there is a file `good.hcl`. In this is a test case defined that will pass.   

You can add as many test cases in this folder as needed.  

Note the run command changed from `apply` to `test`.

run:  
```
sentinel test testing.sentinel
```
output:
```
PASS - testing.sentinel
 PASS - test/testing/good.hcl
```