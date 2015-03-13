[pty, sio, express, http] = (require lib for lib in ['pty.js', 'socket.io', 'express', 'http'])
[host, port] = ["0.0.0.0", process.env.PORT or 5000]

server = http.createServer(express().use(express.static(__dirname)))

sio.listen(server).sockets.on('connection', (socket)->
	term = pty.spawn 'bash', [], {cwd: process.env.HOME}
	.on 'data', (data)-> socket.emit('data', data)
	.on 'exit', -> socket.emit('exit', {})

	socket.on 'data', (data)-> term.write data
	.on 'resize', (data)-> term.resize(data.cols, data.rows)
	.on 'disconnect', -> term.destroy()
)

server.listen port, host, -> console.log("Server Listening on %s:%d", host, port)