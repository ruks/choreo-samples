import ballerina/http;
import ballerina/log;

configurable string invke_url = ?;

type Greeting record {
    string 'from;
    string to;
    string message;
};

service / on new http:Listener(8090) {
    resource function get books() returns Greeting|error? {
        log:printInfo(invke_url);

        log:printInfo("Starting the client");
        log:printInfo(invke_url);

        string expected_payload = string `[{"book_id":"01ee2c40-6344-117e-963d-5b5fa299dfd4","title":"A Tour To Mars","author":"John Carter","status":"reading"},{"book_id":"01ee2c40-6344-117e-a255-56730a9fb1a3","title":"Dead Men","author":"Frank Smith","status":"read"},{"book_id":"01ee2c40-6344-117e-9d1b-94058a6d95d7","title":"The Bucther","author":"Jude Silvester","status":"to_read"}]`;
        http:Client clientEndpoint = check new (invke_url);
        // Send a GET request to the specified endpoint.
        json payload = check clientEndpoint->get("/books");
        string k = payload.toBalString();

        if k.equalsIgnoreCaseAscii(expected_payload) {
            log:printInfo("MATCHING RESPONSE");
        }

        Greeting greetingMessage = {"from": "Choreo", "to": "Choreo", "message": "Welcome to Choreo!"};
        return greetingMessage;
    }
}
