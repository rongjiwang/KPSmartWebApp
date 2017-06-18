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
        case 'discontinue': //new discontinued route
            result.simulation.discontinue.push(event);
            break;
        case 'continue': //new re-continued route
            result.simulation.continue.push(event);
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