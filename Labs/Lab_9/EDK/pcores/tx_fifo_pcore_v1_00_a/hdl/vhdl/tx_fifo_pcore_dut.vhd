-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\QPSK_Pcore\Labs\Lab_3\MATLAB\codegen\tx_fifo\hdlsrc\tx_fifo_pcore_dut.vhd
-- Created: 2014-01-02 13:50:14
-- 
-- Generated by MATLAB 8.3, MATLAB Coder 2.6 and HDL Coder 3.4
-- 
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: tx_fifo_pcore_dut
-- Source Path: tx_fifo_pcore/tx_fifo_pcore_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY tx_fifo_pcore_dut IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        reset_fifo                        :   IN    std_logic;  -- ufix1
        store_byte                        :   IN    std_logic;  -- ufix1
        byte_in                           :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        get_byte                          :   IN    std_logic;  -- ufix1
        ce_out                            :   OUT   std_logic;  -- ufix1
        dout                              :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
        bytes_available                   :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
        byte_received                     :   OUT   std_logic;  -- ufix1
        empty                             :   OUT   std_logic  -- ufix1
        );
END tx_fifo_pcore_dut;


ARCHITECTURE rtl OF tx_fifo_pcore_dut IS

  -- Component Declarations
  COMPONENT tx_fifo_fixpt
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset                           :   IN    std_logic;
          reset_fifo                      :   IN    std_logic;  -- ufix1
          store_byte                      :   IN    std_logic;  -- ufix1
          byte_in                         :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          get_byte                        :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          dout                            :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          bytes_available                 :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
          byte_received                   :   OUT   std_logic;  -- ufix1
          empty                           :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : tx_fifo_fixpt
    USE ENTITY work.tx_fifo_fixpt(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL reset_fifo_sig                   : std_logic;  -- ufix1
  SIGNAL store_byte_sig                   : std_logic;  -- ufix1
  SIGNAL get_byte_sig                     : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL dout_sig                         : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL bytes_available_sig              : std_logic_vector(9 DOWNTO 0);  -- ufix10
  SIGNAL byte_received_sig                : std_logic;  -- ufix1
  SIGNAL empty_sig                        : std_logic;  -- ufix1

BEGIN
  u_tx_fifo_fixpt : tx_fifo_fixpt
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset => reset,
              reset_fifo => reset_fifo_sig,  -- ufix1
              store_byte => store_byte_sig,  -- ufix1
              byte_in => byte_in,  -- ufix8
              get_byte => get_byte_sig,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              dout => dout_sig,  -- ufix8
              bytes_available => bytes_available_sig,  -- ufix10
              byte_received => byte_received_sig,  -- ufix1
              empty => empty_sig  -- ufix1
              );

  reset_fifo_sig <= reset_fifo;

  store_byte_sig <= store_byte;

  get_byte_sig <= get_byte;

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  dout <= dout_sig;

  bytes_available <= bytes_available_sig;

  byte_received <= byte_received_sig;

  empty <= empty_sig;

END rtl;

