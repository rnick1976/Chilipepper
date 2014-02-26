%#codegen
function [rx_i, rx_q, blinky] = adc_driver(rxd, rx_iq_sel)
% deinterleave txd into I and Q channels
    persistent i_out q_out i_out_delay blinky_cnt

    if isempty(i_out)
        i_out = 0;
        q_out = 0;
        i_out_delay = 0;
        blinky_cnt = 0;
    end

    if rx_iq_sel == 0
        i_out_delay = rxd;
    else
        i_out = i_out_delay;
        q_out = rxd;
    end
    % ADC runs at 2x the rate the output changes at
        rx_i = i_out;
        rx_q = q_out;
        
    blinky_cnt = blinky_cnt + 1;
    if blinky_cnt == 20000000
        blinky_cnt = 0;
    end
    blinky = floor(blinky_cnt/10000000);
end