log using adult.log, replace
 
/* ----------------------------------------------------------------------------
 
   The National Health Interview Survey (NHIS) 2021;
 
                 Sample Adult data file
 
   This program loads the NHIS sample adult ASCII data file downloaded from the
   NCHS website (https://www.cdc.gov/nchs/nhis/index.htm) to a Stata dataset.
 
   The program creates descriptive variable labels and formats with meaningful
   category labels.  It sets the variable lengths and uses input statements to
   read in the data.
 
   BEFORE RUNNING THIS PROGRAM, PLEASE:
    - Create a folder called C:\NHIS2021 (on a machine running Windows)
    - Download the sample adult ASCII file to the folder C:\NHIS2021
      (on a machine running Windows)
 
   Running this program will replace the log file and the dataset in the default
   directory, if present.
*/
 
cd c:\nhis2021
 
version 6.0
 
* The following command temporarily changes the command-
* ending delimiter from a carriage return to a semicolon
 
#delimit;
clear;
set mem 200m;
 
* INPUT ALL VARIABLES;
 
infix 
      /* IDN  LOCATIONS */
      rectype                1 -    2      srvy_yr                3 -    6 
  str hhx                    7 -   13      wtfa_a                14 -   23 
 
      /* UCF  LOCATIONS */
      urbrrl                24 -   24      region                25 -   25 
      pstrat                26 -   28      ppsu                  29 -   31 
 
      /* FLG  LOCATIONS */
      hhrespsa_flg          32 -   32 
 
      /* GEN  LOCATIONS */
      intv_qrt              33 -   33      intv_mon              34 -   35 
      hhstat_a              36 -   36      astatnew              37 -   37 
      avail_a               38 -   38      proxy_a               39 -   39 
      proxyrel_a            40 -   40 
 
      /* HHC  LOCATIONS */
      agep_a                41 -   42      age65                 43 -   43 
      sex_a                 44 -   44      educp_a               45 -   46 
      afnow                 47 -   47      hisp_a                48 -   48 
      hispallp_a            49 -   50      hisdetp_a             51 -   51 
      raceallp_a            52 -   52      pcnt18uptc            53 -   53 
      pcntlt18tc            54 -   54 
 
      /* FAM  LOCATIONS */
      pcntadlt_a            55 -   55      pcntkids_a            56 -   56 
      over65flg_a           57 -   57      mltfamflg_a           58 -   58 
      maxeducp_a            59 -   60 
 
      /* HIS  LOCATIONS */
      phstat_a              61 -   61 
 
      /* LS3  LOCATIONS */
      lsatis11r_a           62 -   63      lsatis4r_a            64 -   64 
      lsrotate_flg          65 -   65 
 
      /* HYP  LOCATIONS */
      hypev_a               66 -   66      hypdif_a              67 -   67 
      hyp12m_a              68 -   68      hypmed_a              69 -   69 
 
 
      /* CHL  LOCATIONS */
      chlev_a               70 -   70      chl12m_a              71 -   71 
      chlmed_a              72 -   72 
 
      /* CVC  LOCATIONS */
      chdev_a               73 -   73      angev_a               74 -   74 
      miev_a                75 -   75      strev_a               76 -   76 
 
 
      /* ASP  LOCATIONS */
      aspmedev_a            77 -   77      aspmednown_a          78 -   78 
      aspmedstp_a           79 -   79      asponown_a            80 -   80 
 
 
      /* AST  LOCATIONS */
      asev_a                81 -   81      astill_a              82 -   82 
      asat12m_a             83 -   83      aser12m_a             84 -   84 
 
 
      /* CAN  LOCATIONS */
      canev_a               85 -   85      bladdcan_a            86 -   86 
      bladdagetc_a          87 -   88      bloodcan_a            89 -   89 
      bloodagetc_a          90 -   91      bonecan_a             92 -   92 
      boneagetc_a           93 -   94      braincan_a            95 -   95 
      brainagetc_a          96 -   97      breascan_a            98 -   98 
      breasagetc_a          99 -  100      cervican_a           101 -  101 
      cerviagetc_a         102 -  103      coloncan_a           104 -  104 
      colonagetc_a         105 -  106      esophcan_a           107 -  107 
      esophagetc_a         108 -  109      gallbcan_a           110 -  110 
      gallbagetc_a         111 -  112      laryncan_a           113 -  113 
      larynagetc_a         114 -  115      leukecan_a           116 -  116 
      leukeagetc_a         117 -  118      livercan_a           119 -  119 
      liveragetc_a         120 -  121      lungcan_a            122 -  122 
      lungagetc_a          123 -  124      lymphcan_a           125 -  125 
      lymphagetc_a         126 -  127      melancan_a           128 -  128 
      melanagetc_a         129 -  130      mouthcan_a           131 -  131 
      mouthagetc_a         132 -  133      ovarycan_a           134 -  134 
      ovaryagetc_a         135 -  136      pancrcan_a           137 -  137 
      pancragetc_a         138 -  139      prostcan_a           140 -  140 
      prostagetc_a         141 -  142      rectucan_a           143 -  143 
      rectuagetc_a         144 -  145      sknmcan_a            146 -  146 
      sknmagetc_a          147 -  148      sknnmcan_a           149 -  149 
      sknnmagetc_a         150 -  151      skndkcan_a           152 -  152 
      skndkagetc_a         153 -  154      stomacan_a           155 -  155 
      stomaagetc_a         156 -  157      throacan_a           158 -  158 
      throaagetc_a         159 -  160      thyrocan_a           161 -  161 
      thyroagetc_a         162 -  163      uterucan_a           164 -  164 
      uteruagetc_a         165 -  166      hdnckcan_a           167 -  167 
      hdnckagetc_a         168 -  169      colrccan_a           170 -  170 
      colrcagetc_a         171 -  172      othercanp_a          173 -  173 
      otheragetc_a         174 -  175      numcan_a             176 -  176 
 
 
      /* DIB  LOCATIONS */
      predib_a             177 -  177      gesdib_a             178 -  178 
      dibev_a              179 -  179      dibagetc_a           180 -  181 
      difyrstc1_a          182 -  183      dibpill_a            184 -  184 
      dibins_a             185 -  185      dibinstime_a         186 -  186 
      dibinsstop_a         187 -  187      dibinsstyr_a         188 -  188 
      insskip12m_a         189 -  189      insless12m_a         190 -  190 
      insdly12m_a          191 -  191      dibtype_a            192 -  192 
      dibstress_a          193 -  193      dibcstress_a         194 -  194 
 
 
      /* CON  LOCATIONS */
      copdev_a             195 -  195      arthev_a             196 -  196 
      demenev_a            197 -  197      anxev_a              198 -  198 
      depev_a              199 -  199 
 
      /* RCN  LOCATIONS */
      kidweakev_a          200 -  200      hepev_a              201 -  201 
      liverev_a            202 -  202      cfsev_a              203 -  203 
      cfsnow_a             204 -  204      coldflu12m_a         205 -  205 
      drymth12m_a          206 -  206 
 
      /* ISN  LOCATIONS */
      medrxtrt_a           207 -  207      hlthcond_a           208 -  208 
 
 
      /* EPI  LOCATIONS */
      epiev_a              209 -  209      epimed_a             210 -  210 
      epinumsezp_a         211 -  211      epidr_a              212 -  212 
 
 
      /* ALG  LOCATIONS */
      curresp_a            213 -  213      dxresp_a             214 -  214 
      curfood_a            215 -  215      dxfood_a             216 -  216 
      curskin_a            217 -  217      dxskin_a             218 -  218 
 
 
      /* BMI  LOCATIONS */
      pregnow_a            219 -  219      heighttc_a           220 -  221 
      weightlbtc_a         222 -  224      bmicat_a             225 -  225 
 
 
      /* VIS  LOCATIONS */
      wearglss_a           226 -  226      visiondf_a           227 -  227 
 
 
      /* HEA  LOCATIONS */
      hearaid_a            228 -  228      hearaidfr_a          229 -  229 
      hearingdf_a          230 -  230      hearqtrm_a           231 -  231 
      hearnyrm_a           232 -  232 
 
      /* MOB  LOCATIONS */
      diff_a               233 -  233      equip_a              234 -  234 
      wlk100_a             235 -  235      wlk13m_a             236 -  236 
      steps_a              237 -  237      canewlkr_a           238 -  238 
      wchair_a             239 -  239      perasst_a            240 -  240 
      noeqwlk100_a         241 -  241      noeqwlk13m_a         242 -  242 
      noeqsteps_a          243 -  243      eqwlk100_a           244 -  244 
      eqwlk13m_a           245 -  245      eqsteps_a            246 -  246 
 
 
      /* COM  LOCATIONS */
      comdiff_a            247 -  247      comusesl_a           248 -  248 
 
 
      /* COG  LOCATIONS */
      cogmemdff_a          249 -  249      cogtypedff_a         250 -  250 
      cogfrqdff_a          251 -  251      cogamtdff_a          252 -  252 
 
 
      /* UPP  LOCATIONS */
      uppslfcr_a           253 -  253      uppraise_a           254 -  254 
      uppobjct_a           255 -  255      disab3_a             256 -  256 
 
 
      /* SOC  LOCATIONS */
      socerrnds_a          257 -  257      socsclpar_a          258 -  258 
      socwrklim_a          259 -  259 
 
      /* ADO  LOCATIONS */
      devdonset_a          260 -  260 
 
      /* INS  LOCATIONS */
      notcov_a             261 -  261      cover_a              262 -  262 
      cover65_a            263 -  263      sincovde_a           264 -  264 
      sincovvs_a           265 -  265      sincovrx_a           266 -  266 
      medicare_a           267 -  267      mcpart_a             268 -  268 
      mcchoice_a           269 -  269      mchmo_a              270 -  270 
      mcadvr_a             271 -  271      mcpartd_a            272 -  272 
      medicaid_a           273 -  273      maxchng_a            274 -  274 
      maprem_a             275 -  275      madeduc_a            276 -  276 
      mahdhp_a             277 -  277      maflg_a              278 -  278 
      private_a            279 -  279      exchange_a           280 -  280 
      polhld1_a            281 -  281      prplcov1_a           282 -  282 
      prpolh1_a            283 -  283      prplcov1_c_a         284 -  284 
      plnwrkr1_a           285 -  286      plnexchg1_a          287 -  287 
      pln1pay1_a           288 -  288      pln1pay2_a           289 -  289 
      pln1pay3_a           290 -  290      pln1pay4_a           291 -  291 
      pln1pay5_a           292 -  292      pln1pay6_a           293 -  293 
      hicostr1_a           294 -  298      prdeduc1_a           299 -  299 
      prhdhp1_a            300 -  300      hsahra1_a            301 -  301 
      prrxcov1_a           302 -  302      prdncov1_a           303 -  303 
      prvscov1_a           304 -  304      exchpr1_a            305 -  305 
      prflg_a              306 -  306      pxchng1_a            307 -  307 
      prprem1_a            308 -  308      plexchpr1_a          309 -  309 
      polhld2_a            310 -  310      prplcov2_a           311 -  311 
      prpolh2_a            312 -  312      prplcov2_c_a         313 -  313 
      plnwrkr2_a           314 -  315      plnexchg2_a          316 -  316 
      pln2pay1_a           317 -  317      pln2pay2_a           318 -  318 
      pln2pay3_a           319 -  319      pln2pay4_a           320 -  320 
      pln2pay5_a           321 -  321      pln2pay6_a           322 -  322 
      hicostr2_a           323 -  327      prdeduc2_a           328 -  328 
      prhdhp2_a            329 -  329      hsahra2_a            330 -  330 
      prrxcov2_a           331 -  331      prdncov2_a           332 -  332 
      prvscov2_a           333 -  333      exchpr2_a            334 -  334 
      chip_a               335 -  335      chxchng_a            336 -  336 
      chprem_a             337 -  337      chdeduc_a            338 -  338 
      chhdhp_a             339 -  339      chflg_a              340 -  340 
      othpub_a             341 -  341      opxchng_a            342 -  342 
      opprem_a             343 -  343      opdeduc_a            344 -  344 
      ophdhp_a             345 -  345      plexchop_a           346 -  346 
      opflg_a              347 -  347      othgov_a             348 -  348 
      ogxchng_a            349 -  349      ogprem_a             350 -  350 
      ogdeduc_a            351 -  351      oghdhp_a             352 -  352 
      plexchog_a           353 -  353      ogflg_a              354 -  354 
      military_a           355 -  355      milspc1r_a           356 -  356 
      milspc2_a            357 -  357      milspc3_a            358 -  358 
      ihs_a                359 -  359      hilast_a             360 -  360 
      hilastmy_a           361 -  362      histopjob_a          363 -  363 
      histopmiss_a         364 -  364      histopage_a          365 -  365 
      histopcost_a         366 -  366      histopelig_a         367 -  367 
      rsnhicost_a          368 -  368      rsnhiwant_a          369 -  369 
      rsnhielig_a          370 -  370      rsnhiconf_a          371 -  371 
      rsnhimeet_a          372 -  372      rsnhiwait_a          373 -  373 
      rsnhioth_a           374 -  374      rsnhijob_a           375 -  375 
      rsnhimiss_a          376 -  376      hinotyr_a            377 -  377 
      hinotmyr_a           378 -  379      milspc1_a            380 -  380 
      hicov_a              381 -  381      hikind01_a           382 -  382 
      hikind02_a           383 -  383      hikind03_a           384 -  384 
      hikind04_a           385 -  385      hikind05_a           386 -  386 
      hikind06_a           387 -  387      hikind07_a           388 -  388 
      hikind08_a           389 -  389      hikind09_a           390 -  390 
      hikind10_a           391 -  391      mcareprb_a           392 -  392 
      mcaidprb_a           393 -  393 
 
      /* PAY  LOCATIONS */
      paybll12m_a          394 -  394      paynobllnw_a         395 -  395 
      payworry_a           396 -  396 
 
      /* CVD  LOCATIONS */
      cvddiag_a            397 -  397      covidtest_a          398 -  398 
      cvdrslt_a            399 -  399      cvdsev_a             400 -  400 
 
 
      /* TSC  LOCATIONS */
      cvdsymsm_a           401 -  401      cvdsmrec_a           402 -  402 
      cvdsymtst_a          403 -  403      cvdtstrec_a          404 -  404 
 
 
      /* UTZ  LOCATIONS */
      lastdr_a             405 -  405      wellness_a           406 -  406 
      wellvis_a            407 -  407      usualpl_a            408 -  408 
      usplkind_a           409 -  409      urgnt12mtc_a         410 -  410 
      emerg12mtc_a         411 -  411      hospongt_a           412 -  412 
      meddl12m_a           413 -  413      medng12m_a           414 -  414 
 
 
      /* ACC  LOCATIONS */
      dlycare_a            415 -  415      dngcare_a            416 -  416 
      virapp12m_a          417 -  417      virappcvd_a          418 -  418 
 
 
      /* CNV  LOCATIONS */
      cancovtrea_a         419 -  419      cancovchg_a          420 -  420 
      cancovoth_a          421 -  421      cancovcare_a         422 -  422 
 
 
      /* PMD  LOCATIONS */
      rx12m_a              423 -  423      rxsk12m_a            424 -  424 
      rxls12m_a            425 -  425      rxdl12m_a            426 -  426 
      rxdg12m_a            427 -  427 
 
      /* PRV  LOCATIONS */
      bplast_a             428 -  428      chollast_a           429 -  429 
      diblast1_a           430 -  430      diba1clast_a         431 -  431 
      diba1cnmt_a          432 -  432      colorectev_a         433 -  433 
      colorectyp_a         434 -  434      colwhen_a            435 -  435 
      colreason_a          436 -  436      colpay_a             437 -  437 
      colsigwhen_a         438 -  438      sigwhen_a            439 -  439 
      ctcolev1_a           440 -  440      ctcolwhen1_a         441 -  441 
      fithev1_a            442 -  442      fithwhen1_a          443 -  443 
      cologuard1_a         444 -  444      fitcolg1_a           445 -  445 
      cguardwhe1_a         446 -  446      colprob1_a           447 -  447 
      coltest1_a           448 -  448      coltest2_a           449 -  449 
      coltest3_a           450 -  450      coltest4_a           451 -  451 
      coltest5_a           452 -  452      coltest6_a           453 -  453 
      psatest_a            454 -  454      psawhen_a            455 -  455 
      psareason_a          456 -  456      psasuggest_a         457 -  457 
      cervicev1_a          458 -  458      cervicwhen_a         459 -  459 
      cerreason1_a         460 -  460      paptest_a            461 -  461 
      hpvtest_a            462 -  462      tellcervic_a         463 -  463 
      cervicres_a          464 -  464      cervicnot1_a         465 -  466 
      hystev1_a            467 -  467      mamev_a              468 -  468 
      mamwhen_a            469 -  469      mampay_a             470 -  470 
      mamreason_a          471 -  471      mamage1st1_a         472 -  472 
      mamnot1_a            473 -  474 
 
      /* IMS  LOCATIONS */
      pregfluyr_a          475 -  475      livebirth_a          476 -  476 
      shtflu12m_a          477 -  477      shtflum_a            478 -  479 
      shtfluy_a            480 -  483      flupreg_a            484 -  484 
      flupreg2_a           485 -  485      shtcvd19_a           486 -  486 
      shtcvd19nm_a         487 -  487      cvdvac1mr_a          488 -  489 
      cvdvac1yr_a          490 -  493      cvdvac2mr_a          494 -  495 
      cvdvac2yr_a          496 -  499      shtcvd19av_a         500 -  500 
      shtpnuev_a           501 -  501      shtpneunb_a          502 -  502 
      shtshingle_a         503 -  503      zostavax1_a          504 -  504 
      zostavxyrp_a         505 -  508      zostawhen_a          509 -  509 
      shingrix1_a          510 -  510      shingrixnb_a         511 -  511 
      shingrxyrp_a         512 -  515      shingwhen_a          516 -  516 
      tdappreg_a           517 -  517      shthepb_a            518 -  518 
      shthepa_a            519 -  519      livehep_a            520 -  520 
      workhealth_a         521 -  521      wrkhlthfc_a          522 -  522 
      travel_a             523 -  523 
 
      /* CGR  LOCATIONS */
      homehc12m_a          524 -  524      homecaredg_a         525 -  525 
      famcare12m_a         526 -  526      famcaredng_a         527 -  527 
      famcarecvd_a         528 -  528 
 
      /* ANX  LOCATIONS */
      anxfreq_a            529 -  529      anxmed_a             530 -  530 
      anxlevel_a           531 -  531 
 
      /* DEP  LOCATIONS */
      depfreq_a            532 -  532      depmed_a             533 -  533 
      deplevel_a           534 -  534 
 
      /* MHC  LOCATIONS */
      mhrx_a               535 -  535      mhthrpy_a            536 -  536 
      mhtpynow_a           537 -  537      mhthdly_a            538 -  538 
      mhthnd_a             539 -  539 
 
      /* SPD  LOCATIONS */
      sad_a                540 -  540      nervous_a            541 -  541 
      restless_a           542 -  542      hopeless_a           543 -  543 
      effort_a             544 -  544      worthless_a          545 -  545 
      k6spd_a              546 -  546 
 
      /* PAI  LOCATIONS */
      paifrq3m_a           547 -  547      paiamnt_a            548 -  548 
      paiwklm3m_a          549 -  549      paiaffm3m_a          550 -  550 
      paiback3m_a          551 -  551      paiulmb3m_a          552 -  552 
      paillmb3m_a          553 -  553      paihdfc3m_a          554 -  554 
      paiapg3m_a           555 -  555      paitooth3m_a         556 -  556 
 
 
      /* REP  LOCATIONS */
      repstrain_a          557 -  557      replimit_a           558 -  558 
      repsawdoc_a          559 -  559      repwrkdytc_a         560 -  561 
      repfutwrk_a          562 -  562      repstopchg_a         563 -  563 
      repreduce_a          564 -  564      repwrkcaus_a         565 -  565 
 
 
      /* INJ  LOCATIONS */
      anyinjury_a          566 -  566      injlimit_a           567 -  567 
      numinjtc_a           568 -  569      injhome_a            570 -  570 
      injwork_a            571 -  571      injsports_a          572 -  572 
      injfall_a            573 -  573      injfallhom_a         574 -  574 
      injfallwrk_a         575 -  575      injmotor_a           576 -  576 
      injmvtype1_a         577 -  577      injmvtype2_a         578 -  578 
      injmvtype3_a         579 -  579      injmvtype4_a         580 -  580 
      injmvtype5_a         581 -  581      injchores_a          582 -  582 
      injsawdoc_a          583 -  583      injer_a              584 -  584 
      injhosp_a            585 -  585      injbones_a           586 -  586 
      injstitch_a          587 -  587      injwrkdytc_a         588 -  589 
      injfutwrk_a          590 -  590      injstopchg_a         591 -  591 
      injreduce_a          592 -  592 
 
      /* TSM  LOCATIONS */
      smelldf_a            593 -  593      smellcomp_a          594 -  594 
      smellpht_a           595 -  595      tastedf_a            596 -  596 
      tastecomp_a          597 -  597      tasteflav_a          598 -  598 
      tasteunw_a           599 -  599      tstsmhp_a            600 -  600 
      tstsmlast_a          601 -  601 
 
      /* CIG  LOCATIONS */
      smkev_a              602 -  602      smknow_a             603 -  603 
      smkcigst_a           604 -  604      cignow_a             605 -  606 
      smk30d_a             607 -  608      cig30d_a             609 -  610 
      ecigev_a             611 -  611      ecignow_a            612 -  612 
      smkecigst_a          613 -  613 
 
      /* OTB  LOCATIONS */
      cigarev_a            614 -  614      cigarcur_a           615 -  615 
      cigar30d_a           616 -  617      pipeev_a             618 -  618 
      pipecur_a            619 -  619      smokelsev_a          620 -  620 
      smokelscur_a         621 -  621 
 
      /* SOS  LOCATIONS */
      support_a            622 -  622      cmpsupport_a         623 -  623 
 
 
      /* ORN  LOCATIONS */
      orient_a             624 -  624 
 
      /* MAR  LOCATIONS */
      marital_a            625 -  625      spousliv_a           626 -  626 
      spousep_a            627 -  627      evrmarried_a         628 -  628 
      marstat_a            629 -  629      legmstat_a           630 -  630 
      spousesex_a          631 -  631      saspprace_a          632 -  632 
      saspphisp_a          633 -  633      spousagetc_a         634 -  635 
      spouseducp_a         636 -  637      spouswrk_a           638 -  638 
      spouswkft_a          639 -  639      prtnrsex_a           640 -  640 
      prtnragetc_a         641 -  642      prtnreducp_a         643 -  644 
      prtnrwrk_a           645 -  645      prtnrwkft_a          646 -  646 
      saparentsc_a         647 -  647      parstat_a            648 -  648 
 
 
      /* VET  LOCATIONS */
      afvet_a              649 -  649      afvettrn_a           650 -  650 
      combat_a             651 -  651      vadisb_a             652 -  652 
      vahosp_a             653 -  653      vacareev_a           654 -  654 
 
 
      /* NAT  LOCATIONS */
      natusborn_a          655 -  655      yrsinus_a            656 -  656 
      citznstp_a           657 -  657 
 
      /* SCH  LOCATIONS */
      schcurenr_a          658 -  658      schdymsstc_a         659 -  660 
 
 
      /* EMP  LOCATIONS */
      empwrklsw1_a         661 -  661      empwhynot_a          662 -  663 
      emplstwor1_a         664 -  664      empwkhrs3_a          665 -  666 
      empwrkft1_a          667 -  667      empsicklv_a          668 -  668 
      emphealins_a         669 -  669      empdysmss3_a         670 -  672 
 
 
      /* EMD  LOCATIONS */
      emdindstn1_a         673 -  674      emdindstn2_a         675 -  676 
      emdoccupn1_a         677 -  678      emdoccupn2_a         679 -  680 
      emdsuper_a           681 -  681      emdwrkcat1_a         682 -  682 
 
 
      /* JOB  LOCATIONS */
      jobtax_a             683 -  683      jobchgearn_a         684 -  684 
      jobshift_a           685 -  685      jobchgsch_a          686 -  686 
      jobvarysch_a         687 -  687      jobadvsch_a          688 -  688 
      joblkyloss_a         689 -  689      jobwrksick_a         690 -  691 
      jobmiss_a            692 -  693 
 
      /* SDW  LOCATIONS */
      curjobsd1_a          694 -  694      wrkclssd1_a          695 -  695 
      wrkclsnsd1_a         696 -  696      wrkclsoft1_a         697 -  697 
      sdmsrs1_a            698 -  698      sdmsrsoft1_a         699 -  699 
      recjobsd1_a          700 -  700      jobanysd1_a          701 -  701 
      rjclssd1_a           702 -  702      clswrksd1_a          703 -  703 
      rjclsnosd1_a         704 -  704      rjclsoft1_a          705 -  705 
      clswrknos1_a         706 -  706 
 
      /* FEM  LOCATIONS */
      pcntadtwkp_a         707 -  707      pcntadtwfp_a         708 -  708 
 
 
      /* INC  LOCATIONS */
      incwrko_a            709 -  709      incinter_a           710 -  710 
      incssrr_a            711 -  711      incssissdi_a         712 -  712 
      ssissdibth_a         713 -  713      ssissdidsb_a         714 -  714 
      incwelf_a            715 -  715      incretire_a          716 -  716 
      incothr_a            717 -  717      impnum_a             718 -  719 
      povrattc_a           720 -  724      ratcat_a             725 -  726 
  str impincflg_a          727 -  727 
 
      /* FOO  LOCATIONS */
      fsnap12m_a           728 -  728      fsnap30d_a           729 -  729 
      fwic12m_a            730 -  730      flunch12m_a          731 -  731 
 
 
      /* FDS  LOCATIONS */
      fdsrunout_a          732 -  732      fdslast_a            733 -  733 
      fdsbalance_a         734 -  734      fdsskip_a            735 -  735 
      fdsskipdys_a         736 -  737      fdsless_a            738 -  738 
      fdshungry_a          739 -  739      fdsweight_a          740 -  740 
      fdsnoteat_a          741 -  741      fdsnedays_a          742 -  743 
      fdscat3_a            744 -  744      fdscat4_a            745 -  745 
 
 
      /* HOU  LOCATIONS */
      houyrsliv_a          746 -  746      houtenure_a          747 -  747 
      hougvasst_a          748 -  748 
 
