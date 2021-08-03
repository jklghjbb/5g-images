Active_gNBs = ( "gNB-Eurecom-DU");
# Asn1_verbosity, choice in: none, info, annoying
Asn1_verbosity = "none";

gNBs =
(
 {
    ////////// Identification parameters:
    gNB_ID    =  0xe00;
    gNB_name  =  "gNB-Eurecom-DU";

    // Tracking area code, 0x0000 and 0xfffe are reserved values
    tracking_area_code  =  ${TAC};
    plmn_list = ({
                  mcc = ${MCC};
                  mnc = ${MNC};
                  mnc_length = 2;
                  snssaiList = (
                    {
                      sst = 1;
                      sd  = 0x1; // 0 false, else true
                    },
                    {
                      sst = 1;
                      sd  = 0x112233; // 0 false, else true
                    }
                  );

                  });

    nr_cellid = 12345678L;

    ////////// Physical parameters:

    ssb_SubcarrierOffset                                      = 0;
    pdsch_AntennaPorts                                        = 1;
    pusch_AntennaPorts                                        = 1;

     pdcch_ConfigSIB1 = (
      {
        controlResourceSetZero = 12;
        searchSpaceZero = 0;
      }
      );

    servingCellConfigCommon = (
    {
 #spCellConfigCommon

      physCellId                                                    = 0;

#  downlinkConfigCommon
    #frequencyInfoDL
      # this is 3600 MHz + 43 PRBs@30kHz SCS (same as initial BWP)
      absoluteFrequencySSB                                             = 641280;
      dl_frequencyBand                                                 = 78;
      # this is 3600 MHz
      dl_absoluteFrequencyPointA                                       = 640008;
      #scs-SpecificCarrierList
        dl_offstToCarrier                                              = 0;
# subcarrierSpacing
# 0=kHz15, 1=kHz30, 2=kHz60, 3=kHz120
        dl_subcarrierSpacing                                           = 1;
        dl_carrierBandwidth                                            = 106;
     #initialDownlinkBWP
      #genericParameters
        # this is RBstart=27,L=48 (275*(L-1))+RBstart
        initialDLBWPlocationAndBandwidth                               = 12952; # 6366 12925 12956 28875 12952
# subcarrierSpacing
# 0=kHz15, 1=kHz30, 2=kHz60, 3=kHz120
        initialDLBWPsubcarrierSpacing                                   = 1;
      #pdcch-ConfigCommon
        initialDLBWPcontrolResourceSetZero                              = 12;
        initialDLBWPsearchSpaceZero                                     = 0;
      #pdsch-ConfigCommon
        #pdschTimeDomainAllocationList (up to 16 entries)
        initialDLBWPk0_0                    = 0;  #for DL slot
        initialDLBWPmappingType_0           = 0;  #0=typeA,1=typeB
        initialDLBWPstartSymbolAndLength_0  = 40; #this is SS=1,L=13

        initialDLBWPk0_1                    = 0;  #for mixed slot
        initialDLBWPmappingType_1           = 0;
        initialDLBWPstartSymbolAndLength_1  = 57; #this is SS=1,L=5

  #uplinkConfigCommon
     #frequencyInfoUL
      ul_frequencyBand                                              = 78;
      #scs-SpecificCarrierList
      ul_offstToCarrier                                             = 0;
# subcarrierSpacing
# 0=kHz15, 1=kHz30, 2=kHz60, 3=kHz120
      ul_subcarrierSpacing                                          = 1;
      ul_carrierBandwidth                                           = 106;
      pMax                                                          = 20;
     #initialUplinkBWP
      #genericParameters
        initialULBWPlocationAndBandwidth                            = 12952;
# subcarrierSpacing
# 0=kHz15, 1=kHz30, 2=kHz60, 3=kHz120
        initialULBWPsubcarrierSpacing                               = 1;
      #rach-ConfigCommon
        #rach-ConfigGeneric
          prach_ConfigurationIndex                                  = 98;
#prach_msg1_FDM
#0 = one, 1=two, 2=four, 3=eight
          prach_msg1_FDM                                            = 0;
          prach_msg1_FrequencyStart                                 = 0;
          zeroCorrelationZoneConfig                                 = 13;
          preambleReceivedTargetPower                               = -96;
#preamblTransMax (0...10) = (3,4,5,6,7,8,10,20,50,100,200)
          preambleTransMax                                          = 6;
#powerRampingStep
# 0=dB0,1=dB2,2=dB4,3=dB6
        powerRampingStep                                            = 1;
#ra_ReponseWindow
#1,2,4,8,10,20,40,80
        ra_ResponseWindow                                           = 4;
#ssb_perRACH_OccasionAndCB_PreamblesPerSSB_PR
#1=oneeighth,2=onefourth,3=half,4=one,5=two,6=four,7=eight,8=sixteen
        ssb_perRACH_OccasionAndCB_PreamblesPerSSB_PR                = 4;
#oneHalf (0..15) 4,8,12,16,...60,64
        ssb_perRACH_OccasionAndCB_PreamblesPerSSB                   = 14;
#ra_ContentionResolutionTimer
#(0..7) 8,16,24,32,40,48,56,64
        ra_ContentionResolutionTimer                                = 7;
        rsrp_ThresholdSSB                                           = 19;
#prach-RootSequenceIndex_PR
#1 = 839, 2 = 139
        prach_RootSequenceIndex_PR                                  = 2;
        prach_RootSequenceIndex                                     = 1;
        # SCS for msg1, can only be 15 for 30 kHz < 6 GHz, takes precendence over the one derived from prach-ConfigIndex
        #
        msg1_SubcarrierSpacing                                      = 1,
# restrictedSetConfig
# 0=unrestricted, 1=restricted type A, 2=restricted type B
        restrictedSetConfig                                         = 0,

      # pusch-ConfigCommon (up to 16 elements)
        initialULBWPk2_0                      = 6;  # used for UL slot
        initialULBWPmappingType_0             = 1
        initialULBWPstartSymbolAndLength_0    = 41; # this is SS=0 L=13

        initialULBWPk2_1                      = 6;  # used for mixed slot
        initialULBWPmappingType_1             = 1;
        initialULBWPstartSymbolAndLength_1    = 69; # this is SS=0 L=12

        initialULBWPk2_2                      = 7;  # used for Msg.3 during RA
        initialULBWPmappingType_2             = 1;
        initialULBWPstartSymbolAndLength_2    = 52; # this is SS=10 L=4

        msg3_DeltaPreamble                                          = 1;
        p0_NominalWithGrant                                         =-90;

# pucch-ConfigCommon setup :
# pucchGroupHopping
# 0 = neither, 1= group hopping, 2=sequence hopping
        pucchGroupHopping                                           = 0;
        hoppingId                                                   = 40;
        p0_nominal                                                  = -90;
# ssb_PositionsInBurs_BitmapPR
# 1=short, 2=medium, 3=long
      ssb_PositionsInBurst_PR                                       = 2;
      ssb_PositionsInBurst_Bitmap                                   = 1;

# ssb_periodicityServingCell
# 0 = ms5, 1=ms10, 2=ms20, 3=ms40, 4=ms80, 5=ms160, 6=spare2, 7=spare1
      ssb_periodicityServingCell                                    = 2;

# dmrs_TypeA_position
# 0 = pos2, 1 = pos3
      dmrs_TypeA_Position                                           = 0;

# subcarrierSpacing
# 0=kHz15, 1=kHz30, 2=kHz60, 3=kHz120
      subcarrierSpacing                                             = 1;


  #tdd-UL-DL-ConfigurationCommon
# subcarrierSpacing
# 0=kHz15, 1=kHz30, 2=kHz60, 3=kHz120
      referenceSubcarrierSpacing                                    = 1;
      # pattern1
      # dl_UL_TransmissionPeriodicity
      # 0=ms0p5, 1=ms0p625, 2=ms1, 3=ms1p25, 4=ms2, 5=ms2p5, 6=ms5, 7=ms10
      dl_UL_TransmissionPeriodicity                                 = 6;
      nrofDownlinkSlots                                             = 7;
      nrofDownlinkSymbols                                           = 6;
      nrofUplinkSlots                                               = 2;
      nrofUplinkSymbols                                             = 4;

      ssPBCH_BlockPower                                             = -25;
  }

  );


    # ------- SCTP definitions
    SCTP :
    {
        # Number of streams to use in input/output
        SCTP_INSTREAMS  = 2;
        SCTP_OUTSTREAMS = 2;
    };


    ////////// MME parameters:
    amf_ip_address      = ( { ipv4       = "${AMF_ADDR}";
                              ipv6       = "192:168:30::17";
                              active     = "yes";
                              preference = "ipv4";
                            }
                          );


    NETWORK_INTERFACES :
    {
        GNB_INTERFACE_NAME_FOR_NG_AMF            = "{$CTRL_BIND_INTERFACE}";
        GNB_IPV4_ADDRESS_FOR_NG_AMF              = "{$CTRL_BIND_ADDR}";
        GNB_INTERFACE_NAME_FOR_NGU               = "{$DATA_BIND_INTERFACE}";
        GNB_IPV4_ADDRESS_FOR_NGU                 = "{$DATA_BIND_ADDR}";
        GNB_PORT_FOR_S1U                         = 2152; # Spec 2152
    };

  }
);

