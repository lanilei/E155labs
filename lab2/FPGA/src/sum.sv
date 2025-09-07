// lab 2: Multiplexed 7-segment display
//adds s1 and s2 to ddisplay on five leds 
// Leilani Elkaslasy
//lelkaslasy@g.hmc.edu
// 09/11/25

module sum(
            input  logic [3:0] s1, s2,
            output logic [4:0] sum);

        assign sum = s1 + s2;

endmodule