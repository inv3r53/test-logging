output application/java
import * from dw::util::Values
var fieldsToMask = ["authorization" , "client_secret"] map lower($)
fun isSecret(f) = fieldsToMask contains  ( lower(f) as String)
---
write(attributes.headers mapObject ((value, key, index) -> (key) : (if(isSecret(key)) "***" else value) ),"application/java")