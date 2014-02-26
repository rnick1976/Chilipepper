-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\pcore_Examples\FIFO_DEMO\MATLAB\codegen\rx_fifo\hdlsrc\rx_fifo_fixpt.vhd
-- Created: 2013-11-15 16:47:36
-- 
-- Generated by MATLAB 8.2, MATLAB Coder 2.5 and HDL Coder 3.3
-- 
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Design base rate: 1
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        1
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- dout                          ce_out        1
-- empty                         ce_out        1
-- byte_ready                    ce_out        1
-- full                          ce_out        1
-- bytes_available               ce_out        1
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_fifo_fixpt
-- Source Path: rx_fifo_fixpt
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.rx_fifo_fixpt_pkg.ALL;

ENTITY rx_fifo_fixpt IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        get_byte                          :   IN    std_logic;  -- ufix1
        store_byte                        :   IN    std_logic;  -- ufix1
        byte_in                           :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        reset_fifo                        :   IN    std_logic;  -- ufix1
        fifo_enable                       :   IN    std_logic;  -- ufix1
        ce_out                            :   OUT   std_logic;
        dout                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        empty                             :   OUT   std_logic;  -- ufix1
        byte_ready                        :   OUT   std_logic;  -- ufix1
        full                              :   OUT   std_logic;  -- ufix1
        bytes_available                   :   OUT   std_logic_vector(10 DOWNTO 0)  -- ufix11
        );
END rx_fifo_fixpt;


ARCHITECTURE rtl OF rx_fifo_fixpt IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL head_not_empty                   : std_logic;
  SIGNAL tmp                              : std_logic;
  SIGNAL tmp_1                            : std_logic;
  SIGNAL tmp_2                            : std_logic;
  SIGNAL head_not_empty_reg_head_not_empty : std_logic;
  SIGNAL tmp_3                            : std_logic;
  SIGNAL tmp_4                            : std_logic;
  SIGNAL tmp_5                            : std_logic;
  SIGNAL full_1                           : std_logic;  -- ufix1
  SIGNAL empty_1                          : std_logic;  -- ufix1
  SIGNAL tmp_6                            : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tail                             : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_7                            : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_8                            : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL head                             : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_9                            : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_10                           : std_logic;  -- ufix1
  SIGNAL tmp_11                           : std_logic;  -- ufix1
  SIGNAL tmp_12                           : std_logic;  -- ufix1
  SIGNAL p13_tmp                          : std_logic;  -- ufix1
  SIGNAL tmp_13                           : std_logic;  -- ufix1
  SIGNAL handshake                        : std_logic;  -- ufix1
  SIGNAL handshake_reg_handshake          : std_logic;  -- ufix1
  SIGNAL tmp_14                           : std_logic;  -- ufix1
  SIGNAL tmp_15                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL p17_tmp                          : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL head_1                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL head_reg_head                    : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_16                           : std_logic;  -- ufix1
  SIGNAL tmp_17                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL p21_tmp                          : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tail_1                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tail_reg_tail                    : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_18                           : std_logic;
  SIGNAL byte_in_unsigned                 : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_19                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_20                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL p31tmp_sub_cast                  : signed(31 DOWNTO 0);  -- int32
  SIGNAL fifo                             : vector_of_unsigned8(0 TO 1023);  -- ufix8 [1024]
  SIGNAL tmp_21                           : vector_of_unsigned8(0 TO 1023);  -- ufix8 [1024]
  SIGNAL tmp_22                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL byte_out                         : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL byte_out_reg_byte_out            : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_23                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL p19_tmp                          : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL p19_sub_cast                     : signed(31 DOWNTO 0);  -- int32
  SIGNAL dout_1                           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL empty_2                          : std_logic;  -- ufix1
  SIGNAL byte_ready_1                     : std_logic;  -- ufix1
  SIGNAL tmp_24                           : std_logic;  -- ufix1
  SIGNAL tmp_25                           : std_logic;  -- ufix1
  SIGNAL p11_tmp                          : std_logic;  -- ufix1
  SIGNAL byte_ready_2                     : std_logic;  -- ufix1
  SIGNAL full_2                           : std_logic;  -- ufix1
  SIGNAL tmp_26                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_27                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_28                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_29                           : unsigned(10 DOWNTO 0);  -- ufix11