MACRLCs = (
	{
	num_cc = 1;
	tr_s_preference = "local_L1";
	tr_n_preference = "local_RRC";
        }
);

L1s = (
    {
	num_cc = 1;
	tr_n_preference = "local_mac";
	pusch_proc_threads = 8;
    }
);

RUs = (
    {
       local_rf       = "yes"
         nb_tx          = 1
         nb_rx          = 1
         att_tx         = 0
         att_rx         = 0;
         bands          = [7];
         max_pdschReferenceSignalPower = -27;
         max_rxgain                    = 114;
         eNB_instances  = [0];
         #beamforming 1x4 matrix:
         bf_weights = [0x00007fff, 0x0000, 0x0000, 0x0000];
         clock_src = "internal";
    }
);

THREAD_STRUCT = (
  {
    #three config for level of parallelism "PARALLEL_SINGLE_THREAD", "PARALLEL_RU_L1_SPLIT", or "PARALLEL_RU_L1_TRX_SPLIT"
    parallel_config    = "PARALLEL_SINGLE_THREAD";
    #two option for worker "WORKER_DISABLE" or "WORKER_ENABLE"
    worker_config      = "WORKER_ENABLE";
  }
);

rfsimulator :
{
    serveraddr = "server";
    serverport = "4043";
    options = (); #("saviq"); or/and "chanmod"
    modelname = "AWGN";
    IQfile = "/tmp/rfsimulator.iqs";
};

     log_config :
     {
       global_log_level                      ="info";
       global_log_verbosity                  ="medium";
       hw_log_level                          ="info";
       hw_log_verbosity                      ="medium";
       phy_log_level                         ="info";
       phy_log_verbosity                     ="medium";
       mac_log_level                         ="info";
       mac_log_verbosity                     ="high";
       rlc_log_level                         ="info";
       rlc_log_verbosity                     ="medium";
       pdcp_log_level                        ="info";
       pdcp_log_verbosity                    ="medium";
       rrc_log_level                         ="info";
       rrc_log_verbosity                     ="medium";
       ngap_log_level                         ="debug";
       ngap_log_verbosity                     ="medium";
    };

