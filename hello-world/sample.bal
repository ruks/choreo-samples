import ballerina/http;
import ballerina/lang.runtime;

service /hello on new http:Listener(8090) {
    resource function get greeting() returns string {
runtime:sleep(90);        
return "Hello, World!";
        
    }
}