using adult21.dat;
 
 
* DEFINE VARIABLE LABELS;
 
* IDN  VARIABLE LABELS;
label variable rectype            "Record type";
label variable srvy_yr            "Year of the National Health Interview Survey";
label variable hhx                "Randomly assigned household number unique to a household";
label variable wtfa_a             "Weight - Final Annual";
 
* UCF  VARIABLE LABELS;
label variable urbrrl             "2013 NCHS Urban-Rural Classification Scheme for Counties";
label variable region             "Household region";
label variable pstrat             "Pseudo-stratum for public-use file variance estimation";
label variable ppsu               "Pseudo-PSU for public-use file variance estimation";
 
* FLG  VARIABLE LABELS;
label variable hhrespsa_flg       "Sample Adult is the household respondent or the proxy who lives in the household";
 
* GEN  VARIABLE LABELS;
label variable intv_qrt           "Interview quarter";
label variable intv_mon           "Interview month";
label variable hhstat_a           "Indicates person is the Sample Adult";
label variable astatnew           "Recoded ASTAT";
label variable avail_a            "Sample Adult Available";
label variable proxy_a            "Proxy Available";
label variable proxyrel_a         "Proxy's Relationship to Sample Adult";
 
* HHC  VARIABLE LABELS;
label variable agep_a             "Age of SA (top coded)";
label variable age65              "Age 65 or older";
label variable sex_a              "Sex of Sample Adult";
label variable educp_a            "Educational level of sample adult";
label variable afnow              "Full-time active duty screener";
label variable hisp_a             "Recode: Hispanic ethnicity of SA";
label variable hispallp_a         "Single and multiple race groups with Hispanic origin";
label variable hisdetp_a          "Hispanic origin detail";
label variable raceallp_a         "Single and multiple race groups";
label variable pcnt18uptc         "Top-coded count of persons 18 or older in the household";
label variable pcntlt18tc         "Top-coded count of persons under 18 in the household";
 
* FAM  VARIABLE LABELS;
label variable pcntadlt_a         "Number of adults in Sample Adult family, top-coded 3+";
label variable pcntkids_a         "Number of children in Sample Adult family, top-coded 3+";
label variable over65flg_a        "Indicator for at least 1 person aged 65+ in SA family";
label variable mltfamflg_a        "Indicator for multifamily households";
label variable maxeducp_a         "Highest level of education of all the adults in the SA's family";
 
* HIS  VARIABLE LABELS;
label variable phstat_a           "General health status";
 
* LS3  VARIABLE LABELS;
label variable lsatis11r_a        "Life satisfaction - 11 category question";
label variable lsatis4r_a         "Life satisfaction - 4 category question";
label variable lsrotate_flg       "Life Satisfaction section rotation flag";
 
