###
# Construct a new Rule
#
# @class Rule
# @classdesc Rules
# @property {Array} _rules Static array with a list of rules
###
class Rule
    _rules = []

    ###
    # Constructor
    # @memberOf Rule
    # @param {Rule} rule New Rule, Bulk or Quantity Rule
    ###
    constructor: (rule) ->
        _rules.push rule

    ###
    # Static array to get the list of rules
    # @memberOf Rule
    # @returns {Array} List of rules
    ###
    @rules: -> _rules

    ###
    # Polymorphic method overloaded child classes, which allows you to apply
    # the rules on the elements
    # @memberOf Rule
    # @param {Array} items List of items on which to apply the rule
    # @returns {Number} Total price of the products, once applied the rule
    ###
    applyRule: (items) ->

    ###
    # Polymorphic method overloaded child classes, which allows you to apply
    # the rules on the elements
    # @memberOf Rule
    # @param {String} name Name of items to remove
    # @param {Array} items List of items to filter
    # @returns {Array} Items array without removed items
    ###
    filterRules: (name, items) ->
        itemsFiltered = []
        name = name.toLowerCase()
        for item, key in items by -1
            if name is item.name.toLowerCase()
                items.splice key, 1
                itemsFiltered.push item
        itemsFiltered

module.exports = Rule
