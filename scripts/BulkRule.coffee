Rule = require './Rule'

###
# Construct a new Bulk Rule
#
# @class BulkRule
# @classdesc Bulk Rules
###
class BulkRule extends Rule
    ###
    # Constructor
    # @memberOf BulkRule
    # @param {String} itemName Product name on which to apply the rule
    # @param {Number} quantity Quantity on which you want to apply the offer
    # @param {Number} newPrice New price to apply if the rule is satisfied
    ###
    constructor: (@itemName, @quantity, @newPrice) ->
        super this

    ###
    # Apply the rule on items
    # @memberOf BulkRule
    # @param {Array} items List of items on which to apply the rule
    # @returns {Number} Total price of the items, once applied the rule
    ###
    applyRule: (items) ->
        total = 0
        return total if items.length is 0

        itemsFiltered = @filterRules @itemName, items

        length = itemsFiltered.length
        return total if length is 0

        price = itemsFiltered[0].price
        return length * price if length < @quantity

        total = itemsFiltered.length * price
        total = length * @newPrice if length >= @quantity

        total

module.exports = BulkRule
