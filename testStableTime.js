const Web3 = require('web3');
const web3ext = require('util/web3ext.js')
const net = require('net')


var oldNumber = 0;
let web3 = new Web3(new Web3.providers.IpcProvider('/home/ubuntu/data/gwan.ipc', net));
web3ext.extend(web3)

function testStableTime() {
    var number = web3.eth.blockNumber;
    if (number != oldNumber) {
        var timeNow = web3.eth.getBlock(number).timestamp;
        var stableNumber = web3.pos.getMaxStableBlkNumber();
        var stableTime = web3.eth.getBlock(stableNumber).timestamp;
        console.log("number:", number, "stableNumber:", stableNumber, "confirmTime:", timeNow - stableTime, "timeStamp:", timeNow, stableTime);
        oldNumber = number;
    }
}

setInterval(testStableTime, 1000, null);