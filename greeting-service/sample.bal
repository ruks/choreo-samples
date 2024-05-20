import ballerina/http;
import ballerina/log;

configurable string invke_url = ?;

type Greeting record {
    string 'from;
    string to;
    string message;
};

service / on new http:Listener(8090) {
    resource function get .() returns Greeting {
        log:printInfo(invke_url);
        Greeting greetingMessage = {"from": "Choreo", "to": "Choreo", "message": "Welcome to Choreo!"};
        return greetingMessage;
    }
}
