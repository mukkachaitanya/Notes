# NODE JS
----------

- Node.js allows the javascript programs to run without browser.
	Give many functionalities to access system functions

- `console.log(<parms>);`
	Can be used to print to command line

- Arguments can be passed through command line
	eg. `$ node program.js 1 43`
		Here the arguments which can be accessed by `process.argv` array is:
			```['node', 'program's path', '1', '43']```

- for performing filesystem operations we use `fs`
	```var fs = require("fs"); //to import the module ```

- Sync operations are blocking:
	```js
	fs.readFileSync("file_path");
	```
		-> return a buffer stream
		-> Use `buffer.toString();` to convert to string.

- Async (non-blocking) is the Node.js way:
	* Async functions take a *idiomatic* callback functions a parms :
		```js
		function callback(err, data){ /*....*/ } 
		```
	eg. 
		fs.readFile(<callback>)

- fs.readDir(<callback>): 
	is used as `ls`
	`path.extname("path_of_file")` gives you the files extension (require("path"))

- Program cam be made modular by cretaing modules:
	* `var myModule = require("./xyz");`

	* The function(s) to be exported should be assigned to module.exports (it is a obj/dict):
		```js
		module.exports = function(){ /*...*/ } 
		```

- http module can be used to perform various event run functions:
	* ```js
		http.get(url, function(result){ /*...*/ }); // creates a client
	  ```
	  	* The result is a encoded buffer, add "utf8" param to convert to strings.
	  	* http.get emits the events; error 
	  	* `result` emits the events; data, error
	  	* The events can be tracked using the ` .on("<event>", function)`

- Both `bl` and `concat-stream` can have a stream *piped* and collect the data. Once the stream has ended, a callback will be fired with the data:
		```js
		response.pipe(bl(function (err, data) { /* ... */ }))
		// or
		response.pipe(concatStream(function (data) { /* ... */ }))
		```

- `async` or `after` external modules can be used for parallelism.

- TCP Sockets can be used from the `net` module : 
	* ```js
	var server = net.createServer(function(clientSocket){ /* ... */ });
	```
	Creates a server, can use `server.listen("port_number");` to listen on a given port.

	* callback function is called for each client.
	* `socket.write(data)` can be used to send/write data to the socket.
	* `socket.end(data)` writes the data and closes the connection.

- Files can be sent using http servers :
	```js
	http.createServer(function(request, response) {
	  	var filename = process.argv[3];
	  	var readStream = fs.createReadStream(filename);

	  	readStream.on('open', function () {
	    	readStream.pipe(res);
	  	});

	  	readStream.on('error', function(err) {
	    	res.end(err);
	  	});
  
	}).listen(port);
	```

	* The stream created emits; open, error and end events
	* Piping in data from `request` gets the data from ( i.e. `http.get` server)
	* Piping data into `response` sends data to the client

- `through2-map` module can be used to pipe and stream *request* and *response* data : 
	(similar to javascript list map)
	```js
	req.pipe(map(function(data){
        return data; // manipulate data
    })).pipe(res);
    ```

- `response.writeHead(status_code, {headers});` is used to specify the response header to the request :
	* **eg.** 
	```js
	res.writeHead(200, { 'Content-Type': 'application/json' });
	```
- `url.parse(req.url, true)` returns a object gives various details :
	* `.pathname` gives the request path
	* `.query` gives an object of the contents of `?q=`