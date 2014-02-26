-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\pcore_Branch\Chilipepper\Labs\Lab_3\MATLAB\codegen\mcu_driver\hdlsrc\mcu_driver_pcore.vhd
-- Created: 2013-11-15 16:37:35
-- 
-- Generated by MATLAB 8.2, MATLAB Coder 2.5 and HDL Coder 3.3
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
-- Module: mcu_driver_pcore
-- Source Path: mcu_driver_pcore
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY mcu_driver_pcore IS
  PORT( IPCORE_CLK                        :   IN    std_logic;  -- ufix1
        IPCORE_RESETN                     :   IN    std_logic;  -- ufix1
        init_done                         :   IN    std_logic;  -- ufix1
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
        mcu_reset_out                     :   OUT   std_logic;  -- ufix1
        tr_sw                             :   OUT   std_logic;  -- ufix1
        pa_en                             :   OUT   std_logic;  -- ufix1
        tx_en                             :   OUT   std_logic;  -- ufix1
        rx_en                             :   OUT   std_logic;  -- ufix1
        blinky                            :   OUT   std_logic;  -- ufix1
        AXI_Lite_AWREADY                  :   OUT   std_logic;  -- ufix1
        AXI_Lite_WREADY                   :   OUT   std_logic;  -- ufix1
        AXI_Lite_BRESP                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI_Lite_BVALID                   :   OUT   std_logic;  -- ufix1
        AXI_Lite_ARREADY                  :   OUT   std_logic;  -- ufix1
        AXI_Lite_RDATA                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_RRESP                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI_Lite_RVALID                   :   OUT   std_logic  -- ufix1
        );
END mcu_driver_pcore;


ARCHITECTURE rtl OF mcu_driver_pcore IS

  -- Component Declarations
  COMPONENT mcu_driver_pcore_axi_lite
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
          read_init_done_reg              :   IN    std_logic;  -- ufix1
          read_latch_done                 :   IN    std_logic;  -- ufix1
          read_reg_reset_done             :   IN    std_logic;  -- ufix1
          AXI_Lite_AWREADY                :   OUT   std_logic;  -- ufix1
          AXI_Lite_WREADY                 :   OUT   std_logic;  -- ufix1
          AXI_Lite_BRESP                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI_Lite_BVALID                 :   OUT   std_logic;  -- ufix1
          AXI_Lite_ARREADY                :   OUT   std_logic;  -- ufix1
          AXI_Lite_RDATA                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_RRESP                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI_Lite_RVALID                 :   OUT   std_logic;  -- ufix1
          write_axi_enable                :   OUT   std_logic;  -- ufix1
          write_mcu_reset_in              :   OUT   std_logic;  -- ufix1
          write_tr_sw_reg                 :   OUT   std_logic;  -- ufix1
          write_pa_en_reg                 :   OUT   std_logic;  -- ufix1
          write_tx_en_reg                 :   OUT   std_logic;  -- ufix1
          write_rx_en_reg                 :   OUT   std_logic;  -- ufix1
          write_latch                     :   OUT   std_logic;  -- ufix1
          write_mcu_reg_reset             :   OUT   std_logic;  -- ufix1
          reset_internal                  :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT mcu_driver_pcore_dut
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          dut_enable                      :   IN    std_logic;  -- ufix1
          init_done                       :   IN    std_logic;  -- ufix1
          mcu_reset_in                    :   IN    std_logic;  -- ufix1
          tr_sw_reg                       :   IN    std_logic;  -- ufix1
          pa_en_reg                       :   IN    std_logic;  -- ufix1
          tx_en_reg                       :   IN    std_logic;  -- ufix1
          rx_en_reg                       :   IN    std_logic;  -- ufix1
          latch                           :   IN    std_logic;  -- ufix1
          mcu_reg_reset                   :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          mcu_reset_out                   :   OUT   std_logic;  -- ufix1
          tr_sw                           :   OUT   std_logic;  -- ufix1
          pa_en                           :   OUT   std_logic;  -- ufix1
          tx_en                           :   OUT   std_logic;  -- ufix1
          rx_en                           :   OUT   std_logic;  -- ufix1
          init_done_reg                   :   OUT   std_logic;  -- ufix1
          latch_done                      :   OUT   std_logic;  -- ufix1
          reg_reset_done                  :   OUT   std_logic;  -- ufix1
          blinky                          :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : mcu_driver_pcore_axi_lite
    USE ENTITY work.mcu_driver_pcore_axi_lite(rtl);

  FOR ALL : mcu_driver_pcore_dut
    USE ENTITY work.mcu_driver_pcore_dut(rtl);

  -- Signals
  SIGNAL reset                            : std_logic;
  SIGNAL reset_cm                         : std_logic;  -- ufix1
  SIGNAL reset_internal                   : std_logic;  -- ufix1
  SIGNAL init_done_reg_sig                : std_logic;  -- ufix1
  SIGNAL latch_done_sig                   : std_logic;  -- ufix1
  SIGNAL reg_reset_done_sig               : std_logic;  -- ufix1
  SIGNAL AXI_Lite_BRESP_tmp               : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI_Lite_RDATA_tmp               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Lite_RRESP_tmp               : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL dut_enable                       : std_logic;  -- ufix1
  SIGNAL mcu_reset_in_sig                 : std_logic;  -- ufix1
  SIGNAL tr_sw_reg_sig                    : std_logic;  -- ufix1
  SIGNAL pa_en_reg_sig                    : std_logic;  -- ufix1
  SIGNAL tx_en_reg_sig                    : std_logic;  -- ufix1
  SIGNAL rx_en_reg_sig                    : std_logic;  -- ufix1
  SIGNAL latch_sig                        : std_logic;  -- ufix1
  SIGNAL mcu_reg_reset_sig                : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL mcu_reset_out_sig                : std_logic;  -- ufix1
  SIGNAL tr_sw_sig                        : std_logic;  -- ufix1
  SIGNAL pa_en_sig                        : std_logic;  -- ufix1
  SIGNAL tx_en_sig                        : std_logic;  -- ufix1
  SIGNAL rx_en_sig                        : std_logic;  -- ufix1
  SIGNAL blinky_sig                       : std_logic;  -- ufix1

