const express = require("express");
const body_parser = require("body-parser");
const request = require("request");
const https  =require("http");
const { url } = require("inspector");
const app = express();
app.use(express.static("public"));//for images and css
app.use(body_parser.urlencoded({extended: true}));
app.get("/", function(req,res){
    res.sendFile(__dirname+ "/signup.html")
})// for connecting html files
app.post("/", function(req,res){
const firstname = req.body.fname;
const lastname = req.body.lname;
const email = req.body.email;

const data = {
    members: [{
        email_address: email,
        status:"subscribed",
        merge_fields: {
            FNAME:firstname,
            LNAME:lastname
        }
    }]
};

const jsondata = JSON.stringify(data);

https.request(url, Option, function(response){

})

})

// api_key = "ace1ea7400f9df1027f5adcac15fae8"
// audience _id = "caffd6e987."