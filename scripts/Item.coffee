###
# Construct a new Item
#
# @class Item
# @classdesc New Item
###
class Item
    ###
    # Constructor
    # @memberOf BulkRule
    # @param {String} name Item name
    # @param {String} text Item Description
    # @param {Number} price Item Price
    ###
    constructor: (@name, @text, @price) ->

module.exports = Item
