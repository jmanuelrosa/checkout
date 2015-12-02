###
# Checkout
#
# @desc App main entry point
# @namespace Checkout
# José Manuel Rosa Moncayo
###

# Require all neccesary class
Item = require './Item'
Rule = require './Rule'
BulkRule = require './BulkRule'
QuantityRule = require './QuantityRule'
Checkout = require './Checkout'

# Create all items
voucher = new Item 'VOUCHER', 'Cabify Voucher', 5.00
tshirt = new Item 'TSHIRT', 'Cabify T-Shirt', 20.00
mug = new Item 'MUG', 'Cabify Coffee Mug', 7.50

# Create Rules
marketing = new QuantityRule 'VOUCHER', 2, 1
cfo = new BulkRule 'TSHIRT', 3, 19

# Get all the rules defined
pricingRules = Rule.rules()

# Processes the first cart or purchase
# Items: VOUCHER, TSHIRT, MUG
# Total: 32.50€
co = new Checkout pricingRules
co
    .scan voucher
    .scan tshirt
    .scan mug
price = co.total()
console.log 'Total: %s€', price

# Processes the second cart or purchase
# Items: VOUCHER, TSHIRT, VOUCHER
# Total: 25.00€
co = new Checkout pricingRules
co
    .scan voucher
    .scan tshirt
    .scan voucher
price = co.total()
console.log 'Total: %s€', price

# Processes the third cart or purchase
# Items: TSHIRT, TSHIRT, TSHIRT, VOUCHER, TSHIRT
# Total: 81.00€
co = new Checkout pricingRules
co
    .scan tshirt
    .scan tshirt
    .scan tshirt
    .scan voucher
    .scan tshirt
price = co.total()
console.log 'Total: %s€', price

# Processes the fifth cart or purchase
# Items: VOUCHER, TSHIRT, VOUCHER, VOUCHER, MUG, TSHIRT, TSHIRT
# Total: 74.50€
co = new Checkout pricingRules
co
    .scan voucher
    .scan tshirt
    .scan voucher
    .scan voucher
    .scan mug
    .scan tshirt
    .scan tshirt
price = co.total()
console.log 'Total: %s€', price


