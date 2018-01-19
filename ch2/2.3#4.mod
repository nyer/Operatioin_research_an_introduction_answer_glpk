var x1, >= 0, <= 800; # parka
var x2, >= 0, <= 750; # goose
var x3, >= 0, <= 600; # pant
var x4, >= 0, <= 500; # glove

maximize z: 30 * x1 - (800 - x1) * 15 + 40 * x2 - (750 - x2 ) * 20 + 20 * x3 - (600 - x3) * 10 + 10 * x4 - (500 - x4) * 8;

subject to
cutting_capacity: .3 * x1 + .3 * x2 + .25 * x3 + .15 * x4 <= 1000;
insulating_capacity: .25 * x1 + .35 * x2 + .30 * x3 + .10 * x4 <= 1000;
sewing_capacity: .45 * x1 + .5 * x2 + .4 * x3 + .22 * x4 <= 1000;
package_capacity: .15 * x1 + .15 * x2 + .1 * x3 + .05 * x4 <= 1000;

end;
