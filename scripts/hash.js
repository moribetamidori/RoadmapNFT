const password = require('crypto').randomBytes(24).toString('base64')
const seed = require('Web3').utils.soliditySha3(password)
const hash = require('Web3').utils.soliditySha3(seed)

console.log(`Guardian password: ${password}`)
console.log(`Guardian hash: ${hash}`)