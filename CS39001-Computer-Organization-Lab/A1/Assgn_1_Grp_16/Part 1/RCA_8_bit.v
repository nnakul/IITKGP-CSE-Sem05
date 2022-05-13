
// Computer Organization Laboratory (CS39001)
// Semester 05 (Autumn 2021-22)
// Assignment 01 -- Problem 01 [Part C]
// 		File Summary : Designed and implemented an 8-bit ripple carry adder
// Group No. 16
//      Hritaban Ghosh (19CS30053)
//      Nakul Aggarwal (19CS10044)


`timescale 1ns / 1ps


// [[ Part C ]] -- Module for 8-Bit Ripple Carry Adder (takes in two 8-bit binary strings
// "x" and "y" and an input-carry bit "carry_in" as inputs; and outputs an 8-bit binary string 
// "sum" and an output-carry bit "carry_out")

module RCA_8_bit ( x , y , carry_in , sum , carry_out ) ;
    input [7:0] x ;     // define "x" as an input binary vector of width 8
    input [7:0] y ;     // define "y" as an input binary vector of width 8
    input carry_in ;    // define "carry_in" as an input
    output [7:0] sum ;  // define "sum" as an output binary vector of width 8
    output carry_out ;  // define "carry_out" as an output

    wire [6:0] output_carrys ;
    // declare a vector of wire-s (width:7) to connect the
    // internal Full_Adder components
    // Note -- "output_carrys[i:i]" is a single-width wire that
    // has the "carry_out" value output by the i-th full-adder.
    // In other words, "output_carrys[i:i]" is a single-width wire
    // that connects the "carry_out"-output-port of i-th full adder
    // to the "carry_in"-input-port of (i+1)-th full adder
    // * {i ranges from 0 to 6 and full adders are indexed from 0 to 7} *

    // Design Description -- Cascade 8 Full Adder components such that carry-out of one
    // full adder is the carry-in of the next (carry bits are getting "rippled").

    Full_Adder FA0 (x[0:0], y[0:0], carry_in, sum[0:0], output_carrys[0:0]) ;               // full adder component 1 -- outputs the 1st least significant bit of "sum"
    Full_Adder FA1 (x[1:1], y[1:1], output_carrys[0:0], sum[1:1], output_carrys[1:1]) ;     // full adder component 2 -- outputs the 2nd least significant bit of "sum"
    Full_Adder FA2 (x[2:2], y[2:2], output_carrys[1:1], sum[2:2], output_carrys[2:2]) ;     // full adder component 3 -- outputs the 3rd least significant bit of "sum"
    Full_Adder FA3 (x[3:3], y[3:3], output_carrys[2:2], sum[3:3], output_carrys[3:3]) ;     // full adder component 4 -- outputs the 4th least significant bit of "sum"
    Full_Adder FA4 (x[4:4], y[4:4], output_carrys[3:3], sum[4:4], output_carrys[4:4]) ;     // full adder component 5 -- outputs the 5th least significant bit of "sum"
    Full_Adder FA5 (x[5:5], y[5:5], output_carrys[4:4], sum[5:5], output_carrys[5:5]) ;     // full adder component 6 -- outputs the 6th least significant bit of "sum"
    Full_Adder FA6 (x[6:6], y[6:6], output_carrys[5:5], sum[6:6], output_carrys[6:6]) ;     // full adder component 7 -- outputs the 7th least significant bit of "sum"
    Full_Adder FA7 (x[7:7], y[7:7], output_carrys[6:6], sum[7:7], carry_out) ;              // full adder component 8 -- outputs the 8th least significant (most significant) bit of "sum"
                                                                                            //                           and also the carry_out bit
endmodule
