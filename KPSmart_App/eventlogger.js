var fs = require('fs');
var xml2js = require('xml2js');
var parser = new xml2js.Parser();
var builder = new xml2js.Builder();

exports.logEvent = function(event, type) {
  fs.readFile('event_log.xml', function(err, data) {
    parser.parseString(data, function (err, result) {
      switch(type) {
        case 'mail': //new mail event
          result.simulation.mail.push(event);
          break;
        case 'routeCostUpdate': //new transpot-cost update
          result.simulation.cost.push(event);
          break;
        case 'routePriceUpdate': //new transpot-cost update
            result.simulation.cost.push(event);
            break;
        case 'routeDiscontinue': //new discontinue-route
            result.simulation.discontinue.push(event);
            break;
        case 'routeDiscontinue': //new discontinue-route
            result.simulation.discontinue.push(event);
            break;
        default:
          console.log(err);
      } 
      console.log(result);
      var xml = builder.buildObject(result);
      fs.writeFile('event_log.xml', xml, function(err) {
        if(err){
          console.log(err);
        }
      });
    });
  });
}

exports.getNumberOfEvents = function(callback) {
  var total = 0;
  getAllMailEvents(function(err, result){
    total += result.length;
    getAllDiscontinueEvents(function(err, result){
      total += result.length;
      getAllCostEvents(function(err, result){
        total+= result.length;
        callback(total);
      });
    });
  });
}

var getAllMailEvents = exports.getAllMailEvents = function(callback) {
  fs.readFile('event_log.xml', function(err, data) {
    parser.parseString(data, function (err, result) {
      if(err){
        callback(err);
        return;
      }
      callback(null, result.simulation.mail);
    });
  });
}

var getAllCostEvents = exports.getAllCostEvents = function(callback) {
  fs.readFile('event_log.xml', function(err, data) {
    parser.parseString(data, function (err, result) {
      if(err){
        callback(err);
        return;
      }
      callback(null, result.simulation.cost);
    });
  });
}

var getAllDiscontinueEvents = exports.getAllDiscontinueEvents = function(callback) {
  fs.readFile('event_log.xml', function(err, data) {
    parser.parseString(data, function (err, result) {
      if(err){
        callback(err);
        return;
      }
      callback(null, result.simulation.discontinue);
    });
  });
}