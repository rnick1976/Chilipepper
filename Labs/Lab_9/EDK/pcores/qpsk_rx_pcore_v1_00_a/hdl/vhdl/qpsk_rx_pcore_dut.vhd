-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\QPSK_Pcore\Labs\Lab_8\MATLAB\codegen\qpsk_rx\hdlsrc\qpsk_rx_pcore_dut.vhd
-- Created: 2013-12-31 17:51:53
-- 
-- Generated by MATLAB 8.3, MATLAB Coder 2.6 and HDL Coder 3.4
-- 
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: qpsk_rx_pcore_dut
-- Source Path: qpsk_rx_pcore/qpsk_rx_pcore_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY qpsk_rx_pcore_dut IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        i_in                              :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        q_in                              :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        mcu_rx_ready_in                   :   IN    std_logic;  -- ufix1
        ce_out                            :   OUT   std_logic;  -- ufix1
        store_byte                        :   OUT   std_logic;  -- ufix1
        byte                              :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
        num_bytes_ready                   :   OUT   std_logic_vector(4 DOWNTO 0);  -- ufix5
        clear_fifo_out                    :   OUT   std_logic;  -- ufix1
        blinky                            :   OUT   std_logic  -- ufix1
        );
END qpsk_rx_pcore_dut;


ARCHITECTURE rtl OF qpsk_rx_pcore_dut IS

  -- Component Declarations
  COMPONENT qpsk_rx_fixpt
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset                           :   IN    std_logic;
          i_in                            :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
          q_in                            :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
          mcu_rx_ready_in                 :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          store_byte                      :   OUT   std_logic;  -- ufix1
          byte                            :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          num_bytes_ready                 :   OUT   std_logic_vector(4 DOWNTO 0);  -- ufix5
          clear_fifo_out                  :   OUT   std_logic;  -- ufix1
          blinky                          :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : qpsk_rx_fixpt
    USE ENTITY work.qpsk_rx_fixpt(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL mcu_rx_ready_in_sig              : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL store_byte_sig                   : std_logic;  -- ufix1
  SIGNAL byte_sig                         : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL num_bytes_ready_sig              : std_logic_vector(4 DOWNTO 0);  -- ufix5
  SIGNAL clear_fifo_out_sig               : std_logic;  -- ufix1
  SIGNAL blinky_sig                       : std_logic;  -- ufix1

BEGIN
  u_qpsk_rx_fixpt : qpsk_rx_fixpt
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset => reset,
              i_in => i_in,  -- sfix12
              q_in => q_in,  -- sfix12
              mcu_rx_ready_in => mcu_rx_ready_in_sig,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              store_byte => store_byte_sig,  -- ufix1
              byte => byte_sig,  -- ufix8
              num_bytes_ready => num_bytes_ready_sig,  -- ufix5
              clear_fifo_out => clear_fifo_out_sig,  -- ufix1
              blinky => blinky_sig  -- ufix1
              );

  mcu_rx_ready_in_sig <= mcu_rx_ready_in;

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  store_byte <= store_byte_sig;

  byte <= byte_sig;

  num_bytes_ready <= num_bytes_ready_sig;

  clear_fifo_out <= clear_fifo_out_sig;

  blinky <= blinky_sig;

END rtl;