BEGIN
  u_mcu_driver_pcore_axi_lite_inst : mcu_driver_pcore_axi_lite
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
              read_init_done_reg => init_done_reg_sig,  -- ufix1
              read_latch_done => latch_done_sig,  -- ufix1
              read_reg_reset_done => reg_reset_done_sig,  -- ufix1
              AXI_Lite_AWREADY => AXI_Lite_AWREADY,  -- ufix1
              AXI_Lite_WREADY => AXI_Lite_WREADY,  -- ufix1
              AXI_Lite_BRESP => AXI_Lite_BRESP_tmp,  -- ufix2
              AXI_Lite_BVALID => AXI_Lite_BVALID,  -- ufix1
              AXI_Lite_ARREADY => AXI_Lite_ARREADY,  -- ufix1
              AXI_Lite_RDATA => AXI_Lite_RDATA_tmp,  -- ufix32
              AXI_Lite_RRESP => AXI_Lite_RRESP_tmp,  -- ufix2
              AXI_Lite_RVALID => AXI_Lite_RVALID,  -- ufix1
              write_axi_enable => dut_enable,  -- ufix1
              write_mcu_reset_in => mcu_reset_in_sig,  -- ufix1
              write_tr_sw_reg => tr_sw_reg_sig,  -- ufix1
              write_pa_en_reg => pa_en_reg_sig,  -- ufix1
              write_tx_en_reg => tx_en_reg_sig,  -- ufix1
              write_rx_en_reg => rx_en_reg_sig,  -- ufix1
              write_latch => latch_sig,  -- ufix1
              write_mcu_reg_reset => mcu_reg_reset_sig,  -- ufix1
              reset_internal => reset_internal  -- ufix1
              );

  u_mcu_driver_pcore_dut_inst : mcu_driver_pcore_dut
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset => reset,
              dut_enable => dut_enable,  -- ufix1
              init_done => init_done,  -- ufix1
              mcu_reset_in => mcu_reset_in_sig,  -- ufix1
              tr_sw_reg => tr_sw_reg_sig,  -- ufix1
              pa_en_reg => pa_en_reg_sig,  -- ufix1
              tx_en_reg => tx_en_reg_sig,  -- ufix1
              rx_en_reg => rx_en_reg_sig,  -- ufix1
              latch => latch_sig,  -- ufix1
              mcu_reg_reset => mcu_reg_reset_sig,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              mcu_reset_out => mcu_reset_out_sig,  -- ufix1
              tr_sw => tr_sw_sig,  -- ufix1
              pa_en => pa_en_sig,  -- ufix1
              tx_en => tx_en_sig,  -- ufix1
              rx_en => rx_en_sig,  -- ufix1
              init_done_reg => init_done_reg_sig,  -- ufix1
              latch_done => latch_done_sig,  -- ufix1
              reg_reset_done => reg_reset_done_sig,  -- ufix1
              blinky => blinky_sig  -- ufix1
              );

  reset_cm <=  NOT IPCORE_RESETN;

  reset <= reset_cm OR reset_internal;

  mcu_reset_out <= mcu_reset_out_sig;

  tr_sw <= tr_sw_sig;

  pa_en <= pa_en_sig;

  tx_en <= tx_en_sig;

  rx_en <= rx_en_sig;

  blinky <= blinky_sig;

  AXI_Lite_BRESP <= AXI_Lite_BRESP_tmp;

  AXI_Lite_RDATA <= AXI_Lite_RDATA_tmp;

  AXI_Lite_RRESP <= AXI_Lite_RRESP_tmp;

END rtl;

