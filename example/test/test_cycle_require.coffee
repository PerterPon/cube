describe 'test/test_cycle_require', ()->
  cache = []
  originWarn = ''
  before () ->
    originWarn = console.warn
    console.warn = (msg, msg2) ->
      cache.push msg + msg2

  afterEach ()->
    console.warn = originWarn
    cache = []

  it 'expect console.warn info', (done)->
    async './cycle/a', ()->
      expect(cache[0]).to.match /cycle/
      done()