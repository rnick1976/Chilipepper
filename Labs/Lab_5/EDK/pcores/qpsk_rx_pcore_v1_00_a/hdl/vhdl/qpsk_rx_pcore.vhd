-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\QPSK_Pcore\Labs\Lab_5\MATLAB\codegen\qpsk_rx\hdlsrc\qpsk_rx_pcore.vhd
-- Created: 2014-01-02 17:49:14
-- 
-- Generated by MATLAB 8.3, MATLAB Coder 2.6 and HDL Coder 3.4
-- 
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: -1
-- Target subsystem base rate: -1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: qpsk_rx_pcore
-- Source Path: qpsk_rx_pcore
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY qpsk_rx_pcore IS
  PORT( IPCORE_CLK                        :   IN    std_logic;  -- ufix1
        IPCORE_RESETN                     :   IN    std_logic;  -- ufix1
        i_in                              :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
        q_in                              :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
        AXI_Lite_ACLK                     :   IN    std_logic;  -- ufix1
        AXI_Lite_ARESETN                  :   IN    std_logic;  -- ufix1
        AXI_Lite_AWADDR                   :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_AWVALID                  :   IN    std_logic;  -- ufix1
        AXI_Lite_WDATA                    :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_WSTRB                    :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        AXI_Lite_WVALID                   :   IN    std_logic;  -- ufix1
        AXI_Lite_BREADY                   :   IN    std_logic;  -- ufix1
        AXI_Lite_ARADDR                   :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_ARVALID                  :   IN    std_logic;  -- ufix1
        AXI_Lite_RREADY                   :   IN    std_logic;  -- ufix1
        s_f_i                             :   OUT   std_logic_vector(25 DOWNTO 0);  -- ufix26
        s_f_q                             :   OUT   std_logic_vector(25 DOWNTO 0);  -- ufix26
        blinky                            :   OUT   std_logic;  -- ufix1
        f_est                             :   OUT   std_logic_vector(13 DOWNTO 0);  -- ufix14
        AXI_Lite_AWREADY                  :   OUT   std_logic;  -- ufix1
        AXI_Lite_WREADY                   :   OUT   std_logic;  -- ufix1
        AXI_Lite_BRESP                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI_Lite_BVALID                   :   OUT   std_logic;  -- ufix1
        AXI_Lite_ARREADY                  :   OUT   std_logic;  -- ufix1
        AXI_Lite_RDATA                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_RRESP                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI_Lite_RVALID                   :   OUT   std_logic  -- ufix1
        );
END qpsk_rx_pcore;