* HYP  VARIABLE LABELS;
label variable hypev_a            "Ever been told you had hypertension";
label variable hypdif_a           "Told had hypertension on two or more visits";
label variable hyp12m_a           "Hypertension, past 12 months";
label variable hypmed_a           "Now taking high blood pressure medication";
 
* CHL  VARIABLE LABELS;
label variable chlev_a            "Ever told you had high cholesterol";
label variable chl12m_a           "High cholesterol, past 12 months";
label variable chlmed_a           "Now taking cholesterol medication";
 
* CVC  VARIABLE LABELS;
label variable chdev_a            "Ever been told you had coronary heart disease";
label variable angev_a            "Ever been told you had angina";
label variable miev_a             "Ever been told you had a heart attack";
label variable strev_a            "Ever been told you had a stroke";
 
* ASP  VARIABLE LABELS;
label variable aspmedev_a         "Told to take low-dose aspirin";
label variable aspmednown_a       "Now following aspirin advice";
label variable aspmedstp_a        "Advise to stop taking aspirin";
label variable asponown_a         "Taking low dose-aspirin on own";
 
* AST  VARIABLE LABELS;
label variable asev_a             "Ever had asthma";
label variable astill_a           "Still have asthma";
label variable asat12m_a          "Asthma episode";
label variable aser12m_a          "Asthma ER visit";
 
* CAN  VARIABLE LABELS;
label variable canev_a            "Ever been told you had cancer";
label variable bladdcan_a         "Bladder cancer mentioned";
label variable bladdagetc_a       "Age when first told had bladder cancer";
label variable bloodcan_a         "Blood cancer mentioned";
label variable bloodagetc_a       "Age when first told had blood cancer";
label variable bonecan_a          "Bone cancer mentioned";
label variable boneagetc_a        "Age when first told had bone cancer";
label variable braincan_a         "Brain cancer mentioned";
label variable brainagetc_a       "Age when first told had brain cancer";
label variable breascan_a         "Breast cancer mentioned";
label variable breasagetc_a       "Age when first told had breast cancer";
label variable cervican_a         "Cervical cancer mentioned";
label variable cerviagetc_a       "Age when first told had cervical cancer";
label variable coloncan_a         "Colon cancer mentioned";
label variable colonagetc_a       "Age when first told had colon cancer";
label variable esophcan_a         "Esophageal cancer mentioned";
label variable esophagetc_a       "Age when first told had esophageal cancer";
label variable gallbcan_a         "Gallbladder cancer mentioned";
label variable gallbagetc_a       "Age when first told had gallbladder cancer";
label variable laryncan_a         "Larynx-trachea cancer mentioned";
label variable larynagetc_a       "Age when first told had larynx-trachea cancer";
label variable leukecan_a         "Leukemia mentioned";
label variable leukeagetc_a       "Age when first told had leukemia";
label variable livercan_a         "Liver cancer mentioned";
label variable liveragetc_a       "Age when first told had liver cancer";
label variable lungcan_a          "Lung cancer mentioned";
label variable lungagetc_a        "Age when first told had lung cancer";
label variable lymphcan_a         "Lymphoma cancer mentioned";
label variable lymphagetc_a       "Age when first told had lymphoma";
label variable melancan_a         "Melanoma cancer mentioned";
label variable melanagetc_a       "Age when first told had melanoma cancer";
label variable mouthcan_a         "Mouth, tongue or lip cancer mentioned";
label variable mouthagetc_a       "Age when first told had mouth, tongue or lip cancer";
label variable ovarycan_a         "Ovarian cancer mentioned";
label variable ovaryagetc_a       "Age when first told had ovarian cancer";
label variable pancrcan_a         "Pancreatic cancer mentioned";
label variable pancragetc_a       "Age when first told had pancreatic cancer";
label variable prostcan_a         "Prostate cancer mentioned";
label variable prostagetc_a       "Age when first told had prostate cancer";
label variable rectucan_a         "Rectal cancer mentioned";
label variable rectuagetc_a       "Age when first told had rectal cancer";
label variable sknmcan_a          "Skin melanoma cancer mentioned";
label variable sknmagetc_a        "Age when first told had skin melanoma cancer";
label variable sknnmcan_a         "Skin non-melanoma cancer mentioned";
label variable sknnmagetc_a       "Age when first told skin non-melanoma cancer";
label variable skndkcan_a         "Skin cancer (don't know what kind) mentioned";
label variable skndkagetc_a       "Age when first told had skin cancer (don't know what kind)";
label variable stomacan_a         "Stomach cancer mentioned";
label variable stomaagetc_a       "Age when first told had stomach cancer";
label variable throacan_a         "Throat - pharynx cancer mentioned";
label variable throaagetc_a       "Age when first told had throat-pharynx cancer";
label variable thyrocan_a         "Thyroid cancer mentioned";
label variable thyroagetc_a       "Age when first told had thyroid cancer";
label variable uterucan_a         "Uterine cancer mentioned";
label variable uteruagetc_a       "Age when first told had uterine cancer";
label variable hdnckcan_a         "Head and neck cancers mentioned";
label variable hdnckagetc_a       "Age when first told had head or neck cancer";
label variable colrccan_a         "Colorectal cancer mentioned";
label variable colrcagetc_a       "Age when first told had colon or rectal cancer";
label variable othercanp_a        "Other cancer mentioned";
label variable otheragetc_a       "Age when first told had other cancer";
label variable numcan_a           "Number of reported types of cancers";
 
* DIB  VARIABLE LABELS;
label variable predib_a           "Ever had prediabetes";
label variable gesdib_a           "Gestational diabetes";
label variable dibev_a            "Ever had diabetes";
label variable dibagetc_a         "Age first diagnosed w/diabetes";
label variable difyrstc1_a        "Years since first diagnosed w/diabetes";
label variable dibpill_a          "Taking diabetic pills";
label variable dibins_a           "Taking insulin";
label variable dibinstime_a       "Time from diabetes to insulin";
label variable dibinsstop_a       "Ever stop using insulin";
label variable dibinsstyr_a       "Only stop insulin in first year";
label variable insskip12m_a       "Skipped insulin, past 12m";
label variable insless12m_a       "Took less insulin, past 12m";
label variable insdly12m_a        "Delayed buying insulin, past 12m";
label variable dibtype_a          "Diabetes type";
label variable dibstress_a        "Overwhelmed by diabetes";
label variable dibcstress_a       "Change in diabetes distress";
 
* CON  VARIABLE LABELS;
label variable copdev_a           "Ever been told you had COPD, emphysema, or chronic bronchitis?";
label variable arthev_a           "Ever had arthritis";
label variable demenev_a          "Ever had dementia";
label variable anxev_a            "Ever had anxiety disorder";
label variable depev_a            "Ever had depression";
 
* RCN  VARIABLE LABELS;
label variable kidweakev_a        "Ever had weak/failing kidneys";
label variable hepev_a            "Ever had hepatitis";
label variable liverev_a          "Ever had cirrhosis/liver condition";
label variable cfsev_a            "Ever had Chronic Fatigue Syndrome";
label variable cfsnow_a           "Still have Chronic Fatigue Syndrome";
label variable coldflu12m_a       "Cold or flu 12m";
label variable drymth12m_a        "Dry mouth 12m";
 
* ISN  VARIABLE LABELS;
label variable medrxtrt_a         "Weakened immune system due to prescriptions";
label variable hlthcond_a         "Weakened immune system due to health condition";
 
* EPI  VARIABLE LABELS;
label variable epiev_a            "Ever had epilepsy";
label variable epimed_a           "Take medication for epilepsy";
label variable epinumsezp_a       "How many seizures past 12 months";
label variable epidr_a            "See a doctor for epilepsy";
 
* ALG  VARIABLE LABELS;
label variable curresp_a          "Current respiratory allergy";
label variable dxresp_a           "Respiratory allergy diagnosis";
label variable curfood_a          "Current food allergy";
label variable dxfood_a           "Food allergy diagnosis";
label variable curskin_a          "Current skin allergy";
label variable dxskin_a           "Skin allergy diagnosis";
 
* BMI  VARIABLE LABELS;
label variable pregnow_a          "Pregnant now";
label variable heighttc_a         "Height without shoes (inches), public use";
label variable weightlbtc_a       "Weight without shoes (pounds), public use";
label variable bmicat_a           "Categorical Body Mass Index, public use";
 
* VIS  VARIABLE LABELS;
label variable wearglss_a         "Wear glasses/contact lenses";
label variable visiondf_a         "Difficulty seeing";
 
* HEA  VARIABLE LABELS;
label variable hearaid_a          "Use hearing aid";
label variable hearaidfr_a        "How often use hearing aid";
label variable hearingdf_a        "Difficulty hearing";
label variable hearqtrm_a         "Hearing conversation in quiet room";
label variable hearnyrm_a         "Hearing conversation in noisy room";
 
* MOB  VARIABLE LABELS;
label variable diff_a             "Difficulty walking/steps";
label variable equip_a            "Use equipment to get around";
label variable wlk100_a           "Difficulty walking 100 yards";
label variable wlk13m_a           "Difficulty walking 1/3 mile";
label variable steps_a            "Difficulty walking steps";
label variable canewlkr_a         "Use cane or walker";
label variable wchair_a           "Use wheelchair/scooter";
label variable perasst_a          "Use someone's assistance";
label variable noeqwlk100_a       "Difficulty walking 100 yards without aid";
label variable noeqwlk13m_a       "Difficulty walking 1/3 mile without aid";
label variable noeqsteps_a        "Difficulty walking steps without equipment";
label variable eqwlk100_a         "Difficulty walking 100 yards with aid";
label variable eqwlk13m_a         "Difficulty walking 1/3 mile with aid";
label variable eqsteps_a          "Difficulty walking steps with equipment";
 
* COM  VARIABLE LABELS;
label variable comdiff_a          "Difficulty communicating";
label variable comusesl_a         "Use sign language";
 
* COG  VARIABLE LABELS;
label variable cogmemdff_a        "Difficulty remembering/concentrating";
label variable cogtypedff_a       "Remembering/concentrating or both";
label variable cogfrqdff_a        "Difficulty remembering-how often";
label variable cogamtdff_a        "Difficulty remembering-how much";
 
* UPP  VARIABLE LABELS;
label variable uppslfcr_a         "Difficulty with self care";
label variable uppraise_a         "Difficulty raising soda bottle";
label variable uppobjct_a         "Difficulty using hands and fingers";
label variable disab3_a           "The Washington Group Short Set Composite Disability Indicator";
 
* SOC  VARIABLE LABELS;
label variable socerrnds_a        "Difficulty doing errands alone";
label variable socsclpar_a        "Difficulty participating in social activities";
label variable socwrklim_a        "Work limited due to health problem";
 
* ADO  VARIABLE LABELS;
label variable devdonset_a        "Difficulty doing activities before age 22";
 
