require 'rest-assured'

RestAssured::Server.start(database: ':memory:') # or any other option available on command line
# Or you can specify an instance that is already running somewhere:
RestAssured::Server.address = 'http://wacky-duckling.herokuapp.com'

$ gem install rest-assured
$ rest-assured 

http://localhost:4578/products
RestAssured::Double.create(pathpattern: /products\/[a-z]{10}\/?param=.*/, content: 'this is more content')
@double = RestAssured::Double.create(fullpath: '/products', verb: 'POST')

@double.wait_for_requests(1, timeout: 10) # defaults to 5 seconds
# or, if waiting for specific amount of requests does not suit the test, just
@double.reload # before verifying

http://localhost:4578/products
req = @double.requests.first

req.body.should == some_expected_payload
JSON.parse(req.params).should == expected_params_hash
JSON.parse(req.rack_env)['HTTP_ACCEPT'].should == 'text/html'

    $ curl -d 'fullpath=%2Fapi%2Fsomething%5C%3Fparam%3D.*&content=awesome&response_headers%5BContent-Type%5D=text%2Fhtml' http://localhost:4578/doubles
    {"double":{"active":true,"content":"awesome","description":null,"fullpath":"/api/something","id":1,"response_headers":{"Content-Type":"text/html"},"status":200,"verb":"GET"}}

    $ curl http://localhost:4578/api/something
    awesome

    $ curl -d 'pathpattern=/api/something\?param=.*&content=awesome&response_headers%5BContent-Type%5D=text%2Fhtml' http://localhost:4578/doubles
    {"double":{"active":true,"content":"awesome","description":null,"pathpattern":"/api/something\?param=.*","id":1,"response_headers":{"Content-Type":"text/html"},"status":200,"verb":"GET"}}

    $ curl http://localhost:4578/api/something?param=foo
    awesome

git commit -m "QTA-7 <message>"

