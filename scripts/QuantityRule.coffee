Rule = require './Rule'

###
# Construct a new Quantity Rule
#
# @class QuantityRule
# @classdesc Quantity Rules
###
class QuantityRule extends Rule
    ###
    # Constructor
    # @memberOf QuantityRule
    # @param {String} itemName Product name on which to apply the rule
    # @param {Number} quantity Quantity on which you want to apply the offer
    # @param {Number} itemFree Free items to apply in the offer
    ###
    constructor: (@itemName, @quantity, @itemFree) ->
        super this

    ###
    # Apply the rule on items
    # @memberOf QuantityRule
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

        total = (@quantity * price) - (@itemFree * price)
        total += price if length % @quantity

        total

module.exports = QuantityRule