* INS  VARIABLE LABELS;
label variable notcov_a           "Coverage status as used in Health United States";
label variable cover_a            "Health insurance hierarchy under 65";
label variable cover65_a          "Health Insurance hierarchy 65+";
label variable sincovde_a         "Single service plan - dental";
label variable sincovvs_a         "Single service plan - vision";
label variable sincovrx_a         "Single service plan - prescription";
label variable medicare_a         "Medicare recode";
label variable mcpart_a           "Type of Medicare coverage";
label variable mcchoice_a         "Enrolled in Medicare Advantage Plan";
label variable mchmo_a            "Medicare HMO";
label variable mcadvr_a           "Medicare Advantage Plan";
label variable mcpartd_a          "Medicare Part D";
label variable medicaid_a         "Medicaid recode";
label variable maxchng_a          "Medicaid through Marketplace";
label variable maprem_a           "Medicaid premium";
label variable madeduc_a          "Medicaid deductible";
label variable mahdhp_a           "Medicaid HDHP";
label variable maflg_a            "Medicaid reassignment flag";
label variable private_a          "Private health insurance recode";
label variable exchange_a         "Plan through Health Insurance Exchange, NCHS algorithm";
label variable polhld1_a          "Policyholder for private plan 1";
label variable prplcov1_a         "Plan coverage for others - plan 1";
label variable prpolh1_a          "Relation to policyholder - plan 1";
label variable prplcov1_c_a       "Response to PRPLCOV1_C or PRPLCOV2_C  from child - plan 1";
label variable plnwrkr1_a         "How plan was originally obtained - plan 1";
label variable plnexchg1_a        "Health plan obtained through Marketplace - plan 1";
label variable pln1pay1_a         "Paid for by self or family - plan 1";
label variable pln1pay2_a         "Paid for by employer or union - plan 1";
label variable pln1pay3_a         "Paid for by someone outside the household - plan 1";
label variable pln1pay4_a         "Paid for by Medicare - plan 1";
label variable pln1pay5_a         "Paid for by Medicaid - plan 1";
label variable pln1pay6_a         "Paid for by other government program - plan 1";
label variable hicostr1_a         "Out-of-pocket premium cost - plan 1";
label variable prdeduc1_a         "Deductible - plan 1";
label variable prhdhp1_a          "High deductible health plan - plan 1";
label variable hsahra1_a          "Health Savings Accounts / Health Reimbursement Accounts - plan 1";
label variable prrxcov1_a         "Plan pays for prescription drug - plan 1";
label variable prdncov1_a         "Plan pays for dental care - plan 1";
label variable prvscov1_a         "Plan pays for vision care - plan 1";
label variable exchpr1_a          "Exchange company coding NCHS - plan 1";
label variable prflg_a            "Private reassignment flag";
label variable pxchng1_a          "Marketplace or state exchange, reassigned from public to private";
label variable prprem1_a          "Premium on plan reassigned from public to private";
label variable plexchpr1_a        "Exchange company coding, NCHS, reassigned from public to private";
label variable polhld2_a          "Policyholder for private plan 2";
label variable prplcov2_a         "Plan coverage for others - plan 2";
label variable prpolh2_a          "Relation to policyholder - plan 2";
label variable prplcov2_c_a       "Response to PRPLCOV1_C or PRPLCOV2_C from child - plan 2";
label variable plnwrkr2_a         "How plan was originally obtained - plan 2";
label variable plnexchg2_a        "Health plan obtained through Marketplace - plan 2";
label variable pln2pay1_a         "Paid for by self or family - plan 2";
label variable pln2pay2_a         "Paid for by employer or union - plan 2";
label variable pln2pay3_a         "Paid for by someone outside the household - plan 2";
label variable pln2pay4_a         "Paid for by Medicare - plan 2";
label variable pln2pay5_a         "Paid for by Medicaid - plan 2";
label variable pln2pay6_a         "Paid for by other government program - plan 2";
label variable hicostr2_a         "Out-of-pocket premium cost - plan 2";
label variable prdeduc2_a         "Deductible - plan 2";
label variable prhdhp2_a          "High deductible health plan - plan 2";
label variable hsahra2_a          "Health Savings Accounts / Health Reimbursement Accounts - plan 2";
label variable prrxcov2_a         "Plan pays for prescription drug - plan 2";
label variable prdncov2_a         "Plan pays for dental care - plan 2";
label variable prvscov2_a         "Plan pays for vision care - plan 2";
label variable exchpr2_a          "Exchange company coding NCHS - plan 2";
label variable chip_a             "Children's Health Insurance Program (CHIP) recode";
label variable chxchng_a          "CHIP through Marketplace";
label variable chprem_a           "Pay CHIP premium";
label variable chdeduc_a          "CHIP deductible";
label variable chhdhp_a           "CHIP HDHP";
label variable chflg_a            "CHIP reassignment flag";
label variable othpub_a           "State-sponsored health plan recode";
label variable opxchng_a          "State-sponsored plan through Marketplace";
label variable opprem_a           "Pay premium for state-sponsored plan";
label variable opdeduc_a          "State-sponsored plan deductible";
label variable ophdhp_a           "State-sponsored plan HDHP";
label variable plexchop_a         "Exchange company coding, NCHS (state-sponsored plan)";
label variable opflg_a            "State-sponsored reassignment flag";
label variable othgov_a           "Other government program recode";
label variable ogxchng_a          "Other government program through Marketplace";
label variable ogprem_a           "Pay premium for other government program";
label variable ogdeduc_a          "Other government program deductible";
label variable oghdhp_a           "Other government program HDHP";
label variable plexchog_a         "Exchange company coding, NCHS (other government program)";
label variable ogflg_a            "Other government reassignment flag";
label variable military_a         "Military health care coverage recode";
label variable milspc1r_a         "Types of military health care - VA health care";
label variable milspc2_a          "Types of military health care - TRICARE";
label variable milspc3_a          "Types of military health care - CHAMP-VA";
label variable ihs_a              "Indian Health Service recode";
label variable hilast_a           "How long since last health coverage";
label variable hilastmy_a         "Number of months without coverage";
label variable histopjob_a        "Lost job or changed employers";
label variable histopmiss_a       "Missed deadline";
label variable histopage_a        "Ineligible because of age/left school";
label variable histopcost_a       "Cost increase";
label variable histopelig_a       "Not eligible for Medicaid, CHIP, or other public coverage";
label variable rsnhicost_a        "Not affordable";
label variable rsnhiwant_a        "Do not need or want coverage";
label variable rsnhielig_a        "Not eligible for coverage";
label variable rsnhiconf_a        "Signing up too difficult or confusing";
label variable rsnhimeet_a        "Cannot find a plan that meets the needs";
label variable rsnhiwait_a        "Coverage has not started yet";
label variable rsnhioth_a         "Another reason";
label variable rsnhijob_a         "Lost job";
label variable rsnhimiss_a        "Missed deadline";
label variable hinotyr_a          "No health coverage during the past 12 months";
label variable hinotmyr_a         "Months without coverage in the past 12 months";
label variable milspc1_a          "Types of military health care - VA health care original response";
label variable hicov_a            "Have health insurance";
label variable hikind01_a         "Kind(s) of health insurance - private health insurance";
label variable hikind02_a         "Kind(s) of health insurance - Medicare";
label variable hikind03_a         "Kind(s) of health insurance - Medicare supplement (Medigap)";
label variable hikind04_a         "Kind(s) of health insurance - Medicaid";
label variable hikind05_a         "Kind(s) of health insurance - CHIP";
label variable hikind06_a         "Kind(s) of health insurance - military related health care";
label variable hikind07_a         "Kind(s) of health insurance - Indian Health Service";
label variable hikind08_a         "Kind(s) of health insurance - State-sponsored health plan";
label variable hikind09_a         "Kind(s) of health insurance - Other government program";
label variable hikind10_a         "Kind(s) of health insurance - No coverage of any type";
label variable mcareprb_a         "Medicare coverage probe";
label variable mcaidprb_a         "Medicaid coverage probe";
 
* PAY  VARIABLE LABELS;
label variable paybll12m_a        "Problems paying medical bills, past 12m";
label variable paynobllnw_a       "Unable to pay medical bills";
label variable payworry_a         "Get sick or have accident, worry about paying medical bills";
 
* CVD  VARIABLE LABELS;
label variable cvddiag_a          "Ever had COVID-19";
label variable covidtest_a        "Ever been tested for COVID-19";
label variable cvdrslt_a          "Tested positive for COVID-19";
label variable cvdsev_a           "Symptoms of COVID-19";
 
* TSC  VARIABLE LABELS;
label variable cvdsymsm_a         "COVID-19 symptom - loss of smell";
label variable cvdsmrec_a         "COVID-19 symptom - smell recovery";
label variable cvdsymtst_a        "COVID-19 symptom - loss of taste";
label variable cvdtstrec_a        "COVID-19 symptom - taste recovery";
 
* UTZ  VARIABLE LABELS;
label variable lastdr_a           "Time since last saw doctor";
label variable wellness_a         "Was last visit a wellness visit";
label variable wellvis_a          "Time since last wellness visit";
label variable usualpl_a          "Have a usual place to go for care";
label variable usplkind_a         "Type of place for usual care";
label variable urgnt12mtc_a       "Number of times visited urgent care, past 12m, top-coded";
label variable emerg12mtc_a       "Number of times visited hospital emergency room, past 12m, top-coded";
label variable hospongt_a         "Hospitalized overnight, past 12m";
label variable meddl12m_a         "Delayed medical care due to cost, past 12m";
label variable medng12m_a         "Needed medical care but did not get it due to cost, past 12m";
 
* ACC  VARIABLE LABELS;
label variable dlycare_a          "Delayed medical care due to COVID-19";
label variable dngcare_a          "Did not get medical care due to COVID-19";
label variable virapp12m_a        "Virtual medical appointment, past 12m";
label variable virappcvd_a        "Virtual medical appointment related to COVID-19";
 
* CNV  VARIABLE LABELS;
label variable cancovtrea_a       "Cancer treatment since the start of the coronavirus pandemic";
label variable cancovchg_a        "Cancer treatment changed, delayed or cancelled due to the coronavirus pandemic";
label variable cancovoth_a        "Other cancer medical care since the start of the coronavirus pandemic";
label variable cancovcare_a       "Other cancer care changed, delayed, or cancelled due to coronavirus pandemic";
 
* PMD  VARIABLE LABELS;
label variable rx12m_a            "Took prescription medication, past 12m";
label variable rxsk12m_a          "Skipped medication doses to save money, past 12m";
label variable rxls12m_a          "Took less medication to save money, past 12m";
label variable rxdl12m_a          "Delayed filling prescription to save money, past 12m";
label variable rxdg12m_a          "Needed prescription medication but did not get it due to cost, past 12m";
 
* PRV  VARIABLE LABELS;
label variable bplast_a           "Last time blood pressure checked";
label variable chollast_a         "Last time cholesterol checked";
label variable diblast1_a         "Last time blood sugar test";
label variable diba1clast_a       "Last A1C";
label variable diba1cnmt_a        "Number of A1Cs - topcoded";
label variable colorectev_a       "Colonoscopy or sigmoidoscopy";
label variable colorectyp_a       "Colonoscopy or sigmoidoscopy or both";
label variable colwhen_a          "Most recent colonoscopy";
label variable colreason_a        "Why did you have a colonoscopy";
label variable colpay_a           "Pay for most recent colonoscopy";
label variable colsigwhen_a       "Most recent colonoscopy or sigmoidoscopy";
label variable sigwhen_a          "Most recent sigmoidoscopy";
label variable ctcolev1_a         "Ever had colonography/virtual colonoscopy";
label variable ctcolwhen1_a       "Most recent colonography/virtual colonoscopy";
label variable fithev1_a          "Ever had home blood stool test";
label variable fithwhen1_a        "Most recent home blood stool test";
label variable cologuard1_a       "Ever had Cologuard";
label variable fitcolg1_a         "Was blood stool/FIT part of Cologuard test?";
label variable cguardwhe1_a       "When was your last Cologuard?";
label variable colprob1_a         "Did doctor recommend you be tested to look for problems in colon/rectum";
label variable coltest1_a         "Stool blood test/fecal occult blood/FIT test";
label variable coltest2_a         "Cologuard or FIT DNA test";
label variable coltest3_a         "Sigmoidoscopy";
label variable coltest4_a         "Colonoscopy";
label variable coltest5_a         "CT colonography/virtual colonoscopy";
label variable coltest6_a         "Other test for colon cancer";
label variable psatest_a          "Ever had a PSA test";
label variable psawhen_a          "When had most recent PSA test";
label variable psareason_a        "Reason had a PSA test";
label variable psasuggest_a       "Who suggested PSA test";
label variable cervicev1_a        "Ever had cervical cancer screening test";
label variable cervicwhen_a       "When was most recent cervical cancer test";
label variable cerreason1_a       "Reason for cervical cancer screening";
label variable paptest_a          "PAP test at most recent cervical cancer screening";
label variable hpvtest_a          "HPV test at most recent cervical cancer screening";
label variable tellcervic_a       "Doctor tell type of cervical exam";
label variable cervicres_a        "Abnormal pap in past 5 years";
label variable cervicnot1_a       "Why did not get a PAP/HPV test in past 5 years";
label variable hystev1_a          "Had hysterectomy";
label variable mamev_a            "Ever had mammogram";
label variable mamwhen_a          "Most recent mammogram";
label variable mampay_a           "Pay mammogram";
label variable mamreason_a        "Reason for mammogram";
label variable mamage1st1_a       "Age of first mammogram";
label variable mamnot1_a          "Reason no mammogram";
 
* IMS  VARIABLE LABELS;
label variable pregfluyr_a        "Was SA pregnant last flu season";
label variable livebirth_a        "Any live births";
label variable shtflu12m_a        "Flu vaccine, past 12 months";
label variable shtflum_a          "Month of last flu vaccine";
label variable shtfluy_a          "Year of last flu vaccine";
label variable flupreg_a          "Was flu shot before or during pregnancy";
label variable flupreg2_a         "Earlier pregnancy and flu vaccine";
label variable shtcvd19_a         "COVID-19 vaccination";
label variable shtcvd19nm_a       "Number of COVID-19 vaccinations";
label variable cvdvac1mr_a        "Month of most recent COVID-19 vaccination";
label variable cvdvac1yr_a        "Year of most recent COVID-19 vaccination";
label variable cvdvac2mr_a        "Month of next most recent COVID-19 vaccination";
label variable cvdvac2yr_a        "Year of next most recent COVID-19 vaccination";
label variable shtcvd19av_a       "Doctor told need another COVID-19 vaccination";
label variable shtpnuev_a         "Ever had pneumonia shot";
label variable shtpneunb_a        "Number of pneumonia shots";
label variable shtshingle_a       "Ever had a shingles vaccination";
label variable zostavax1_a        "Ever had Zostavax";
label variable zostavxyrp_a       "When was most recent Zostavax shot";
label variable zostawhen_a        "Was Zostavax before 2018";
label variable shingrix1_a        "Ever had Shingrix vaccination";
label variable shingrixnb_a       "How many Shingrix shots";
label variable shingrxyrp_a       "What year did you get your most recent Shingrix shot";
label variable shingwhen_a        "Was last Shingrix before 2018";
label variable tdappreg_a         "Have a Tdap booster shot";
label variable shthepb_a          "Ever receive hepatitis B vaccine";
label variable shthepa_a          "Ever receive hepatitis A vaccine";
label variable livehep_a          "Live with someone with hepatitis";
label variable workhealth_a       "Currently provide medical care to patients";
label variable wrkhlthfc_a        "Currently volunteer or work in health care";
label variable travel_a           "Travel to other countries since 1995";
 
* CGR  VARIABLE LABELS;
label variable homehc12m_a        "Received care at home, past 12m";
label variable homecaredg_a       "Did not get home care due to COVID-19";
label variable famcare12m_a       "Received home care from friend/family";
label variable famcaredng_a       "Did not get family care due to COVID-19";
label variable famcarecvd_a       "Received family care due to COVID-19";
 
* ANX  VARIABLE LABELS;
label variable anxfreq_a          "How often feel worried, nervous, or anxious";
label variable anxmed_a           "Take medication for worried/nervous/anxious feelings";
label variable anxlevel_a         "Level of feelings when last felt worried/nervous/anxious";
 
* DEP  VARIABLE LABELS;
label variable depfreq_a          "How often depressed";
label variable depmed_a           "Take medication for depression";
label variable deplevel_a         "Level of how depressed";
 
* MHC  VARIABLE LABELS;
label variable mhrx_a             "Took medicine for other emotions/concentration/behavior/mental health, past 12m";
label variable mhthrpy_a          "Received counseling/therapy from mental health professional, past 12m";
label variable mhtpynow_a         "Currently receiving counseling/therapy from mental health professional";
label variable mhthdly_a          "Delayed counseling/therapy due to cost, past 12m";
label variable mhthnd_a           "Needed counseling/therapy but did not get it due to cost, past 12m";
 
* SPD  VARIABLE LABELS;
label variable sad_a              "How often felt so sad nothing cheers you up, past 30 days";
label variable nervous_a          "How often felt nervous, past 30 days";
label variable restless_a         "How often felt restless/fidgety, past 30 days";
label variable hopeless_a         "How often felt hopeless, past 30 days";
label variable effort_a           "How often felt everything was an effort, past 30 days";
label variable worthless_a        "How often felt worthless, past 30 days";
label variable k6spd_a            "Experienced serious psychological distress - K6 scale";
 
* PAI  VARIABLE LABELS;
label variable paifrq3m_a         "How often had pain";
label variable paiamnt_a          "How much pain last time";
label variable paiwklm3m_a        "How often pain limits life/work";
label variable paiaffm3m_a        "How often pain impacts family";
label variable paiback3m_a        "Back pain";
label variable paiulmb3m_a        "Pain in hands";
label variable paillmb3m_a        "Pain in hips";
label variable paihdfc3m_a        "Migraine";
label variable paiapg3m_a         "Abdominal pain";
label variable paitooth3m_a       "Toothache/jaw pain";
 
* REP  VARIABLE LABELS;
label variable repstrain_a        "Repetitive strain injuries in the past 3 months";
label variable replimit_a         "Limited by repetitive strain injury in the past 3 months";
label variable repsawdoc_a        "Saw a doctor about repetitive strain injury";
label variable repwrkdytc_a       "Number of workdays missed due to repetitive strain injury in the past 3 months";
label variable repfutwrk_a        "Expected workdays missed due to repetitive strain injury";
label variable repstopchg_a       "Stopped working or changed job due to repetitive strain injury";
label variable repreduce_a        "Reduced work or changed tasks due to repetitive strain injury";
label variable repwrkcaus_a       "Did repetitive strain injury occur while working";
 
