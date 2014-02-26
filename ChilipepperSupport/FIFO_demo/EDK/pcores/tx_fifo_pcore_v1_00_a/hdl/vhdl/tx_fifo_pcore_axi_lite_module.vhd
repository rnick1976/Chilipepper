-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\pcore_Examples\FIFO_DEMO\MATLAB\codegen\tx_fifo\hdlsrc\tx_fifo_pcore_axi_lite_module.vhd
-- Created: 2013-11-15 16:46:06
-- 
-- Generated by MATLAB 8.2, MATLAB Coder 2.5 and HDL Coder 3.3
-- 
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: tx_fifo_pcore_axi_lite_module
-- Source Path: tx_fifo_pcore/tx_fifo_pcore_axi_lite/tx_fifo_pcore_axi_lite_module
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY tx_fifo_pcore_axi_lite_module IS
  PORT( clk                               :   IN    std_logic;
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
        data_read                         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_AWREADY                  :   OUT   std_logic;  -- ufix1
        AXI_Lite_WREADY                   :   OUT   std_logic;  -- ufix1
        AXI_Lite_BRESP                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI_Lite_BVALID                   :   OUT   std_logic;  -- ufix1
        AXI_Lite_ARREADY                  :   OUT   std_logic;  -- ufix1
        AXI_Lite_RDATA                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_RRESP                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI_Lite_RVALID                   :   OUT   std_logic;  -- ufix1
        data_write                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        addr_sel                          :   OUT   std_logic_vector(13 DOWNTO 0);  -- ufix14
        wr_enb                            :   OUT   std_logic;  -- ufix1
        rd_enb                            :   OUT   std_logic;  -- ufix1
        reset_internal                    :   OUT   std_logic  -- ufix1
        );
END tx_fifo_pcore_axi_lite_module;


ARCHITECTURE rtl OF tx_fifo_pcore_axi_lite_module IS

  -- Signals
  SIGNAL reset                            : std_logic;
  SIGNAL enb                              : std_logic;
  SIGNAL const_1                          : std_logic;  -- ufix1
  SIGNAL axi_lite_wstate                  : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL axi_lite_rstate                  : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL axi_lite_wstate_next             : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL axi_lite_rstate_next             : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL aw_transfer                      : std_logic;  -- ufix1
  SIGNAL w_transfer                       : std_logic;  -- ufix1
  SIGNAL ar_transfer                      : std_logic;  -- ufix1
  SIGNAL const_0_2                        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL data_read_unsigned               : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Lite_RDATA_tmp               : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Lite_WDATA_unsigned          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL wdata                            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Lite_AWADDR_unsigned         : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL waddr                            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL waddr_sel                        : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL AXI_Lite_ARADDR_unsigned         : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL raddr_sel                        : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL addr_sel_tmp                     : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL wr_enb_1                         : std_logic;  -- ufix1
  SIGNAL strobe_addr                      : std_logic;  -- ufix1
  SIGNAL strobe_sel                       : std_logic;  -- ufix1
  SIGNAL const_zero                       : std_logic;  -- ufix1
  SIGNAL strobe_in                        : std_logic;  -- ufix1
  SIGNAL strobe_sw                        : std_logic;  -- ufix1
  SIGNAL soft_reset                       : std_logic;  -- ufix1

