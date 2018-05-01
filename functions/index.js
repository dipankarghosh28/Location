var functions = require('firebase-functions');
//var functions = require('firebase-admin');
const admin = require('firebase-admin')
const geocoder = require('geocoder');

admin.initializeApp(functions.config().firebase);

exports.locationChanged = functions.database.ref('/address')
       .onWrite(event => {

       });

       if(!event.data.exists()){
         return;
       }