* INJ  VARIABLE LABELS;
label variable anyinjury_a        "Any injury in the past 3 months (not including repetitive strain injuries)";
label variable injlimit_a         "Limited by injury in the past 3 months";
label variable numinjtc_a         "Number of non-repetitive strain injuries in the past 3 months";
label variable injhome_a          "Did injury occur at home";
label variable injwork_a          "Did injury occur at work";
label variable injsports_a        "Did injury occur while playing sports or exercising";
label variable injfall_a          "Did injury occur because of a fall";
label variable injfallhom_a       "Did fall occur at home";
label variable injfallwrk_a       "Did fall occur at work";
label variable injmotor_a         "Injury caused by a motor vehicle crash or collision";
label variable injmvtype1_a       "Motor vehicle accident - driver";
label variable injmvtype2_a       "Motor vehicle accident - passenger";
label variable injmvtype3_a       "Motor vehicle accident - bicyclist";
label variable injmvtype4_a       "Motor vehicle accident - pedestrian";
label variable injmvtype5_a       "Motor vehicle accident - something else";
label variable injchores_a        "Did injury occur while doing household activities";
label variable injsawdoc_a        "Saw a doctor about injury";
label variable injer_a            "Visited ER for injury";
label variable injhosp_a          "Hospitalized for injury";
label variable injbones_a         "Did injury cause broken bones";
label variable injstitch_a        "Did injury require stitches or staples";
label variable injwrkdytc_a       "Number of workdays missed due to injury in the past 3 months";
label variable injfutwrk_a        "Expected workdays missed due to injury";
label variable injstopchg_a       "Stopped working or changed jobs due to injury";
label variable injreduce_a        "Reduced work or changed tasks due to injury";
 
* TSM  VARIABLE LABELS;
label variable smelldf_a          "Difficulty smelling";
label variable smellcomp_a        "Smelling compared to past";
label variable smellpht_a         "Smell unpleasant odor";
label variable tastedf_a          "Difficulty tasting";
label variable tastecomp_a        "Tasting compared to past";
label variable tasteflav_a        "Tasting flavors";
label variable tasteunw_a         "Unwanted taste";
label variable tstsmhp_a          "Ever discuss problem with smell/taste with doctor";
label variable tstsmlast_a        "Last time you discuss problem with smell/taste with doctor";
 
* CIG  VARIABLE LABELS;
label variable smkev_a            "Ever smoked 100 cigarettes";
label variable smknow_a           "Now smoke cigarettes";
label variable smkcigst_a         "Cigarette smoking status";
label variable cignow_a           "Number of cigarettes a day";
label variable smk30d_a           "Number of days smoked past month";
label variable cig30d_a           "Number of cigarettes on days smoked past month";
label variable ecigev_a           "Ever used electronic cigarettes";
label variable ecignow_a          "Now use electronic cigarettes";
label variable smkecigst_a        "Electronic cigarette use status";
 
* OTB  VARIABLE LABELS;
label variable cigarev_a          "Ever smoked a cigar";
label variable cigarcur_a         "Now smoke cigars";
label variable cigar30d_a         "How many days smoked a cigar, past 30 days";
label variable pipeev_a           "Ever smoked a pipe filled with tobacco";
label variable pipecur_a          "Now smoked pipe filled with tobacco";
label variable smokelsev_a        "Ever used smokeless tobacco";
label variable smokelscur_a       "Now use smokeless tobacco";
 
* SOS  VARIABLE LABELS;
label variable support_a          "How often social/emotional support";
label variable cmpsupport_a       "Social/emotional support, past 12 months";
 
* ORN  VARIABLE LABELS;
label variable orient_a           "Sexual orientation";
 
* MAR  VARIABLE LABELS;
label variable marital_a          "Sample adult's current marital status";
label variable spousliv_a         "Sample adult's spouse lives here";
label variable spousep_a          "Sample adult's spouse does not reside here due to legal separation";
label variable evrmarried_a       "Sample adult has ever been married";
label variable marstat_a          "Current marital status of sample adult";
label variable legmstat_a         "Legal marital status of sample adult";
label variable spousesex_a        "Sex of sample adult's spouse";
label variable saspprace_a        "Race of sample adult and spouse or partner are the same";
label variable saspphisp_a        "Hispanic ethnicity of sample adult and spouse or partner are the same";
label variable spousagetc_a       "Age of sample adult's spouse, top-coded";
label variable spouseducp_a       "Education level of sample adult's spouse";
label variable spouswrk_a         "Working status of sample adult's spouse";
label variable spouswkft_a        "Sample adult's spouse is working full-time";
label variable prtnrsex_a         "Sex of the sample adult's partner";
label variable prtnragetc_a       "Age of sample adult's partner, top-coded";
label variable prtnreducp_a       "Education level of sample adult's partner";
label variable prtnrwrk_a         "Working status of sample adult's partner";
label variable prtnrwkft_a        "Sample adult's partner is working full-time";
label variable saparentsc_a       "Sample adult relationship to sample child";
label variable parstat_a          "Parental Status of sample adult";
 
* VET  VARIABLE LABELS;
label variable afvet_a            "Ever serve active duty military";
label variable afvettrn_a         "Reserves or National Guard";
label variable combat_a           "Ever served abroad during armed conflict";
label variable vadisb_a           "Have VA disability rating";
label variable vahosp_a           "Receive care at VA facility";
label variable vacareev_a         "Ever use VA health care";
 
* NAT  VARIABLE LABELS;
label variable natusborn_a        "Born in U.S. or U.S. territory";
label variable yrsinus_a          "Years that sample adult has been in the United States";
label variable citznstp_a         "Citizenship status";
 
* SCH  VARIABLE LABELS;
label variable schcurenr_a        "Currently in school";
label variable schdymsstc_a       "Days missed due to illness/injury, past 12 m";
 
* EMP  VARIABLE LABELS;
label variable empwrklsw1_a       "Worked last week";
label variable empwhynot_a        "Main reason not working";
label variable emplstwor1_a       "Last time worked for pay";
label variable empwkhrs3_a        "Hours worked per week (topcoded for Public Use)";
label variable empwrkft1_a        "Usually work 35+ hours per week";
label variable empsicklv_a        "Paid sick leave";
label variable emphealins_a       "Health insurance offered";
label variable empdysmss3_a       "Days missed work, past 12 months (top-coded)";
 
* EMD  VARIABLE LABELS;
label variable emdindstn1_a       "Detailed 2-digit recode for sample adult's industry";
label variable emdindstn2_a       "Simple 2-digit recode for sample adult's industry";
label variable emdoccupn1_a       "Detailed 2-digit recode for sample adult's occupation";
label variable emdoccupn2_a       "Simple 2-digit recode for sample adult's occupation";
label variable emdsuper_a         "Supervise other employees";
label variable emdwrkcat1_a       "Type of main job";
 
* JOB  VARIABLE LABELS;
label variable jobtax_a           "Does employer deduct taxes?";
label variable jobchgearn_a       "How much do your earnings change monthly";
label variable jobshift_a         "Usual hours of main job";
label variable jobchgsch_a        "How easy to change work schedule";
label variable jobvarysch_a       "How much does schedule vary";
label variable jobadvsch_a        "Advance notice of work schedule";
label variable joblkyloss_a       "Likely job loss";
label variable jobwrksick_a       "Days worked while sick";
label variable jobmiss_a          "Days of work missed while sick";
 
* SDW  VARIABLE LABELS;
label variable curjobsd1_a        "Current job - Social distancing at work";
label variable wrkclssd1_a        "Current job - Work close to others with social distancing in effect";
label variable wrkclsnsd1_a       "Current job - Work close to others when social distancing not in effect";
label variable wrkclsoft1_a       "Current job - How often work close to others";
label variable sdmsrs1_a          "Current job - Social distancing measures since coronavirus pandemic";
label variable sdmsrsoft1_a       "Current job - Work close to others when social distancing measures in effect";
label variable recjobsd1_a        "Recent job - Social distancing at work";
label variable jobanysd1_a        "Current or recent job - Social distancing at any time";
label variable rjclssd1_a         "Recent job - Work close to others with social distancing in effect";
label variable clswrksd1_a        "Current or recent job - Work close to others with social distancing in effect";
label variable rjclsnosd1_a       "Recent job - Work close to others when social distancing not in effect";
label variable rjclsoft1_a        "Recent job - How often work close to others";
label variable clswrknos1_a       "Current or recent job - Work close to others when no social distancing measures";
 
* FEM  VARIABLE LABELS;
label variable pcntadtwkp_a       "Number of adults in sample adult's family who are working";
label variable pcntadtwfp_a       "Number of adults in sample adult's family who are working full-time";
 
* INC  VARIABLE LABELS;
label variable incwrko_a          "Income from wages";
label variable incinter_a         "Income from accounts";
label variable incssrr_a          "Income from SS/Railroad Retirement";
label variable incssissdi_a       "Family income from SSDI";
label variable ssissdibth_a       "Which family income SSI/SSDI";
label variable ssissdidsb_a       "SSI/SSDI due to disability";
label variable incwelf_a          "Income from public assistance";
label variable incretire_a        "Income from retirement";
label variable incothr_a          "Income from other sources";
label variable impnum_a           "Imputation number";
label variable povrattc_a         "SA family poverty ratio (top-coded)";
label variable ratcat_a           "Ratio of family income to poverty threshold for SA's family";
label variable impincflg_a        "Imputed SA family income imputation flag";
 
* FOO  VARIABLE LABELS;
label variable fsnap12m_a         "Receive food stamps, past 12m";
label variable fsnap30d_a         "Receive food stamps, past 30d";
label variable fwic12m_a          "Receive WIC benefits, past 12m";
label variable flunch12m_a        "Receive free/reduced meals at school";
 
* FDS  VARIABLE LABELS;
label variable fdsrunout_a        "Worry food would run out";
label variable fdslast_a          "Food didn't last";
label variable fdsbalance_a       "Couldn't afford to eat balanced meals";
label variable fdsskip_a          "Cut the size of meals or skip meals";
label variable fdsskipdys_a       "How many days did you/adults in the family cut the size of meals or skip meals";
label variable fdsless_a          "Eat less than should";
label variable fdshungry_a        "Ever hungry because not enough money for food";
label variable fdsweight_a        "Lose weight because not enough money for food";
label variable fdsnoteat_a        "Not eat for a whole day";
label variable fdsnedays_a        "How many days not eat";
label variable fdscat3_a          "Adult 3 category food security recode";
label variable fdscat4_a          "Adult  4 category food security recode";
 
* HOU  VARIABLE LABELS;
label variable houyrsliv_a        "Length of time in house/apartment";
label variable houtenure_a        "Residence owned/rented";
label variable hougvasst_a        "Paying lower rent";
 
* DEFINE VALUE LABELS FOR REPORTS;
 
label define SA001X
  1    "Underweight"
  2    "Healthy weight"
  3    "Overweight"
  4    "Obese"
  9    "Unknown"
;
 
label define SA002X
  1    "Reassigned to CHIP from private"
;
 
label define SA003X
  1    "Yes, a citizen of the United States"
  2    "No, not a citizen of the United States"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA004X
  1    "Private"
  2    "Medicaid and other public"
  3    "Other coverage"
  4    "Uninsured"
  5    "Don't Know"
;
 
label define SA005X
  1    "Private"
  2    "Dual eligible"
  3    "Medicare Advantage"
  4    "Medicare only excluding Medicare Advantage"
  5    "Other coverage"
  6    "Uninsured"
  7    "Don't Know"
;
 
label define SA006X
  1    "1"
  2    "2"
  3    "3"
  4    "4"
  5    "5 or more"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA007X
  1    "Current e-cigarette user"
  2    "Used e-cigarette, not current user"
  3    "Never e-cigarette user"
  4    "E-cigarette user, current status unknown"
  9    "Unknown if ever used e-cigarette"
;
 
label define SA008X
  01   "Grade 0-11"
  02   "12th grade, no diploma"
  03   "GED or equivalent"
  04   "High School Graduate"
  05   "Some college, no degree"
  06   "Associate degree: occupational, technical, or vocational program"
  07   "Associate degree: academic program"
  08   "Bachelor's degree (Example: BA, AB, BS, BBA)"
  09   "Master's degree (Example: MA, MS, MEng, MEd, MBA)"
  10   "Professional School or Doctoral degree (Example: MD, DDS, DVM, JD, PhD, EdD)"
  97   "Refused"
  98   "Not Ascertained"
  99   "Don't Know"
;
 
label define SA009X
  0    "0 times"
  1    "1 time"
  2    "2 times"
  3    "3 times"
  4    "4+ times"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA010X
  1    "Exchange plan"
  2    "Not exchange plan"
  8    "Not Ascertained"
;
 
label define SA011X
  1    "Company provides exchange plans"
  2    "Not an exchange company"
  3    "Exchange Portal or exact exchange plan name"
  8    "Not Ascertained"
;
 
label define SA012X
  1    "Food secure"
  2    "Low food security"
  3    "Very low food security"
  8    "Not Ascertained"
;
 
label define SA013X
  1    "High food security"
  2    "Marginal food security"
  3    "Low food security"
  4    "Very low food security"
  8    "Not Ascertained"
;
 
label define SA014X
  1    "Person is sample adult"
;
 
label define SA015X
  1    "Hispanic (Mexican/Mexican American)"
  2    "Hispanic (all other groups)"
  3    "Not Hispanic"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA016X
  01   "Hispanic"
  02   "Non-Hispanic White only"
  03   "Non-Hispanic Black/African American only"
  04   "Non-Hispanic Asian only"
  05   "Non-Hispanic AIAN only"
  06   "Non-Hispanic AIAN and any other group"
  07   "Other single and multiple races"
  97   "Refused"
  98   "Not Ascertained"
  99   "Don't Know"
;
 
label define SA017X
  1    "Yes, information"
  2    "Yes, but no information"
  3    "No"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA018X
  01   "January"
  02   "February"
  03   "March"
  04   "April"
  05   "May"
  06   "June"
  07   "July"
  08   "August"
  09   "September"
  10   "October"
  11   "November"
  12   "December"
;
 
label define SA019X
  1    "Quarter 1"
  2    "Quarter 2"
  3    "Quarter 3"
  4    "Quarter 4"
;
 
label define SA020X
  1    "Experienced serious psychological distress"
  2    "Did not experience serious psychological distress"
  8    "Not ascertained"
;
 
