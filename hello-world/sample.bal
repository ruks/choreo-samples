import ballerina/http;
import ballerina/lang.runtime;

service /hello on new http:Listener(8090) {
    resource function get greeting() returns string {
        return "Hello, World!";
        runtime:sleep(90);
    }
}