ARCHITECTURE rtl OF qpsk_rx_pcore IS

  -- Component Declarations
  COMPONENT qpsk_rx_pcore_axi_lite
    PORT( reset                           :   IN    std_logic;
          AXI_Lite_ACLK                   :   IN    std_logic;  -- ufix1
          AXI_Lite_ARESETN                :   IN    std_logic;  -- ufix1
          AXI_Lite_AWADDR                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_AWVALID                :   IN    std_logic;  -- ufix1
          AXI_Lite_WDATA                  :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_WSTRB                  :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          AXI_Lite_WVALID                 :   IN    std_logic;  -- ufix1
          AXI_Lite_BREADY                 :   IN    std_logic;  -- ufix1
          AXI_Lite_ARADDR                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_ARVALID                :   IN    std_logic;  -- ufix1
          AXI_Lite_RREADY                 :   IN    std_logic;  -- ufix1
          AXI_Lite_AWREADY                :   OUT   std_logic;  -- ufix1
          AXI_Lite_WREADY                 :   OUT   std_logic;  -- ufix1
          AXI_Lite_BRESP                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI_Lite_BVALID                 :   OUT   std_logic;  -- ufix1
          AXI_Lite_ARREADY                :   OUT   std_logic;  -- ufix1
          AXI_Lite_RDATA                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_RRESP                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI_Lite_RVALID                 :   OUT   std_logic;  -- ufix1
          write_axi_enable                :   OUT   std_logic;  -- ufix1
          reset_internal                  :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT qpsk_rx_pcore_dut
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          dut_enable                      :   IN    std_logic;  -- ufix1
          i_in                            :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
          q_in                            :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
          ce_out                          :   OUT   std_logic;  -- ufix1
          s_f_i                           :   OUT   std_logic_vector(25 DOWNTO 0);  -- sfix26_En12
          s_f_q                           :   OUT   std_logic_vector(25 DOWNTO 0);  -- sfix26_En12
          blinky                          :   OUT   std_logic;  -- ufix1
          f_est                           :   OUT   std_logic_vector(13 DOWNTO 0)  -- sfix14_En12
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : qpsk_rx_pcore_axi_lite
    USE ENTITY work.qpsk_rx_pcore_axi_lite(rtl);

  FOR ALL : qpsk_rx_pcore_dut
    USE ENTITY work.qpsk_rx_pcore_dut(rtl);

  -- Signals
  SIGNAL reset                            : std_logic;
  SIGNAL reset_cm                         : std_logic;  -- ufix1
  SIGNAL reset_internal                   : std_logic;  -- ufix1
  SIGNAL AXI_Lite_BRESP_tmp               : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI_Lite_RDATA_tmp               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Lite_RRESP_tmp               : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL dut_enable                       : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL s_f_i_sig                        : std_logic_vector(25 DOWNTO 0);  -- ufix26
  SIGNAL s_f_q_sig                        : std_logic_vector(25 DOWNTO 0);  -- ufix26
  SIGNAL blinky_sig                       : std_logic;  -- ufix1
  SIGNAL f_est_sig                        : std_logic_vector(13 DOWNTO 0);  -- ufix14

BEGIN
  u_qpsk_rx_pcore_axi_lite_inst : qpsk_rx_pcore_axi_lite
    PORT MAP( reset => reset,
              AXI_Lite_ACLK => AXI_Lite_ACLK,  -- ufix1
              AXI_Lite_ARESETN => AXI_Lite_ARESETN,  -- ufix1
              AXI_Lite_AWADDR => AXI_Lite_AWADDR,  -- ufix32
              AXI_Lite_AWVALID => AXI_Lite_AWVALID,  -- ufix1
              AXI_Lite_WDATA => AXI_Lite_WDATA,  -- ufix32
              AXI_Lite_WSTRB => AXI_Lite_WSTRB,  -- ufix4
              AXI_Lite_WVALID => AXI_Lite_WVALID,  -- ufix1
              AXI_Lite_BREADY => AXI_Lite_BREADY,  -- ufix1
              AXI_Lite_ARADDR => AXI_Lite_ARADDR,  -- ufix32
              AXI_Lite_ARVALID => AXI_Lite_ARVALID,  -- ufix1
              AXI_Lite_RREADY => AXI_Lite_RREADY,  -- ufix1
              AXI_Lite_AWREADY => AXI_Lite_AWREADY,  -- ufix1
              AXI_Lite_WREADY => AXI_Lite_WREADY,  -- ufix1
              AXI_Lite_BRESP => AXI_Lite_BRESP_tmp,  -- ufix2
              AXI_Lite_BVALID => AXI_Lite_BVALID,  -- ufix1
              AXI_Lite_ARREADY => AXI_Lite_ARREADY,  -- ufix1
              AXI_Lite_RDATA => AXI_Lite_RDATA_tmp,  -- ufix32
              AXI_Lite_RRESP => AXI_Lite_RRESP_tmp,  -- ufix2
              AXI_Lite_RVALID => AXI_Lite_RVALID,  -- ufix1
              write_axi_enable => dut_enable,  -- ufix1
              reset_internal => reset_internal  -- ufix1
              );

  u_qpsk_rx_pcore_dut_inst : qpsk_rx_pcore_dut
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset => reset,
              dut_enable => dut_enable,  -- ufix1
              i_in => i_in,  -- sfix12
              q_in => q_in,  -- sfix12
              ce_out => ce_out_sig,  -- ufix1
              s_f_i => s_f_i_sig,  -- sfix26_En12
              s_f_q => s_f_q_sig,  -- sfix26_En12
              blinky => blinky_sig,  -- ufix1
              f_est => f_est_sig  -- sfix14_En12
              );

  reset_cm <=  NOT IPCORE_RESETN;

  reset <= reset_cm OR reset_internal;

  blinky <= blinky_sig;

  s_f_i <= s_f_i_sig;

  s_f_q <= s_f_q_sig;

  f_est <= f_est_sig;

  AXI_Lite_BRESP <= AXI_Lite_BRESP_tmp;

  AXI_Lite_RDATA <= AXI_Lite_RDATA_tmp;

  AXI_Lite_RRESP <= AXI_Lite_RRESP_tmp;

END rtl;