label define SA021X
  1    "Separated"
  2    "Divorced"
  3    "Married"
  4    "Single/never married"
  5    "Widowed"
  9    "Unknown legal marital status"
;
 
label define SA022X
  1    "Reassigned to Medicaid from private"
;
 
label define SA023X
  1    "Married, spouse is present"
  2    "Married, spouse is not present"
  3    "Married, spouse presence unknown"
  4    "Widowed"
  5    "Divorced"
  6    "Separated"
  7    "Never married"
  8    "Living with a partner"
  9    "Unknown marital status"
;
 
label define SA024X
  1    "Medicare Advantage"
  2    "Private plan not Medicare Advantage"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA025X
  1    "Mentioned"
  2    "Not mentioned"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA026X
  1    "Multiple families in household"
  2    "Only one family in household"
  9    "Unknown"
;
 
label define SA027X
  0    "None"
  1    "1 or more"
;
 
label define SA028X
  1    "Not covered"
  2    "Covered"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA029X
  1    "Reassigned to other government from private"
;
 
label define SA030X
  1    "Reassigned to other public from private"
;
 
label define SA031X
  1    "Yes, the sample adult is a parent of a child residing in the family"
  2    "There are minor children residing in family but sample adult is not their parent"
  3    "There are no minor children residing in the family"
  9    "Unknown"
;
 
label define SA032X
  0    "0 adults"
  1    "1 adult"
  2    "2 adults"
  3    "3+ adults"
  8    "Not Ascertained"
;
 
label define SA033X
  1    "1 adult"
  2    "2 adults"
  3    "3+ adults"
  8    "Not Ascertained"
;
 
label define SA034X
  0    "0 children"
  1    "1 child"
  2    "2 children"
  3    "3+ children"
  8    "Not Ascertained"
;
 
label define SA035X
  01   "Through an employer, union, or professional organization"
  02   "Purchased directly"
  03   "Through Healthcare.gov or the Affordable Care Act, also known as Obamacare"
  04   "Through a state or local government or community program"
  05   "Other"
  06   "Through school"
  07   "Through parents"
  08   "Through other relative"
  97   "Refused"
  98   "Not Ascertained"
  99   "Don't Know"
;
 
label define SA036X
  1    "Reassigned to private from public"
;
 
label define SA037X
  1    "Deductible is less than $1,400"
  2    "Deductible is $1,400 or more"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA038X
  1    "White only"
  2    "Black/African American only"
  3    "Asian only"
  4    "AIAN only"
  5    "AIAN and any other group"
  6    "Other single and multiple races"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't know"
;
 
label define SA039X
  01   "0.00 - 0.49"
  02   "0.50 - 0.74"
  03   "0.75 - 0.99"
  04   "1.00 - 1.24"
  05   "1.25 - 1.49"
  06   "1.50 - 1.74"
  07   "1.75 - 1.99"
  08   "2.00 - 2.49"
  09   "2.50 - 2.99"
  10   "3.00 - 3.49"
  11   "3.50 - 3.99"
  12   "4.00 - 4.49"
  13   "4.50 - 4.99"
  14   "5.00 or greater"
  98   "Not Ascertained"
;
 
label define SA040X
  10   "Sample Adult"
  20   "Sample Child"
  30   "Sample Adult Income"
  40   "Sample Child Income"
  50   "Paradata"
;
 
label define SA041X
  1    "Northeast"
  2    "Midwest"
  3    "South"
  4    "West"
;
 
label define SA042X
  1    "Sample adult is parent of sample child"
  2    "Sample adult is not parent of  sample child"
  3    "No sample child in sample adult's family"
  9    "Unknown"
;
 
label define SA043X
  1    "Current every day smoker"
  2    "Current some day smoker"
  3    "Former smoker"
  4    "Never smoker"
  5    "Smoker, current status unknown"
  9    "Unknown if ever smoked"
;
 
label define SA044X
  1    "All of the time"
  2    "Most of the time"
  3    "Some of the time"
  4    "None of the time"
  5    "Only worked at main job when social distancing measures were in effect"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA045X
  0    "0 times"
  1    "1 time"
  2    "2 times"
  3    "3 times"
  4    "4 times"
  5    "5+ times"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA046X
  1    "Large central metro"
  2    "Large fringe metro"
  3    "Medium and small metro"
  4    "Nonmetropolitan"
;
 
label define SA047X
  1    "Yes"
  2    "No"
  9    "Don't Know"
;
 
label define SA048X
  1    "Yes"
  2    "No"
  3    "Unknown"
;
 
label define SA049X
  1    "Yes"
;
 
label define SA050X
  1    "Less than 1 year"
  2    "1 to less than 5 years"
  3    "5 to less than 10 years"
  4    "10 to less than 15 years"
  5    "15 years or more"
  9    "Unknown"
;
 
label define SA051X
  1    "Less than 65"
  2    "65 or older"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA052X
  1    "All of the time"
  2    "Most of the time"
  3    "Some of the time"
  4    "A little of the time"
  5    "None of the time"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA053X
  1    "Very worried"
  2    "Somewhat worried"
  3    "Not at all worried"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA054X
  1    "Better"
  2    "Worse"
  3    "No Change"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA055X
  1    "More social and emotional support"
  2    "Less social and emotional support"
  3    "About the same"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA056X
  1    "A few things"
  2    "A lot of things"
  3    "Almost everything"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA057X
  1    "Sometimes"
  2    "Often"
  3    "All of the time"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA058X
  1    "Difficulty remembering only"
  2    "Difficulty concentrating only"
  3    "Difficulty with both remembering and concentrating"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA059X
  1    "Colonoscopy"
  2    "Sigmoidoscopy"
  3    "Both"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA060X
  1    "Part of a routine exam"
  2    "Because of a problem"
  3    "Follow-up test of an earlier test or screening exam"
  4    "Other reason"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA061X
  1    "Yes"
  2    "No"
  3    "Did not receive results"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA062X
  1    "No symptoms"
  2    "Mild symptoms"
  3    "Moderate symptoms"
  4    "Severe symptoms"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA063X
  1    "1 vaccination"
  2    "2 vaccinations"
  3    "More than 2 vaccinations"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA064X
  97   "Refused"
  98   "Not Ascertained"
  99   "Don't Know"
;
 
label define SA065X
  97   "Refused"
  98   "Not Ascertained"
  99   "Don't Know"
;
 
label define SA066X
  97   "Refused"
  98   "Not Ascertained"
  99   "Don't Know"
;
 
label define SA067X
  97   "Refused"
  98   "Not Ascertained"
  99   "Don't Know"
;
 
label define SA068X
  1    "Less than 1 month"
  2    "1 month to less than 6 months"
  3    "6 months to less than 1 year"
  4    "1 year or more"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA069X
  1    "Type 1"
  2    "Type 2"
  3    "Other type of diabetes"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA070X
  1    "No difficulty"
  2    "Some difficulty"
  3    "A lot of difficulty"
  4    "Cannot do at all"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA071X
  1    "No difficulty"
  2    "A little difficulty"
  3    "Moderate difficulty"
  4    "A lot of difficulty"
  5    "Cannot smell at all"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA072X
  1    "No difficulty"
  2    "A little difficulty"
  3    "Moderate difficulty"
  4    "A lot of difficulty"
  5    "Cannot taste at all"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA073X
  00   "Never attended/kindergarten only"
  01   "Grade 1-11"
  02   "12th grade, no diploma"
  03   "GED or equivalent"
  04   "High School Graduate"
  05   "Some college, no degree"
  06   "Associate degree: occupational, technical, or vocational program"
  07   "Associate degree: academic program"
  08   "Bachelor's degree (Example: BA, AB, BS, BBA)"
  09   "Master's degree (Example: MA, MS, MEng, MEd, MBA)"
  10   "Professional School or Doctoral degree (Example: MD, DDS, DVM, JD, PhD, EdD)"
  97   "Refused"
  98   "Not Ascertained"
  99   "Don't Know"
;
 
label define SA074X
  1    "Employee of a PRIVATE company for wages"
  2    "A FEDERAL government employee"
  3    "A STATE government employee"
  4    "A LOCAL government employee"
  5    "Self-employed in OWN business, professional practice or farm"
  6    "Working WITHOUT PAY in a family-owned business or farm"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA075X
  1    "Within the past 12 months"
  2    "1-5 years ago"
  3    "Over 5 years ago"
  4    "Never worked"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA076X
  01   "Unemployed, laid off, looking for work"
  02   "Seasonal/contract work"
  03   "Retired"
  04   "Unable to work for health reasons/disabled"
  05   "Taking care of house or family"
  06   "Going to school"
  07   "Working at a family-owned job or business not for pay"
  08   "Other"
  97   "Refused"
  98   "Not Ascertained"
  99   "Don't Know"
;
 
label define SA077X
  0    "0"
  1    "1"
  2    "2 or 3"
  3    "4 or more"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't know"
;
 
label define SA078X
  1    "Part of a routine exam"
  2    "Because of a problem"
  3    "Other reason"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA079X
  1    "Every day"
  2    "Some days"
  3    "Not at all"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA080X
  1    "Fully recovered"
  2    "Partially recovered"
  3    "Not recovered at all"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA081X
  1    "All of the time"
  2    "Some of the time"
  3    "Rarely"
  4    "Never"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA082X
  1    "Owned or being bought"
  2    "Rented"
  3    "Other arrangement"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA083X
  1    "Never"
  2    "Some days"
  3    "Most days"
  4    "Every day"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA084X
  1    "Daily"
  2    "Weekly"
  3    "Monthly"
  4    "A few times a year"
  5    "Never"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA085X
  1    "1 day or less"
  2    "2 to 3 days"
  3    "4 to 6 days"
  4    "1 to 2 weeks"
  5    "2 to 4 weeks"
  6    "More than 1 month"
  7    "Refused"
  8    "Not ascertained"
  9    "Don't know"
;
 
label define SA086X
  1    "Not at all"
  2    "A small amount"
  3    "A moderate amount"
  4    "A large amount"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA087X
  1    "Very easy"
  2    "Somewhat easy"
  3    "Somewhat difficult"
  4    "Very difficult"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA088X
  1    "Very likely"
  2    "Fairly likely"
  3    "Somewhat likely"
  4    "Not at all likely"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA089X
  1    "Daytime shift"
  2    "Evening shift"
  3    "Night shift"
  4    "Rotating shift"
  5    "Some other shift"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA090X
  1    "A little"
  2    "A lot"
  3    "Somewhere in between a little and a lot"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA091X
  1    "LSATIS11_A asked first in SA"
  2    "LSATIS4_A asked first in SA"
;
 
label define SA092X
  01   "No reason/never thought about it"
  02   "Didn't need it/didn't know I needed this type of test"
  03   "Doctor didn't order it/didn't say I needed it"
  04   "Haven't had any problems"
  05   "Put it off/didn't get around to it"
  06   "Too expensive/no insurance/cost"
  07   "Too painful, unpleasant, or embarrassing"
  08   "Don't have a doctor"
  09   "I am too old"
  10   "I am too young"
  11   "Other"
  97   "Refused"
  98   "Not Ascertained"
  99   "Don't Know"
;
 
label define SA093X
  1    "Married"
  2    "Living with a partner together as an unmarried couple"
  3    "Neither"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA094X
  1    "Part A- hospital only"
  2    "Part B- medical only"
  3    "Both Part A and Part B"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA095X
  1    "Mentioned"
  2    "Not mentioned"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA096X
  01   "January"
  02   "February"
  03   "March"
  04   "April"
  05   "May"
  06   "June"
  07   "July"
  08   "August"
  09   "September"
  10   "October"
  11   "November"
  12   "December"
  97   "Refused"
  98   "Not Ascertained"
  99   "Don't Know"
;
 
label define SA097X
  97   "Refused"
  98   "Not Ascertained"
  99   "Don't Know"
;
 
label define SA098X
  1    "Not at all"
  2    "A little"
  3    "A lot"
  4    "Somewhere in between a little and a lot"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA099X
  1    "^GayLesbian"
  2    "Straight, that is, not ^gaylesbian"
  3    "Bisexual"
  4    "Something else"
  5    "I don't know the answer"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA100X
  1    "Less overwhelmed"
  2    "More overwhelmed"
  3    "About the same"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA101X
  01   "No reason/never thought about it"
  02   "Didn't need it/didn't know I needed this type of test"
  03   "Doctor didn't order it/didn't say I needed it"
  04   "Haven't had any problems"
  05   "Put it off/didn't get around to it"
  06   "Too expensive/no insurance/cost"
  07   "Too painful, unpleasant, or embarrassing"
  08   "Had hysterectomy"
  09   "Don't have a doctor"
  10   "Had HPV vaccine"
  11   "I am too old"
  12   "I am too young"
  13   "Other"
  97   "Refused"
  98   "Not Ascertained"
  99   "Don't Know"
;
 
label define SA102X
  1    "Excellent"
  2    "Very Good"
  3    "Good"
  4    "Fair"
  5    "Poor"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA103X
  1    "A doctor's office or health center"
  2    "Urgent care center or clinic in a drug store or grocery store"
  3    "Hospital emergency room"
  4    "A VA Medical Center or VA outpatient clinic"
  5    "Some other place"
  6    "Does not go to one place most often"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA104X
  1    "Less than ^HDHPAMT_A"
  2    "^HDHPAMT_A or more"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA105X
  1    "Relative who lives in household"
  2    "Relative who doesn't live in household"
  3    "Nonrelative who lives in household"
  4    "Nonrelative who does not live in household"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA106X
  1    "Child"
  2    "Spouse"
  3    "Former spouse"
  4    "Some other relationship"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA107X
  1    "None of the cost"
  2    "Part of the cost"
  3    "All of the cost"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA108X
  1    "Self"
  2    "Doctor"
  3    "Someone else"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA109X
  1    "One pneumonia shot"
  2    "Two pneumonia shots"
  3    "More than two pneumonia shots"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA110X
  1    "All of the time"
  2    "Most of the time"
  3    "Some of the time"
  4    "None of the time"
  5    "Only worked at main job while social distancing measures were in effect"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA111X
  1    "Available"
  2    "Not Available or not able to answer right now"
  3    "Physical or mental condition prohibits responding"
  7    "Refused"
  8    "Not Ascertained"
;
 
label define SA112X
  1    "Very satisfied"
  2    "Satisfied"
  3    "Dissatisfied"
  4    "Very dissatisfied"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA113X
  97   "Refused"
  98   "Not Ascertained"
  99   "Don't Know"
;
 
