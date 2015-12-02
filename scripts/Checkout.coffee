###
# Construct a new Checkout item
#
# @class Checkout
# @classdesc Checkout new items
###
class Checkout
    ###
    # Constructor
    # @memberOf Checkout
    # @param {Array} arrayRules List of rules to apply in the checkout process
    ###
    constructor: (@arrayRules) ->
        @items = []

    ###
    # Scan and add new items
    # @memberOf Checkout
    # @param {Item} item Add new item to checkout process
    # @returns {Object} The current instance of the class
    ###
    scan: (item) ->
        @items.push item
        @

    ###
    # Clean all items from checkout
    # @memberOf Checkout
    ###
    clean: -> @items = []

    ###
    # Calculate the total checkout applying the rules of the selected items
    # @memberOf Checkout
    # @returns {Object} Total price of the items, once applied the rules
    ###
    total: ->
        price = 0
        items = @items
        @arrayRules.forEach (rule) ->
            price += rule.applyRule(items)

        price = items.reduce (previous, item) ->
            previous += item.price
        , price

        @clean()

        price

module.exports = Checkout
