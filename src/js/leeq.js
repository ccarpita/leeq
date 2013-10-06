(function() {

  if (typeof document === 'undefined') {
    return;
  }

  var $ = document.getElementById.bind(document);
  var $E = document.createElement.bind(document);
  var sources = {
    'SoundHelix 1': 'http://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'
  };
  var audioNode = $('audio-source');

  var Leeq = Model({
    setup: function() {
      for (var k in sources) {
        this.setSource(k);
        break;
      }
    },
    setSource: function(name) {
      var sourceUrl = sources[name];
      audioNode.setAttribute('src', sourceUrl);
      audioNode.setAttribute('type', sourceUrl.indexOf('.ogg') != -1 ? 'audio/ogg' : 'audio/mpeg');
    }
  });

  var leeq = new Leeq();
  leeq.setup();
}());