label define SA114X
  1    "All of the time"
  2    "Most of the time"
  3    "Some of the time"
  4    "None of the time"
  5    "Did not work at main job when social distancing measures were in effect"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA115X
  1    "Male"
  2    "Female"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA116X
  1    "One Shingrix shot"
  2    "Two Shingrix shots"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA117X
  1    "All of the time"
  2    "Most of the time"
  3    "Some of the time"
  4    "None of the time"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA118X
  1    "SSI"
  2    "SSDI"
  3    "Both SSI and SSDI"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA119X
  0    "Not applicable/None eligible"
  1    "Completed"
  2    "HH member selected"
  3    "Reached Sample Adult"
  4    "Started HIS section"
  5    "Sufficient Partial"
  6    "HH member selected and no longer eligible"
  7    "Refused"
;
 
label define SA120X
  1    "Always"
  2    "Usually"
  3    "Sometimes"
  4    "Rarely"
  5    "Never"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA121X
  1    "Within the past year (anytime less than 12 months ago)"
  2    "Within the past 2 years (1 year but less than 2 years ago)"
  3    "Within the past 3 years (2 years but less than 3 years ago)"
  4    "Within the past 5 years (3 years but less than 5 years ago)"
  5    "Within the past 10 years (5 years but less than 10 year ago)"
  6    "10 years ago or more"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA122X
  0    "Never"
  1    "Within the past year (anytime less than 12 months ago)"
  2    "Within the last 2 years (1 year but less than 2 years ago)"
  3    "Within the last 3 years (2 years but less than 3 years ago)"
  4    "Within the last 5 years (3 years but less than 5 years ago)"
  5    "Within the last 10 years (5 years but less than 10 years ago)"
  6    "10 years ago or more"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA123X
  1    "Less than 1 year"
  2    "1 to 3 years"
  3    "4 to 10 years"
  4    "11 to 20 years"
  5    "More than 20 years"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA124X
  1    "Often true"
  2    "Sometimes true"
  3    "Never true"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA125X
  1    "Yes"
  2    "There is NO place"
  3    "There is MORE THAN ONE place"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA126X
  1    "All of the time"
  2    "Most of the time"
  3    "Some of the time"
  4    "None of the time"
  5    "Only worked at current main job while social distancing measures were in effect"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA127X
  1    "Yes"
  2    "No"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA128X
  1    "Before pregnancy"
  2    "During pregnancy"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA129X
  1    "Before pregnancy"
  2    "During pregnancy"
  3    "After pregnancy"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
label define SA130X
  1    "Under 30 years"
  2    "30-39"
  3    "40-49"
  4    "50-59"
  5    "60-74"
  6    "75 years or older"
  7    "Refused"
  8    "Not Ascertained"
  9    "Don't Know"
;
 
* ASSOCIATE VARIABLES WITH VALUE LABEL DEFINITIONS;
 
* IDN  VALUE LABEL ASSOCIATIONS;
label values  rectype          SA040X; 
 
* UCF  VALUE LABEL ASSOCIATIONS;
label values  urbrrl           SA046X; label values   region           SA041X; 
 
* FLG  VALUE LABEL ASSOCIATIONS;
label values  hhrespsa_flg     SA049X; 
 
* GEN  VALUE LABEL ASSOCIATIONS;
label values  intv_qrt         SA019X; label values   intv_mon         SA018X;
label values  hhstat_a         SA014X; label values   astatnew         SA119X;
label values  avail_a          SA111X; label values   proxy_a          SA127X;
label values  proxyrel_a       SA105X; 
 
* HHC  VALUE LABEL ASSOCIATIONS;
label values  age65            SA051X; label values   sex_a            SA115X;
label values  educp_a          SA073X; label values   afnow            SA127X;
label values  hisp_a           SA127X; label values   hispallp_a       SA016X;
label values  hisdetp_a        SA015X; label values   raceallp_a       SA038X;
label values  pcnt18uptc       SA032X; label values   pcntlt18tc       SA034X; 
 
* FAM  VALUE LABEL ASSOCIATIONS;
label values  pcntadlt_a       SA033X; label values   pcntkids_a       SA034X;
label values  over65flg_a      SA027X; label values   mltfamflg_a      SA026X;
label values  maxeducp_a       SA073X; 
 
* HIS  VALUE LABEL ASSOCIATIONS;
label values  phstat_a         SA102X; 
 
* LS3  VALUE LABEL ASSOCIATIONS;
label values  lsatis11r_a      SA113X; label values   lsatis4r_a       SA112X;
label values  lsrotate_flg     SA091X; 
 
* HYP  VALUE LABEL ASSOCIATIONS;
label values  hypev_a          SA127X; label values   hypdif_a         SA127X;
label values  hyp12m_a         SA127X; label values   hypmed_a         SA127X; 
 
* CHL  VALUE LABEL ASSOCIATIONS;
label values  chlev_a          SA127X; label values   chl12m_a         SA127X;
label values  chlmed_a         SA127X; 
 
* CVC  VALUE LABEL ASSOCIATIONS;
label values  chdev_a          SA127X; label values   angev_a          SA127X;
label values  miev_a           SA127X; label values   strev_a          SA127X; 
 
* ASP  VALUE LABEL ASSOCIATIONS;
label values  aspmedev_a       SA127X; label values   aspmednown_a     SA127X;
label values  aspmedstp_a      SA127X; label values   asponown_a       SA127X; 
 
* AST  VALUE LABEL ASSOCIATIONS;
label values  asev_a           SA127X; label values   astill_a         SA127X;
label values  asat12m_a        SA127X; label values   aser12m_a        SA127X; 
 
* CAN  VALUE LABEL ASSOCIATIONS;
label values  canev_a          SA127X; label values   bladdcan_a       SA025X;
label values  bloodcan_a       SA025X; label values   bonecan_a        SA025X;
label values  braincan_a       SA025X; label values   breascan_a       SA025X;
label values  cervican_a       SA025X; label values   coloncan_a       SA025X;
label values  esophcan_a       SA025X; label values   gallbcan_a       SA025X;
label values  laryncan_a       SA025X; label values   leukecan_a       SA025X;
label values  livercan_a       SA025X; label values   lungcan_a        SA025X;
label values  lymphcan_a       SA025X; label values   melancan_a       SA025X;
label values  mouthcan_a       SA025X; label values   ovarycan_a       SA025X;
label values  pancrcan_a       SA025X; label values   prostcan_a       SA025X;
label values  rectucan_a       SA025X; label values   sknmcan_a        SA025X;
label values  sknnmcan_a       SA025X; label values   skndkcan_a       SA025X;
label values  stomacan_a       SA025X; label values   throacan_a       SA025X;
label values  thyrocan_a       SA025X; label values   uterucan_a       SA025X;
label values  hdnckcan_a       SA025X; label values   colrccan_a       SA025X;
label values  othercanp_a      SA025X; 
 
* DIB  VALUE LABEL ASSOCIATIONS;
label values  predib_a         SA127X; label values   gesdib_a         SA127X;
label values  dibev_a          SA127X; label values   dibpill_a        SA127X;
label values  dibins_a         SA127X; label values   dibinstime_a     SA068X;
label values  dibinsstop_a     SA127X; label values   dibinsstyr_a     SA127X;
label values  insskip12m_a     SA127X; label values   insless12m_a     SA127X;
label values  insdly12m_a      SA127X; label values   dibtype_a        SA069X;
label values  dibstress_a      SA120X; label values   dibcstress_a     SA100X; 
 
* CON  VALUE LABEL ASSOCIATIONS;
label values  copdev_a         SA127X; label values   arthev_a         SA127X;
label values  demenev_a        SA127X; label values   anxev_a          SA127X;
label values  depev_a          SA127X; 
 
* RCN  VALUE LABEL ASSOCIATIONS;
label values  kidweakev_a      SA127X; label values   hepev_a          SA127X;
label values  liverev_a        SA127X; label values   cfsev_a          SA127X;
label values  cfsnow_a         SA127X; label values   coldflu12m_a     SA127X;
label values  drymth12m_a      SA127X; 
 
* ISN  VALUE LABEL ASSOCIATIONS;
label values  medrxtrt_a       SA127X; label values   hlthcond_a       SA127X; 
 
* EPI  VALUE LABEL ASSOCIATIONS;
label values  epiev_a          SA127X; label values   epimed_a         SA127X;
label values  epinumsezp_a     SA077X; label values   epidr_a          SA127X; 
 
* ALG  VALUE LABEL ASSOCIATIONS;
label values  curresp_a        SA127X; label values   dxresp_a         SA127X;
label values  curfood_a        SA127X; label values   dxfood_a         SA127X;
label values  curskin_a        SA127X; label values   dxskin_a         SA127X; 
 
* BMI  VALUE LABEL ASSOCIATIONS;
label values  pregnow_a        SA127X; label values   bmicat_a         SA001X; 
 
* VIS  VALUE LABEL ASSOCIATIONS;
label values  wearglss_a       SA127X; label values   visiondf_a       SA070X; 
 
* HEA  VALUE LABEL ASSOCIATIONS;
label values  hearaid_a        SA127X; label values   hearaidfr_a      SA081X;
label values  hearingdf_a      SA070X; label values   hearqtrm_a       SA070X;
label values  hearnyrm_a       SA070X; 
 
* MOB  VALUE LABEL ASSOCIATIONS;
label values  diff_a           SA070X; label values   equip_a          SA127X;
label values  wlk100_a         SA070X; label values   wlk13m_a         SA070X;
label values  steps_a          SA070X; label values   canewlkr_a       SA127X;
label values  wchair_a         SA127X; label values   perasst_a        SA127X;
label values  noeqwlk100_a     SA070X; label values   noeqwlk13m_a     SA070X;
label values  noeqsteps_a      SA070X; label values   eqwlk100_a       SA070X;
label values  eqwlk13m_a       SA070X; label values   eqsteps_a        SA070X; 
 
* COM  VALUE LABEL ASSOCIATIONS;
label values  comdiff_a        SA070X; label values   comusesl_a       SA127X; 
 
* COG  VALUE LABEL ASSOCIATIONS;
label values  cogmemdff_a      SA070X; label values   cogtypedff_a     SA058X;
label values  cogfrqdff_a      SA057X; label values   cogamtdff_a      SA056X; 
 
* UPP  VALUE LABEL ASSOCIATIONS;
label values  uppslfcr_a       SA070X; label values   uppraise_a       SA070X;
label values  uppobjct_a       SA070X; label values   disab3_a         SA047X; 
 
* SOC  VALUE LABEL ASSOCIATIONS;
label values  socerrnds_a      SA070X; label values   socsclpar_a      SA070X;
label values  socwrklim_a      SA127X; 
 
* ADO  VALUE LABEL ASSOCIATIONS;
label values  devdonset_a      SA127X; 
 
* INS  VALUE LABEL ASSOCIATIONS;
label values  notcov_a         SA028X; label values   cover_a          SA004X;
label values  cover65_a        SA005X; label values   sincovde_a       SA127X;
label values  sincovvs_a       SA127X; label values   sincovrx_a       SA127X;
label values  medicare_a       SA017X; label values   mcpart_a         SA094X;
label values  mcchoice_a       SA127X; label values   mchmo_a          SA127X;
label values  mcadvr_a         SA024X; label values   mcpartd_a        SA127X;
label values  medicaid_a       SA017X; label values   maxchng_a        SA127X;
label values  maprem_a         SA127X; label values   madeduc_a        SA127X;
label values  mahdhp_a         SA037X; label values   maflg_a          SA022X;
label values  private_a        SA017X; label values   exchange_a       SA010X;
label values  polhld1_a        SA127X; label values   prplcov1_a       SA127X;
label values  prpolh1_a        SA106X; label values   prplcov1_c_a     SA127X;
label values  plnwrkr1_a       SA035X; label values   plnexchg1_a      SA127X;
label values  pln1pay1_a       SA095X; label values   pln1pay2_a       SA095X;
label values  pln1pay3_a       SA095X; label values   pln1pay4_a       SA095X;
label values  pln1pay5_a       SA095X; label values   pln1pay6_a       SA095X;
label values  prdeduc1_a       SA127X; label values   prhdhp1_a        SA104X;
label values  hsahra1_a        SA127X; label values   prrxcov1_a       SA127X;
label values  prdncov1_a       SA127X; label values   prvscov1_a       SA127X;
label values  exchpr1_a        SA011X; label values   prflg_a          SA036X;
label values  pxchng1_a        SA127X; label values   prprem1_a        SA127X;
label values  plexchpr1_a      SA011X; label values   polhld2_a        SA127X;
label values  prplcov2_a       SA127X; label values   prpolh2_a        SA106X;
label values  prplcov2_c_a     SA127X; label values   plnwrkr2_a       SA035X;
label values  plnexchg2_a      SA127X; label values   pln2pay1_a       SA095X;
label values  pln2pay2_a       SA095X; label values   pln2pay3_a       SA095X;
label values  pln2pay4_a       SA095X; label values   pln2pay5_a       SA095X;
label values  pln2pay6_a       SA095X; label values   prdeduc2_a       SA127X;
label values  prhdhp2_a        SA104X; label values   hsahra2_a        SA127X;
label values  prrxcov2_a       SA127X; label values   prdncov2_a       SA127X;
label values  prvscov2_a       SA127X; label values   exchpr2_a        SA011X;
label values  chip_a           SA017X; label values   chxchng_a        SA127X;
label values  chprem_a         SA127X; label values   chdeduc_a        SA127X;
label values  chhdhp_a         SA037X; label values   chflg_a          SA002X;
label values  othpub_a         SA017X; label values   opxchng_a        SA127X;
label values  opprem_a         SA127X; label values   opdeduc_a        SA127X;
label values  ophdhp_a         SA037X; label values   plexchop_a       SA011X;
label values  opflg_a          SA030X; label values   othgov_a         SA017X;
label values  ogxchng_a        SA127X; label values   ogprem_a         SA127X;
label values  ogdeduc_a        SA127X; label values   oghdhp_a         SA037X;
label values  plexchog_a       SA011X; label values   ogflg_a          SA029X;
label values  military_a       SA017X; label values   milspc1r_a       SA095X;
label values  milspc2_a        SA095X; label values   milspc3_a        SA095X;
label values  ihs_a            SA127X; label values   hilast_a         SA122X;
label values  hilastmy_a       SA097X; label values   histopjob_a      SA127X;
label values  histopmiss_a     SA127X; label values   histopage_a      SA127X;
label values  histopcost_a     SA127X; label values   histopelig_a     SA127X;
label values  rsnhicost_a      SA127X; label values   rsnhiwant_a      SA127X;
label values  rsnhielig_a      SA127X; label values   rsnhiconf_a      SA127X;
label values  rsnhimeet_a      SA127X; label values   rsnhiwait_a      SA127X;
label values  rsnhioth_a       SA127X; label values   rsnhijob_a       SA127X;
label values  rsnhimiss_a      SA127X; label values   hinotyr_a        SA127X;
label values  hinotmyr_a       SA097X; label values   milspc1_a        SA095X;
label values  hicov_a          SA127X; label values   hikind01_a       SA095X;
label values  hikind02_a       SA095X; label values   hikind03_a       SA095X;
label values  hikind04_a       SA095X; label values   hikind05_a       SA095X;
label values  hikind06_a       SA095X; label values   hikind07_a       SA095X;
label values  hikind08_a       SA095X; label values   hikind09_a       SA095X;
label values  hikind10_a       SA095X; label values   mcareprb_a       SA127X;
label values  mcaidprb_a       SA127X; 
 
