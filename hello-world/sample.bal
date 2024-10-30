import ballerina/http;
import ballerina/lang.runtime;

service /hello on new http:Listener(8090) {
    resource function get greeting() returns string {
runtime:sleep(1);        
return "Hello, World!";
        
    }
}
