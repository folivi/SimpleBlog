source = new EventSource('/articles/events')
source.addEventListener 'message', (e) ->
	console.debug e.data