BEGIN
  const_1 <= '1';

  enb <= const_1;

  reset <=  NOT AXI_Lite_ARESETN;

  axi_lite_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      axi_lite_wstate <= to_unsigned(2#00000000#, 8);
      axi_lite_rstate <= to_unsigned(2#00000000#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        axi_lite_wstate <= axi_lite_wstate_next;
        axi_lite_rstate <= axi_lite_rstate_next;
      END IF;
    END IF;
  END PROCESS axi_lite_process;

  axi_lite_output : PROCESS (axi_lite_wstate, axi_lite_rstate, AXI_Lite_AWVALID, AXI_Lite_WVALID,
       AXI_Lite_BREADY, AXI_Lite_ARVALID, AXI_Lite_RREADY)
    VARIABLE out0 : std_logic;
    VARIABLE out1 : std_logic;
    VARIABLE out3 : std_logic;
    VARIABLE awvalid : std_logic;
    VARIABLE wvalid : std_logic;
    VARIABLE arvalid : std_logic;
  BEGIN
    axi_lite_wstate_next <= axi_lite_wstate;
    axi_lite_rstate_next <= axi_lite_rstate;
    IF AXI_Lite_AWVALID /= '0' THEN 
      awvalid := '1';
    ELSE 
      awvalid := '0';
    END IF;
    IF AXI_Lite_WVALID /= '0' THEN 
      wvalid := '1';
    ELSE 
      wvalid := '0';
    END IF;
    IF AXI_Lite_ARVALID /= '0' THEN 
      arvalid := '1';
    ELSE 
      arvalid := '0';
    END IF;

    CASE axi_lite_wstate IS
      WHEN "00000000" =>
        out0 := '1';
        out1 := '0';
        AXI_Lite_BVALID <= '0';
        IF awvalid = '1' THEN 
          axi_lite_wstate_next <= to_unsigned(2#00000001#, 8);
        ELSE 
          axi_lite_wstate_next <= to_unsigned(2#00000000#, 8);
        END IF;
      WHEN "00000001" =>
        out0 := '0';
        out1 := '1';
        AXI_Lite_BVALID <= '0';
        IF wvalid = '1' THEN 
          axi_lite_wstate_next <= to_unsigned(2#00000010#, 8);
        ELSE 
          axi_lite_wstate_next <= to_unsigned(2#00000001#, 8);
        END IF;
      WHEN "00000010" =>
        out0 := '0';
        out1 := '0';
        AXI_Lite_BVALID <= '1';
        IF AXI_Lite_BREADY /= '0' THEN 
          axi_lite_wstate_next <= to_unsigned(2#00000000#, 8);
        ELSE 
          axi_lite_wstate_next <= to_unsigned(2#00000010#, 8);
        END IF;
      WHEN OTHERS => 
        out0 := '0';
        out1 := '0';
        AXI_Lite_BVALID <= '0';
        axi_lite_wstate_next <= to_unsigned(2#00000000#, 8);
    END CASE;


    CASE axi_lite_rstate IS
      WHEN "00000000" =>
        out3 := '1';
        AXI_Lite_RVALID <= '0';
        IF arvalid = '1' THEN 
          axi_lite_rstate_next <= to_unsigned(2#00000001#, 8);
        ELSE 
          axi_lite_rstate_next <= to_unsigned(2#00000000#, 8);
        END IF;
      WHEN "00000001" =>
        out3 := '0';
        AXI_Lite_RVALID <= '1';
        IF AXI_Lite_RREADY /= '0' THEN 
          axi_lite_rstate_next <= to_unsigned(2#00000000#, 8);
        ELSE 
          axi_lite_rstate_next <= to_unsigned(2#00000001#, 8);
        END IF;
      WHEN OTHERS => 
        out3 := '0';
        AXI_Lite_RVALID <= '0';
        axi_lite_rstate_next <= to_unsigned(2#00000000#, 8);
    END CASE;

    AXI_Lite_AWREADY <= out0;
    AXI_Lite_WREADY <= out1;
    AXI_Lite_ARREADY <= out3;
    aw_transfer <= awvalid AND out0;
    w_transfer <= wvalid AND out1;
    ar_transfer <= arvalid AND out3;
  END PROCESS axi_lite_output;


  const_0_2 <= to_unsigned(2#00#, 2);

  AXI_Lite_BRESP <= std_logic_vector(const_0_2);

  data_read_unsigned <= unsigned(data_read);

  reg_rdata_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      AXI_Lite_RDATA_tmp <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND ar_transfer = '1' THEN
        AXI_Lite_RDATA_tmp <= data_read_unsigned;
      END IF;
    END IF;
  END PROCESS reg_rdata_process;


  AXI_Lite_RDATA <= std_logic_vector(AXI_Lite_RDATA_tmp);

  AXI_Lite_RRESP <= std_logic_vector(const_0_2);

  AXI_Lite_WDATA_unsigned <= unsigned(AXI_Lite_WDATA);

  reg_wdata_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      wdata <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND w_transfer = '1' THEN
        wdata <= AXI_Lite_WDATA_unsigned;
      END IF;
    END IF;
  END PROCESS reg_wdata_process;


  data_write <= std_logic_vector(wdata);

  AXI_Lite_AWADDR_unsigned <= unsigned(AXI_Lite_AWADDR);

  reg_waddr_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      waddr <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND aw_transfer = '1' THEN
        waddr <= AXI_Lite_AWADDR_unsigned;
      END IF;
    END IF;
  END PROCESS reg_waddr_process;


  waddr_sel <= waddr(15 DOWNTO 2);

  AXI_Lite_ARADDR_unsigned <= unsigned(AXI_Lite_ARADDR);

  raddr_sel <= AXI_Lite_ARADDR_unsigned(15 DOWNTO 2);

  
  addr_sel_tmp <= waddr_sel WHEN AXI_Lite_ARVALID = '0' ELSE
      raddr_sel;

  addr_sel <= std_logic_vector(addr_sel_tmp);

  reg_wr_enb_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      wr_enb_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        wr_enb_1 <= w_transfer;
      END IF;
    END IF;
  END PROCESS reg_wr_enb_process;


  rd_enb <= ar_transfer;

  
  strobe_addr <= '1' WHEN waddr_sel = 0 ELSE
      '0';

  strobe_sel <= strobe_addr AND wr_enb_1;

  const_zero <= '0';

  strobe_in <= wdata(0);

  
  strobe_sw <= const_zero WHEN strobe_sel = '0' ELSE
      strobe_in;

  reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      soft_reset <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        soft_reset <= strobe_sw;
      END IF;
    END IF;
  END PROCESS reg_process;


  reset_internal <= reset OR soft_reset;

  wr_enb <= wr_enb_1;

END rtl;