BEGIN
  enb <= clk_enable;

  tmp <= head_not_empty;

  
  tmp_1 <= '1' WHEN (reset_fifo OR ( NOT tmp)) = '1' ELSE
      head_not_empty;

  tmp_2 <= tmp_1;

  head_not_empty_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      head_not_empty_reg_head_not_empty <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        head_not_empty_reg_head_not_empty <= tmp_2;
      END IF;
    END IF;
  END PROCESS head_not_empty_reg_process;

  head_not_empty <= head_not_empty_reg_head_not_empty;

  tmp_3 <= head_not_empty;

  tmp_4 <= head_not_empty;

  --%%%%%%%%%%%%put%%%%%%%%%%%%%%%%%%%%%
  --%%%%%%%%%%%%%get%%%%%%%%%%%%%%%%%%%%%
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  --                                                                          %
  --       Generated by MATLAB 8.2, MATLAB Coder 2.5 and HDL Coder 3.3        %
  --                                                                          %
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  --
  --  First In First Out (FIFO) structure.
  --  This FIFO stores integers.
  --  The FIFO is actually a circular buffer.
  --
  tmp_5 <= head_not_empty;

  full_1 <= '0';

  empty_1 <= '0';

  tail <= tmp_6 + 1;

  
  tmp_7 <= to_unsigned(2#00000000001#, 11) WHEN tail = 1025 ELSE
      tail;

  head <= tmp_8 + 1;

  
  tmp_9 <= to_unsigned(2#00000000001#, 11) WHEN head = 1025 ELSE
      head;

  
  p13_tmp <= '1' WHEN ((get_byte /= '0') AND ( NOT (tmp_10 /= '0'))) AND (tmp_11 = '0') ELSE
      tmp_11;
  
  tmp_12 <= p13_tmp WHEN fifo_enable = '1' ELSE
      tmp_11;

  tmp_13 <= tmp_12;

  handshake_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      handshake_reg_handshake <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        handshake_reg_handshake <= tmp_13;
      END IF;
    END IF;
  END PROCESS handshake_reg_process;

  handshake <= handshake_reg_handshake;

  
  tmp_14 <= '0' WHEN (reset_fifo OR ( NOT tmp_5)) = '1' ELSE
      handshake;

  
  tmp_11 <= '0' WHEN get_byte = '0' ELSE
      tmp_14;

  
  p17_tmp <= tmp_9 WHEN ((get_byte /= '0') AND ( NOT (tmp_10 /= '0'))) AND (tmp_11 = '0') ELSE
      tmp_8;
  
  tmp_15 <= p17_tmp WHEN fifo_enable = '1' ELSE
      tmp_8;

  head_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      head_reg_head <= to_unsigned(2#00000000000#, 11);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        head_reg_head <= tmp_15;
      END IF;
    END IF;
  END PROCESS head_reg_process;

  head_1 <= head_reg_head;

  
  tmp_8 <= to_unsigned(2#00000000001#, 11) WHEN (reset_fifo OR ( NOT tmp_4)) = '1' ELSE
      head_1;

  
  tmp_16 <= '1' WHEN ((tmp_8 = 1) AND (tmp_6 = 1024)) OR ((resize(tmp_6, 12) + 1) = resize(tmp_8, 12)) ELSE
      full_1;

  
  p21_tmp <= tmp_7 WHEN (store_byte /= '0') AND ( NOT (tmp_16 /= '0')) ELSE
      tmp_6;
  
  tmp_17 <= p21_tmp WHEN fifo_enable = '1' ELSE
      tmp_6;

  tail_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tail_reg_tail <= to_unsigned(2#00000000000#, 11);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tail_reg_tail <= tmp_17;
      END IF;
    END IF;
  END PROCESS tail_reg_process;

  tail_1 <= tail_reg_tail;

  
  tmp_6 <= to_unsigned(2#00000000010#, 11) WHEN (reset_fifo OR ( NOT tmp_3)) = '1' ELSE
      tail_1;

  
  tmp_10 <= '1' WHEN ((tmp_6 = 1) AND (tmp_8 = 1024)) OR ((resize(tmp_8, 12) + 1) = resize(tmp_6, 12)) ELSE
      empty_1;

  tmp_18 <= head_not_empty;

  byte_in_unsigned <= unsigned(byte_in);

  --HDL code generation from MATLAB function: rx_fifo_fixpt
  tmp_19 <= byte_in_unsigned;

  p31tmp_sub_cast <= signed(resize(tmp_6, 32));
  tmp_20 <= p31tmp_sub_cast - 1;

  p15_output : PROCESS (fifo_enable, store_byte, tmp_16, fifo, tmp_19, tmp_20)
  BEGIN
    IF fifo_enable = '1' THEN 
      IF (store_byte /= '0') AND ( NOT (tmp_16 /= '0')) THEN 
        tmp_21 <= fifo;
        tmp_21(to_integer(tmp_20)) <= tmp_19;
      ELSE 
        tmp_21 <= fifo;
      END IF;
    ELSE 
      tmp_21 <= fifo;
    END IF;
  END PROCESS p15_output;


  fifo_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      fifo <= (OTHERS => to_unsigned(2#00000000#, 8));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        fifo <= tmp_21;
      END IF;
    END IF;
  END PROCESS fifo_reg_process;


  byte_out_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      byte_out_reg_byte_out <= to_unsigned(2#00000000#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        byte_out_reg_byte_out <= tmp_22;
      END IF;
    END IF;
  END PROCESS byte_out_reg_process;

  byte_out <= byte_out_reg_byte_out;

  
  tmp_23 <= to_unsigned(2#00000000#, 8) WHEN (reset_fifo OR ( NOT tmp_18)) = '1' ELSE
      byte_out;

  p19_sub_cast <= signed(resize(tmp_9, 32));
  
  p19_tmp <= fifo(to_integer(p19_sub_cast - 1)) WHEN ((get_byte /= '0') AND ( NOT (tmp_10 /= '0'))) AND (tmp_11 = '0') ELSE
      tmp_23;
  
  tmp_22 <= p19_tmp WHEN fifo_enable = '1' ELSE
      tmp_23;

  dout_1 <= resize(tmp_22, 32);

  dout <= std_logic_vector(dout_1);

  empty_2 <= tmp_10;

  empty <= empty_2;

  byte_ready_1 <= '0';

  
  tmp_24 <= '1' WHEN tmp_11 = '1' ELSE
      byte_ready_1;

  
  p11_tmp <= '1' WHEN ((get_byte /= '0') AND ( NOT (tmp_10 /= '0'))) AND (tmp_11 = '0') ELSE
      tmp_24;
  
  tmp_25 <= p11_tmp WHEN fifo_enable = '1' ELSE
      tmp_24;

  byte_ready_2 <= tmp_25;

  byte_ready <= byte_ready_2;

  full_2 <= tmp_16;

  full <= full_2;

  -- Section for calculating num bytes in FIFO
  tmp_26 <= tmp_15;

  tmp_27 <= resize(resize(resize(1024 - resize(tmp_15, 12), 13) + resize(tmp_17, 13), 14) - 1, 11);

  tmp_28 <= resize(resize(resize(tmp_17, 12) - resize(tmp_15, 12), 13) - 1, 11);

  
  tmp_29 <= tmp_28 WHEN tmp_26 < tmp_17 ELSE
      tmp_27;

  bytes_available <= std_logic_vector(tmp_29);

  ce_out <= clk_enable;

END rtl;

