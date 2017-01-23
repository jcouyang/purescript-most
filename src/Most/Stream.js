var most = require('most')
exports.just = most.just;
exports._map = most.map;
exports.ap = most.ap;
exports._flatMap = most.flatMap;
exports._concat = most.concat;
exports._show = function(stream) {
    return "Stream {" + stream.source.constructor.name + JSON.stringify(stream.source) + "}"
}