* PAY  VALUE LABEL ASSOCIATIONS;
label values  paybll12m_a      SA127X; label values   paynobllnw_a     SA127X;
label values  payworry_a       SA053X; 
 
* CVD  VALUE LABEL ASSOCIATIONS;
label values  cvddiag_a        SA127X; label values   covidtest_a      SA127X;
label values  cvdrslt_a        SA061X; label values   cvdsev_a         SA062X; 
 
* TSC  VALUE LABEL ASSOCIATIONS;
label values  cvdsymsm_a       SA127X; label values   cvdsmrec_a       SA080X;
label values  cvdsymtst_a      SA127X; label values   cvdtstrec_a      SA080X; 
 
* UTZ  VALUE LABEL ASSOCIATIONS;
label values  lastdr_a         SA122X; label values   wellness_a       SA127X;
label values  wellvis_a        SA122X; label values   usualpl_a        SA125X;
label values  usplkind_a       SA103X; label values   urgnt12mtc_a     SA045X;
label values  emerg12mtc_a     SA009X; label values   hospongt_a       SA127X;
label values  meddl12m_a       SA127X; label values   medng12m_a       SA127X; 
 
* ACC  VALUE LABEL ASSOCIATIONS;
label values  dlycare_a        SA127X; label values   dngcare_a        SA127X;
label values  virapp12m_a      SA127X; label values   virappcvd_a      SA127X; 
 
* CNV  VALUE LABEL ASSOCIATIONS;
label values  cancovtrea_a     SA127X; label values   cancovchg_a      SA127X;
label values  cancovoth_a      SA127X; label values   cancovcare_a     SA127X; 
 
* PMD  VALUE LABEL ASSOCIATIONS;
label values  rx12m_a          SA127X; label values   rxsk12m_a        SA127X;
label values  rxls12m_a        SA127X; label values   rxdl12m_a        SA127X;
label values  rxdg12m_a        SA127X; 
 
* PRV  VALUE LABEL ASSOCIATIONS;
label values  bplast_a         SA122X; label values   chollast_a       SA122X;
label values  diblast1_a       SA122X; label values   diba1clast_a     SA122X;
label values  diba1cnmt_a      SA006X; label values   colorectev_a     SA127X;
label values  colorectyp_a     SA059X; label values   colwhen_a        SA121X;
label values  colreason_a      SA060X; label values   colpay_a         SA107X;
label values  colsigwhen_a     SA121X; label values   sigwhen_a        SA121X;
label values  ctcolev1_a       SA127X; label values   fithev1_a        SA127X;
label values  fithwhen1_a      SA121X; label values   cologuard1_a     SA127X;
label values  fitcolg1_a       SA127X; label values   cguardwhe1_a     SA121X;
label values  colprob1_a       SA127X; label values   coltest1_a       SA095X;
label values  coltest2_a       SA095X; label values   coltest3_a       SA095X;
label values  coltest4_a       SA095X; label values   coltest5_a       SA095X;
label values  coltest6_a       SA095X; label values   psatest_a        SA127X;
label values  psawhen_a        SA121X; label values   psareason_a      SA078X;
label values  psasuggest_a     SA108X; label values   cervicev1_a      SA127X;
label values  cervicwhen_a     SA121X; label values   cerreason1_a     SA060X;
label values  paptest_a        SA127X; label values   hpvtest_a        SA127X;
label values  tellcervic_a     SA127X; label values   cervicres_a      SA127X;
label values  cervicnot1_a     SA101X; label values   hystev1_a        SA127X;
label values  mamev_a          SA127X; label values   mamwhen_a        SA121X;
label values  mampay_a         SA107X; label values   mamreason_a      SA078X;
label values  mamage1st1_a     SA130X; label values   mamnot1_a        SA092X; 
 
* IMS  VALUE LABEL ASSOCIATIONS;
label values  pregfluyr_a      SA127X; label values   livebirth_a      SA127X;
label values  shtflu12m_a      SA127X; label values   shtflum_a        SA096X;
label values  flupreg_a        SA128X; label values   flupreg2_a       SA129X;
label values  shtcvd19_a       SA127X; label values   shtcvd19nm_a     SA063X;
label values  cvdvac1mr_a      SA096X; label values   cvdvac2mr_a      SA096X;
label values  shtcvd19av_a     SA127X; label values   shtpnuev_a       SA127X;
label values  shtpneunb_a      SA109X; label values   shtshingle_a     SA127X;
label values  zostavax1_a      SA127X; label values   zostawhen_a      SA127X;
label values  shingrix1_a      SA127X; label values   shingrixnb_a     SA116X;
label values  shingwhen_a      SA127X; label values   tdappreg_a       SA127X;
label values  shthepb_a        SA127X; label values   shthepa_a        SA127X;
label values  livehep_a        SA127X; label values   workhealth_a     SA127X;
label values  wrkhlthfc_a      SA127X; label values   travel_a         SA127X; 
 
* CGR  VALUE LABEL ASSOCIATIONS;
label values  homehc12m_a      SA127X; label values   homecaredg_a     SA127X;
label values  famcare12m_a     SA127X; label values   famcaredng_a     SA127X;
label values  famcarecvd_a     SA127X; 
 
* ANX  VALUE LABEL ASSOCIATIONS;
label values  anxfreq_a        SA084X; label values   anxmed_a         SA127X;
label values  anxlevel_a       SA090X; 
 
* DEP  VALUE LABEL ASSOCIATIONS;
label values  depfreq_a        SA084X; label values   depmed_a         SA127X;
label values  deplevel_a       SA090X; 
 
* MHC  VALUE LABEL ASSOCIATIONS;
label values  mhrx_a           SA127X; label values   mhthrpy_a        SA127X;
label values  mhtpynow_a       SA127X; label values   mhthdly_a        SA127X;
label values  mhthnd_a         SA127X; 
 
* SPD  VALUE LABEL ASSOCIATIONS;
label values  sad_a            SA052X; label values   nervous_a        SA052X;
label values  restless_a       SA052X; label values   hopeless_a       SA052X;
label values  effort_a         SA052X; label values   worthless_a      SA052X;
label values  k6spd_a          SA020X; 
 
* PAI  VALUE LABEL ASSOCIATIONS;
label values  paifrq3m_a       SA083X; label values   paiamnt_a        SA090X;
label values  paiwklm3m_a      SA083X; label values   paiaffm3m_a      SA083X;
label values  paiback3m_a      SA098X; label values   paiulmb3m_a      SA098X;
label values  paillmb3m_a      SA098X; label values   paihdfc3m_a      SA098X;
label values  paiapg3m_a       SA098X; label values   paitooth3m_a     SA098X; 
 
* REP  VALUE LABEL ASSOCIATIONS;
label values  repstrain_a      SA127X; label values   replimit_a       SA127X;
label values  repsawdoc_a      SA127X; label values   repfutwrk_a      SA127X;
label values  repstopchg_a     SA127X; label values   repreduce_a      SA127X;
label values  repwrkcaus_a     SA127X; 
 
* INJ  VALUE LABEL ASSOCIATIONS;
label values  anyinjury_a      SA127X; label values   injlimit_a       SA127X;
label values  injhome_a        SA127X; label values   injwork_a        SA127X;
label values  injsports_a      SA127X; label values   injfall_a        SA127X;
label values  injfallhom_a     SA127X; label values   injfallwrk_a     SA127X;
label values  injmotor_a       SA127X; label values   injmvtype1_a     SA095X;
label values  injmvtype2_a     SA095X; label values   injmvtype3_a     SA095X;
label values  injmvtype4_a     SA095X; label values   injmvtype5_a     SA095X;
label values  injchores_a      SA127X; label values   injsawdoc_a      SA127X;
label values  injer_a          SA127X; label values   injhosp_a        SA127X;
label values  injbones_a       SA127X; label values   injstitch_a      SA127X;
label values  injfutwrk_a      SA127X; label values   injstopchg_a     SA127X;
label values  injreduce_a      SA127X; 
 
* TSM  VALUE LABEL ASSOCIATIONS;
label values  smelldf_a        SA071X; label values   smellcomp_a      SA054X;
label values  smellpht_a       SA127X; label values   tastedf_a        SA072X;
label values  tastecomp_a      SA054X; label values   tasteflav_a      SA054X;
label values  tasteunw_a       SA127X; label values   tstsmhp_a        SA127X;
label values  tstsmlast_a      SA121X; 
 
* CIG  VALUE LABEL ASSOCIATIONS;
label values  smkev_a          SA127X; label values   smknow_a         SA079X;
label values  smkcigst_a       SA043X; label values   cignow_a         SA067X;
label values  smk30d_a         SA064X; label values   cig30d_a         SA067X;
label values  ecigev_a         SA127X; label values   ecignow_a        SA079X;
label values  smkecigst_a      SA007X; 
 
* OTB  VALUE LABEL ASSOCIATIONS;
label values  cigarev_a        SA127X; label values   cigarcur_a       SA079X;
label values  cigar30d_a       SA064X; label values   pipeev_a         SA127X;
label values  pipecur_a        SA079X; label values   smokelsev_a      SA127X;
label values  smokelscur_a     SA079X; 
 
* SOS  VALUE LABEL ASSOCIATIONS;
label values  support_a        SA120X; label values   cmpsupport_a     SA055X; 
 
* ORN  VALUE LABEL ASSOCIATIONS;
label values  orient_a         SA099X; 
 
* MAR  VALUE LABEL ASSOCIATIONS;
label values  marital_a        SA093X; label values   spousliv_a       SA127X;
label values  spousep_a        SA127X; label values   evrmarried_a     SA127X;
label values  marstat_a        SA023X; label values   legmstat_a       SA021X;
label values  spousesex_a      SA115X; label values   saspprace_a      SA048X;
label values  saspphisp_a      SA048X; label values   spouseducp_a     SA008X;
label values  spouswrk_a       SA127X; label values   spouswkft_a      SA127X;
label values  prtnrsex_a       SA115X; label values   prtnreducp_a     SA008X;
label values  prtnrwrk_a       SA127X; label values   prtnrwkft_a      SA127X;
label values  saparentsc_a     SA042X; label values   parstat_a        SA031X; 
 
* VET  VALUE LABEL ASSOCIATIONS;
label values  afvet_a          SA127X; label values   afvettrn_a       SA127X;
label values  combat_a         SA127X; label values   vadisb_a         SA127X;
label values  vahosp_a         SA127X; label values   vacareev_a       SA127X; 
 
* NAT  VALUE LABEL ASSOCIATIONS;
label values  natusborn_a      SA127X; label values   yrsinus_a        SA050X;
label values  citznstp_a       SA003X; 
 
* SCH  VALUE LABEL ASSOCIATIONS;
label values  schcurenr_a      SA127X; 
 
* EMP  VALUE LABEL ASSOCIATIONS;
label values  empwrklsw1_a     SA127X; label values   empwhynot_a      SA076X;
label values  emplstwor1_a     SA075X; label values   empwrkft1_a      SA127X;
label values  empsicklv_a      SA127X; label values   emphealins_a     SA127X; 
 
* EMD  VALUE LABEL ASSOCIATIONS;
label values  emdsuper_a       SA127X; label values   emdwrkcat1_a     SA074X; 
 
* JOB  VALUE LABEL ASSOCIATIONS;
label values  jobtax_a         SA127X; label values   jobchgearn_a     SA086X;
label values  jobshift_a       SA089X; label values   jobchgsch_a      SA087X;
label values  jobvarysch_a     SA127X; label values   jobadvsch_a      SA085X;
label values  joblkyloss_a     SA088X; label values   jobwrksick_a     SA065X;
label values  jobmiss_a        SA065X; 
 
* SDW  VALUE LABEL ASSOCIATIONS;
label values  curjobsd1_a      SA127X; label values   wrkclssd1_a      SA117X;
label values  wrkclsnsd1_a     SA126X; label values   wrkclsoft1_a     SA117X;
label values  sdmsrs1_a        SA127X; label values   sdmsrsoft1_a     SA114X;
label values  recjobsd1_a      SA127X; label values   jobanysd1_a      SA127X;
label values  rjclssd1_a       SA117X; label values   clswrksd1_a      SA114X;
label values  rjclsnosd1_a     SA110X; label values   rjclsoft1_a      SA117X;
label values  clswrknos1_a     SA044X; 
 
* FEM  VALUE LABEL ASSOCIATIONS;
label values  pcntadtwkp_a     SA032X; label values   pcntadtwfp_a     SA032X; 
 
* INC  VALUE LABEL ASSOCIATIONS;
label values  incwrko_a        SA127X; label values   incinter_a       SA127X;
label values  incssrr_a        SA127X; label values   incssissdi_a     SA127X;
label values  ssissdibth_a     SA118X; label values   ssissdidsb_a     SA127X;
label values  incwelf_a        SA127X; label values   incretire_a      SA127X;
label values  incothr_a        SA127X; label values   ratcat_a         SA039X; 
 
* FOO  VALUE LABEL ASSOCIATIONS;
label values  fsnap12m_a       SA127X; label values   fsnap30d_a       SA127X;
label values  fwic12m_a        SA127X; label values   flunch12m_a      SA127X; 
 
* FDS  VALUE LABEL ASSOCIATIONS;
label values  fdsrunout_a      SA124X; label values   fdslast_a        SA124X;
label values  fdsbalance_a     SA124X; label values   fdsskip_a        SA127X;
label values  fdsskipdys_a     SA066X; label values   fdsless_a        SA127X;
label values  fdshungry_a      SA127X; label values   fdsweight_a      SA127X;
label values  fdsnoteat_a      SA127X; label values   fdsnedays_a      SA066X;
label values  fdscat3_a        SA012X; label values   fdscat4_a        SA013X; 
 
* HOU  VALUE LABEL ASSOCIATIONS;
label values  houyrsliv_a      SA123X; label values   houtenure_a      SA082X;
label values  hougvasst_a      SA127X; 
 
describe;
#delimit cr
 
* data file is stored in adult.dta
* log  file is stored in adult.log
 
log close
