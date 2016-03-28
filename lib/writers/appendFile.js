var f = 'marx.txt';
var fs = require('fs');

var file_i = fs.readFileSync('./marx_i.txt');
var file_ii = fs.readFileSync('./marx_ii.txt');
var file_iii = fs.readFileSync('./marx_iii.txt');
var file_iv = fs.readFileSync('./marx_iv.txt');

fs.writeFile(f, file_i, function(err){
    if(err)
      console.error(err);
  console.log('Written!');
});

fs.appendFile(f, file_ii, function(err){
    if(err)
      console.error(err);
  console.log('Appended!');
});
  
fs.appendFile(f, file_iii, function(err){
  if(err)
    console.error(err);
  console.log('Appended!');
});

fs.appendFile(f, file_iv, function(err){
  if(err)
    console.error(err);
  console.log('Appended!');
});
