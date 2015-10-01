" Vim syntax file
" Language:     ARM Assembler
" Maintainer:   Gerald S. Williams <gsw@agere.com>
" Last Change:  2005 Mar 16
" URL:          http://www.vim.org
" Revision:     1.2
"
" based on PIC16F84 Assembler syntax file (pic.vim) by Aleksandar Veselinovic

" This includes V2, V3, V4, V5, T, E, M, XS, and VFP extensions

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match
syn keyword armasmTodo		NOTE TODO XXX contained


syn case ignore

syn match armasmIdentifier	"[a-z_$][a-z0-9_$]*"
syn match armasmLabel		"^[A-Z_$][A-Z0-9_$]*"
syn region armasmLabel		start="||" end="||" oneline
syn region armasmLabel		start="|" end="|" oneline

syn region armasmASCII		start="'" end="'" skip="\\'" oneline
syn match armasmDecimal		"\d\+"
syn match armasmHexadecimal	"0[xX]\x\+"
syn match armasmHexadecimal	"&\x\+"
syn match armasmBinary		"2_[0-1]\+"
syn match armasmBase3		"3_[0-2]\+"
syn match armasmBase4		"4_[0-3]\+"
syn match armasmBase5		"5_[0-4]\+"
syn match armasmBase6		"6_[0-5]\+"
syn match armasmBase7		"7_[0-6]\+"
syn match armasmOctal		"8_[0-7]\o*"
syn match armasmBase9		"9_[0-8]\+"
syn match armasmFloat		"-\=[0-9]\+[eE]-\=[0-9]\+"
syn match armasmFloat		"-\=[0-9]*\.[0-9]\+\([eE]-\=[0-9]\+\)\="
syn match armasmBoolean		"{TRUE}"
syn match armasmBoolean		"{FALSE}"

syn match armasmBuiltIn		"{PC}"
syn match armasmBuiltIn		"{VAR}"
syn match armasmBuiltIn		"{TRUE}"
syn match armasmBuiltIn		"{FALSE}"
syn match armasmBuiltIn		"{OPT}"
syn match armasmBuiltIn		"{CONFIG}"
syn match armasmBuiltIn		"{ENDIAN}"
syn match armasmBuiltIn		"{CODESIZE}"
syn match armasmBuiltIn		"{CPU}"
syn match armasmBuiltIn		"{FPU}"
syn match armasmBuiltIn		"{ARCHITECTURE}"
syn match armasmBuiltIn		"{PCSTOREOFFSET}"
syn match armasmBuiltIn		"{ARMASM_VERSION}"
syn match armasmBuiltIn		"{INTER}"
syn match armasmBuiltIn		"{ROPI}"
syn match armasmBuiltIn		"{RWPI}"
syn match armasmBuiltIn		"{SWST}"
syn match armasmBuiltIn		"{NOSWST}"

" TODO: consider handling for string expansions ($x)

syn match armasmComment		";.*" contains=armasmTodo

syn region armasmString		start=+"+ end=+"+ oneline

syn match armasmOperator	":BASE:"
syn match armasmOperator	":INDEX:"
syn match armasmOperator	":LEN:"
syn match armasmOperator	":CHR:"
syn match armasmOperator	":STR:"
syn match armasmOperator	":NOT:"
syn match armasmOperator	":LNOT:"
syn match armasmOperator	":DEF:"
syn match armasmOperator	":SB_OFFSET_19_12:"
syn match armasmOperator	":SB_OFFSET_11_0:"
syn match armasmOperator	":MOD:"
syn match armasmOperator	":LEFT:"
syn match armasmOperator	":RIGHT:"
syn match armasmOperator	":CC:"
syn match armasmOperator	":ROL:"
syn match armasmOperator	":ROR:"
syn match armasmOperator	":SHL:"
syn match armasmOperator	":SHR:"
syn match armasmOperator	":AND:"
syn match armasmOperator	":OR:"
syn match armasmOperator	":EOR:"
syn match armasmOperator	":LAND:"
syn match armasmOperator	":LOR:"
syn match armasmOperator	":LEOR:"


syn keyword armasmRegister	r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13
syn keyword armasmRegister	r14 r15
syn keyword armasmRegister	pc lr sp ip sl sb
syn keyword armasmRegister	a1 a2 a3 a4 v1 v2 v3 v4 v5 v6 v7 v8
syn keyword armasmRegister	cpsr cpsr_c cpsr_x cpsr_s cpsr_f cpsr_cx
syn keyword armasmRegister	cpsr_cxs cpsr_xs cpsr_xsf cpsr_sf cpsr_cxsf
syn keyword armasmRegister	spsr spsr_c spsr_x spsr_s spsr_f spsr_cx
syn keyword armasmRegister	spsr_cxs spsr_xs spsr_xsf spsr_sf spsr_cxsf
syn keyword armasmRegister	p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13
syn keyword armasmRegister	p14 p15
syn keyword armasmRegister	c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13
syn keyword armasmRegister	c14 c15
syn keyword armasmRegister	f0 f1 f2 f3 f4 f5 f6 f7
syn keyword armasmRegister	s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13
syn keyword armasmRegister	s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25
syn keyword armasmRegister	s26 s27 s28 s29 s30 s31
syn keyword armasmRegister	d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13
syn keyword armasmRegister	d14 d15


syn keyword armasmOpcode	mov moveq movne movcs movhs movcc movlo
syn keyword armasmOpcode	movmi movpl movvs movvc movhi movls
syn keyword armasmOpcode	movge movlt movgt movle moval
syn keyword armasmOpcode	movs moveqs movnes movcss movhss movccs movlos
syn keyword armasmOpcode	movmis movpls movvss movvcs movhis movlss
syn keyword armasmOpcode	movges movlts movgts movles movals

syn keyword armasmOpcode	mvn mvneq mvnne mvncs mvnhs mvncc mvnlo
syn keyword armasmOpcode	mvnmi mvnpl mvnvs mvnvc mvnhi mvnls
syn keyword armasmOpcode	mvnge mvnlt mvngt mvnle mvnal
syn keyword armasmOpcode	mvns mvneqs mvnnes mvncss mvnhss mvnccs mvnlos
syn keyword armasmOpcode	mvnmis mvnpls mvnvss mvnvcs mvnhis mvnlss
syn keyword armasmOpcode	mvnges mvnlts mvngts mvnles mvnals

syn keyword armasmOpcode	mrs mrseq mrsne mrscs mrshs mrscc mrslo
syn keyword armasmOpcode	mrsmi mrspl mrsvs mrsvc mrshi mrsls
syn keyword armasmOpcode	mrsge mrslt mrsgt mrsle mrsal

syn keyword armasmOpcode	msr msreq msrne msrcs msrhs msrcc msrlo
syn keyword armasmOpcode	msrmi msrpl msrvs msrvc msrhi msrls
syn keyword armasmOpcode	msrge msrlt msrgt msrle msral

syn keyword armasmOpcode	mra mraeq mrane mracs mrahs mracc mralo
syn keyword armasmOpcode	mrami mrapl mravs mravc mrahi mrals
syn keyword armasmOpcode	mrage mralt mragt mrale mraal

syn keyword armasmOpcode	mar mareq marne marcs marhs marcc marlo
syn keyword armasmOpcode	marmi marpl marvs marvc marhi marls
syn keyword armasmOpcode	marge marlt margt marle maral

syn keyword armasmOpcode	add addeq addne addcs addhs addcc addlo
syn keyword armasmOpcode	addmi addpl addvs addvc addhi addls
syn keyword armasmOpcode	addge addlt addgt addle addal
syn keyword armasmOpcode	adds addeqs addnes addcss addhss addccs addlos
syn keyword armasmOpcode	addmis addpls addvss addvcs addhis addlss
syn keyword armasmOpcode	addges addlts addgts addles addals

syn keyword armasmOpcode	adc adceq adcne adccs adchs adccc adclo
syn keyword armasmOpcode	adcmi adcpl adcvs adcvc adchi adcls
syn keyword armasmOpcode	adcge adclt adcgt adcle adcal
syn keyword armasmOpcode	adcs adceqs adcnes adccss adchss adcccs adclos
syn keyword armasmOpcode	adcmis adcpls adcvss adcvcs adchis adclss
syn keyword armasmOpcode	adcges adclts adcgts adcles adcals

syn keyword armasmOpcode	qadd qaddeq qaddne qaddcs qaddhs qaddcc qaddlo
syn keyword armasmOpcode	qaddmi qaddpl qaddvs qaddvc qaddhi qaddls
syn keyword armasmOpcode	qaddge qaddlt qaddgt qaddle qaddal

syn keyword armasmOpcode	qdadd qdaddeq qdaddne qdaddcs qdaddhs qdaddcc
syn keyword armasmOpcode	qdaddlo qdaddmi qdaddpl qdaddvs qdaddvc qdaddhi
syn keyword armasmOpcode	qdaddls qdaddge qdaddlt qdaddgt qdaddle qdaddal

syn keyword armasmOpcode	sub subeq subne subcs subhs subcc sublo
syn keyword armasmOpcode	submi subpl subvs subvc subhi subls
syn keyword armasmOpcode	subge sublt subgt suble subal
syn keyword armasmOpcode	subs subeqs subnes subcss subhss subccs sublos
syn keyword armasmOpcode	submis subpls subvss subvcs subhis sublss
syn keyword armasmOpcode	subges sublts subgts subles subals

syn keyword armasmOpcode	sbc sbceq sbcne sbccs sbchs sbccc sbclo
syn keyword armasmOpcode	sbcmi sbcpl sbcvs sbcvc sbchi sbcls
syn keyword armasmOpcode	sbcge sbclt sbcgt sbcle sbcal
syn keyword armasmOpcode	sbcs sbceqs sbcnes sbccss sbchss sbcccs sbclos
syn keyword armasmOpcode	sbcmis sbcpls sbcvss sbcvcs sbchis sbclss
syn keyword armasmOpcode	sbcges sbclts sbcgts sbcles sbcals

syn keyword armasmOpcode	rsb rsbeq rsbne rsbcs rsbhs rsbcc rsblo
syn keyword armasmOpcode	rsbmi rsbpl rsbvs rsbvc rsbhi rsbls
syn keyword armasmOpcode	rsbge rsblt rsbgt rsble rsbal
syn keyword armasmOpcode	rsbs rsbeqs rsbnes rsbcss rsbhss rsbccs rsblos
syn keyword armasmOpcode	rsbmis rsbpls rsbvss rsbvcs rsbhis rsblss
syn keyword armasmOpcode	rsbges rsblts rsbgts rsbles rsbals

syn keyword armasmOpcode	rsc rsceq rscne rsccs rschs rsccc rsclo
syn keyword armasmOpcode	rscmi rscpl rscvs rscvc rschi rscls
syn keyword armasmOpcode	rscge rsclt rscgt rscle rscal
syn keyword armasmOpcode	rscs rsceqs rscnes rsccss rschss rscccs rsclos
syn keyword armasmOpcode	rscmis rscpls rscvss rscvcs rschis rsclss
syn keyword armasmOpcode	rscges rsclts rscgts rscles rscals

syn keyword armasmOpcode	qsub qsubeq qsubne qsubcs qsubhs qsubcc qsublo
syn keyword armasmOpcode	qsubmi qsubpl qsubvs qsubvc qsubhi qsubls
syn keyword armasmOpcode	qsubge qsublt qsubgt qsuble qsubal

syn keyword armasmOpcode	qdsub qdsubeq qdsubne qdsubcs qdsubhs qdsubcc
syn keyword armasmOpcode	qdsublo qdsubmi qdsubpl qdsubvs qdsubvc qdsubhi
syn keyword armasmOpcode	qdsubls qdsubge qdsublt qdsubgt qdsuble qdsubal

syn keyword armasmOpcode	mul muleq mulne mulcs mulhs mulcc mullo
syn keyword armasmOpcode	mulmi mulpl mulvs mulvc mulhi mulls
syn keyword armasmOpcode	mulge mullt mulgt mulle mulal
syn keyword armasmOpcode	muls muleqs mulnes mulcss mulhss mulccs mullos
syn keyword armasmOpcode	mulmis mulpls mulvss mulvcs mulhis mullss
syn keyword armasmOpcode	mulges mullts mulgts mulles mulals

syn keyword armasmOpcode	mla mlaeq mlane mlacs mlahs mlacc mlalo
syn keyword armasmOpcode	mlami mlapl mlavs mlavc mlahi mlals
syn keyword armasmOpcode	mlage mlalt mlagt mlale mlaal
syn keyword armasmOpcode	mlas mlaeqs mlanes mlacss mlahss mlaccs mlalos
syn keyword armasmOpcode	mlamis mlapls mlavss mlavcs mlahis mlalss
syn keyword armasmOpcode	mlages mlalts mlagts mlales mlaals

syn keyword armasmOpcode	umull umulleq umullne umullcs umullhs umullcc
syn keyword armasmOpcode	umulllo umullmi umullpl umullvs umullvc umullhi
syn keyword armasmOpcode	umullls umullge umulllt umullgt umullle umullal
syn keyword armasmOpcode	umulls umulleqs umullnes umullcss umullhss
syn keyword armasmOpcode	umullccs umulllos umullmis umullpls umullvss
syn keyword armasmOpcode	umullvcs umullhis umulllss umullges umulllts
syn keyword armasmOpcode	umullgts umullles umullals

syn keyword armasmOpcode	umlal umlaleq umlalne umlalcs umlalhs umlalcc
syn keyword armasmOpcode	umlallo umlalmi umlalpl umlalvs umlalvc umlalhi
syn keyword armasmOpcode	umlalls umlalge umlallt umlalgt umlalle umlalal
syn keyword armasmOpcode	umlals umlaleqs umlalnes umlalcss umlalhss
syn keyword armasmOpcode	umlalccs umlallos umlalmis umlalpls umlalvss
syn keyword armasmOpcode	umlalvcs umlalhis umlallss umlalges umlallts
syn keyword armasmOpcode	umlalgts umlalles umlalals

syn keyword armasmOpcode	smull smulleq smullne smullcs smullhs smullcc
syn keyword armasmOpcode	smulllo smullmi smullpl smullvs smullvc smullhi
syn keyword armasmOpcode	smullls smullge smulllt smullgt smullle smullal
syn keyword armasmOpcode	smulls smulleqs smullnes smullcss smullhss
syn keyword armasmOpcode	smullccs smulllos smullmis smullpls smullvss
syn keyword armasmOpcode	smullvcs smullhis smulllss smullges smulllts
syn keyword armasmOpcode	smullgts smullles smullals

syn keyword armasmOpcode	smlal smlaleq smlalne smlalcs smlalhs smlalcc
syn keyword armasmOpcode	smlallo smlalmi smlalpl smlalvs smlalvc smlalhi
syn keyword armasmOpcode	smlalls smlalge smlallt smlalgt smlalle smlalal
syn keyword armasmOpcode	smlals smlaleqs smlalnes smlalcss smlalhss
syn keyword armasmOpcode	smlalccs smlallos smlalmis smlalpls smlalvss
syn keyword armasmOpcode	smlalvcs smlalhis smlallss smlalges smlallts
syn keyword armasmOpcode	smlalgts smlalles smlalals

syn keyword armasmOpcode	smulxy smulxyeq smulxyne smulxycs smulxyhs
syn keyword armasmOpcode	smulxycc smulxylo smulxymi smulxypl smulxyvs
syn keyword armasmOpcode	smulxyvc smulxyhi smulxyls smulxyge smulxylt
syn keyword armasmOpcode	smulxygt smulxyle smulxyal

syn keyword armasmOpcode	smulwy smulwyeq smulwyne smulwycs smulwyhs
syn keyword armasmOpcode	smulwycc smulwylo smulwymi smulwypl smulwyvs
syn keyword armasmOpcode	smulwyvc smulwyhi smulwyls smulwyge smulwylt
syn keyword armasmOpcode	smulwygt smulwyle smulwyal

syn keyword armasmOpcode	smlaxy smlaxyeq smlaxyne smlaxycs smlaxyhs
syn keyword armasmOpcode	smlaxycc smlaxylo smlaxymi smlaxypl smlaxyvs
syn keyword armasmOpcode	smlaxyvc smlaxyhi smlaxyls smlaxyge smlaxylt
syn keyword armasmOpcode	smlaxygt smlaxyle smlaxyal

syn keyword armasmOpcode	smlawy smlawyeq smlawyne smlawycs smlawyhs
syn keyword armasmOpcode	smlawycc smlawylo smlawymi smlawypl smlawyvs
syn keyword armasmOpcode	smlawyvc smlawyhi smlawyls smlawyge smlawylt
syn keyword armasmOpcode	smlawygt smlawyle smlawyal

syn keyword armasmOpcode	smlalxy smlalxyeq smlalxyne smlalxycs smlalxyhs
syn keyword armasmOpcode	smlalxycc smlalxylo smlalxymi smlalxypl
syn keyword armasmOpcode	smlalxyvs smlalxyvc smlalxyhi smlalxyls
syn keyword armasmOpcode	smlalxyge smlalxylt smlalxygt smlalxyle
syn keyword armasmOpcode	smlalxyal

syn keyword armasmOpcode	mia miaeq miane miacs miahs miacc mialo
syn keyword armasmOpcode	miami miapl miavs miavc miahi mials
syn keyword armasmOpcode	miage mialt miagt miale miaal

syn keyword armasmOpcode	miaph miapheq miaphne miaphcs miaphhs miaphcc
syn keyword armasmOpcode	miaphlo miaphmi miaphpl miaphvs miaphvc miaphhi
syn keyword armasmOpcode	miaphls miaphge miaphlt miaphgt miaphle miaphal

syn keyword armasmOpcode	miaxy miaxyeq miaxyne miaxycs miaxyhs miaxycc
syn keyword armasmOpcode	miaxylo miaxymi miaxypl miaxyvs miaxyvc miaxyhi
syn keyword armasmOpcode	miaxyls miaxyge miaxylt miaxygt miaxyle miaxyal

syn keyword armasmOpcode	clz clzeq clzne clzcs clzhs clzcc clzlo
syn keyword armasmOpcode	clzmi clzpl clzvs clzvc clzhi clzls
syn keyword armasmOpcode	clzge clzlt clzgt clzle clzal

syn keyword armasmOpcode	tst tsteq tstne tstcs tsths tstcc tstlo
syn keyword armasmOpcode	tstmi tstpl tstvs tstvc tsthi tstls
syn keyword armasmOpcode	tstge tstlt tstgt tstle tstal

syn keyword armasmOpcode	teq teqeq teqne teqcs teqhs teqcc teqlo
syn keyword armasmOpcode	teqmi teqpl teqvs teqvc teqhi teqls
syn keyword armasmOpcode	teqge teqlt teqgt teqle teqal

syn keyword armasmOpcode	and andeq andne andcs andhs andcc andlo
syn keyword armasmOpcode	andmi andpl andvs andvc andhi andls
syn keyword armasmOpcode	andge andlt andgt andle andal
syn keyword armasmOpcode	ands andeqs andnes andcss andhss andccs andlos
syn keyword armasmOpcode	andmis andpls andvss andvcs andhis andlss
syn keyword armasmOpcode	andges andlts andgts andles andals

syn keyword armasmOpcode	eor eoreq eorne eorcs eorhs eorcc eorlo
syn keyword armasmOpcode	eormi eorpl eorvs eorvc eorhi eorls
syn keyword armasmOpcode	eorge eorlt eorgt eorle eoral
syn keyword armasmOpcode	eors eoreqs eornes eorcss eorhss eorccs eorlos
syn keyword armasmOpcode	eormis eorpls eorvss eorvcs eorhis eorlss
syn keyword armasmOpcode	eorges eorlts eorgts eorles eorals

syn keyword armasmOpcode	orr orreq orrne orrcs orrhs orrcc orrlo
syn keyword armasmOpcode	orrmi orrpl orrvs orrvc orrhi orrls
syn keyword armasmOpcode	orrge orrlt orrgt orrle orral
syn keyword armasmOpcode	orrs orreqs orrnes orrcss orrhss orrccs orrlos
syn keyword armasmOpcode	orrmis orrpls orrvss orrvcs orrhis orrlss
syn keyword armasmOpcode	orrges orrlts orrgts orrles orrals

syn keyword armasmOpcode	bic biceq bicne biccs bichs biccc biclo
syn keyword armasmOpcode	bicmi bicpl bicvs bicvc bichi bicls
syn keyword armasmOpcode	bicge biclt bicgt bicle bical
syn keyword armasmOpcode	bics biceqs bicnes biccss bichss bicccs biclos
syn keyword armasmOpcode	bicmis bicpls bicvss bicvcs bichis biclss
syn keyword armasmOpcode	bicges biclts bicgts bicles bicals

syn keyword armasmOpcode	cmp cmpeq cmpne cmpcs cmphs cmpcc cmplo
syn keyword armasmOpcode	cmpmi cmppl cmpvs cmpvc cmphi cmpls
syn keyword armasmOpcode	cmpge cmplt cmpgt cmple cmpal

syn keyword armasmOpcode	cmn cmneq cmnne cmncs cmnhs cmncc cmnlo
syn keyword armasmOpcode	cmnmi cmnpl cmnvs cmnvc cmnhi cmnls
syn keyword armasmOpcode	cmnge cmnlt cmngt cmnle cmnal

syn keyword armasmOpcode	nop

syn keyword armasmOpcode	b beq bne bcs bhs bcc blo
syn keyword armasmOpcode	bmi bpl bvs bvc bhi bls
syn keyword armasmOpcode	bge blt bgt ble bal

syn keyword armasmOpcode	bl bleq blne blcs blhs blcc bllo
syn keyword armasmOpcode	blmi blpl blvs blvc blhi blls
syn keyword armasmOpcode	blge bllt blgt blle blal

syn keyword armasmOpcode	bx bxeq bxne bxcs bxhs bxcc bxlo
syn keyword armasmOpcode	bxmi bxpl bxvs bxvc bxhi bxls
syn keyword armasmOpcode	bxge bxlt bxgt bxle bxal

syn keyword armasmOpcode	blx blxeq blxne blxcs blxhs blxcc blxlo
syn keyword armasmOpcode	blxmi blxpl blxvs blxvc blxhi blxls
syn keyword armasmOpcode	blxge blxlt blxgt blxle blxal

syn keyword armasmOpcode	ldr ldreq ldrne ldrcs ldrhs ldrcc ldrlo
syn keyword armasmOpcode	ldrmi ldrpl ldrvs ldrvc ldrhi ldrls
syn keyword armasmOpcode	ldrge ldrlt ldrgt ldrle ldral
syn keyword armasmOpcode	ldrt ldreqt ldrnet ldrcst ldrhst ldrcct ldrlot
syn keyword armasmOpcode	ldrmit ldrplt ldrvst ldrvct ldrhit ldrlst
syn keyword armasmOpcode	ldrget ldrltt ldrgtt ldrlet ldralt
syn keyword armasmOpcode	ldrb ldreqb ldrneb ldrcsb ldrhsb ldrccb ldrlob
syn keyword armasmOpcode	ldrmib ldrplb ldrvsb ldrvcb ldrhib ldrlsb
syn keyword armasmOpcode	ldrgeb ldrltb ldrgtb ldrleb ldralb
syn keyword armasmOpcode	ldrbt ldreqbt ldrnebt ldrcsbt ldrhsbt ldrccbt
syn keyword armasmOpcode	ldrlobt ldrmibt ldrplbt ldrvsbt ldrvcbt ldrhibt
syn keyword armasmOpcode	ldrlsbt ldrgebt ldrltbt ldrgtbt ldrlebt ldralbt
syn keyword armasmOpcode	ldrsb ldreqsb ldrnesb ldrcssb ldrhssb ldrccsb
syn keyword armasmOpcode	ldrlosb ldrmisb ldrplsb ldrvssb ldrvcsb ldrhisb
syn keyword armasmOpcode	ldrlssb ldrgesb ldrltsb ldrgtsb ldrlesb ldralsb
syn keyword armasmOpcode	ldrh ldreqh ldrneh ldrcsh ldrhsh ldrcch ldrloh
syn keyword armasmOpcode	ldrmih ldrplh ldrvsh ldrvch ldrhih ldrlsh
syn keyword armasmOpcode	ldrgeh ldrlth ldrgth ldrleh ldralh
syn keyword armasmOpcode	ldrsh ldreqsh ldrnesh ldrcssh ldrhssh ldrccsh
syn keyword armasmOpcode	ldrlosh ldrmish ldrplsh ldrvssh ldrvcsh ldrhish
syn keyword armasmOpcode	ldrlssh ldrgesh ldrltsh ldrgtsh ldrlesh ldralsh
syn keyword armasmOpcode	ldrd ldreqd ldrned ldrcsd ldrhsd ldrccd ldrlod
syn keyword armasmOpcode	ldrmid ldrpld ldrvsd ldrvcd ldrhid ldrlsd
syn keyword armasmOpcode	ldrged ldrltd ldrgtd ldrled ldrald

syn keyword armasmOpcode	ldmia ldmeqia ldmneia ldmcsia ldmhsia ldmccia
syn keyword armasmOpcode	ldmloia ldmmiia ldmplia ldmvsia ldmvcia ldmhiia
syn keyword armasmOpcode	ldmlsia ldmgeia ldmltia ldmgtia ldmleia ldmalia
syn keyword armasmOpcode	ldmib ldmeqib ldmneib ldmcsib ldmhsib ldmccib
syn keyword armasmOpcode	ldmloib ldmmiib ldmplib ldmvsib ldmvcib ldmhiib
syn keyword armasmOpcode	ldmlsib ldmgeib ldmltib ldmgtib ldmleib ldmalib
syn keyword armasmOpcode	ldmda ldmeqda ldmneda ldmcsda ldmhsda ldmccda
syn keyword armasmOpcode	ldmloda ldmmida ldmplda ldmvsda ldmvcda ldmhida
syn keyword armasmOpcode	ldmlsda ldmgeda ldmltda ldmgtda ldmleda ldmalda
syn keyword armasmOpcode	ldmdb ldmeqdb ldmnedb ldmcsdb ldmhsdb ldmccdb
syn keyword armasmOpcode	ldmlodb ldmmidb ldmpldb ldmvsdb ldmvcdb ldmhidb
syn keyword armasmOpcode	ldmlsdb ldmgedb ldmltdb ldmgtdb ldmledb ldmaldb
syn keyword armasmOpcode	ldmfd ldmeqfd ldmnefd ldmcsfd ldmhsfd ldmccfd
syn keyword armasmOpcode	ldmlofd ldmmifd ldmplfd ldmvsfd ldmvcfd ldmhifd
syn keyword armasmOpcode	ldmlsfd ldmgefd ldmltfd ldmgtfd ldmlefd ldmalfd
syn keyword armasmOpcode	ldmed ldmeqed ldmneed ldmcsed ldmhsed ldmcced
syn keyword armasmOpcode	ldmloed ldmmied ldmpled ldmvsed ldmvced ldmhied
syn keyword armasmOpcode	ldmlsed ldmgeed ldmlted ldmgted ldmleed ldmaled
syn keyword armasmOpcode	ldmfa ldmeqfa ldmnefa ldmcsfa ldmhsfa ldmccfa
syn keyword armasmOpcode	ldmlofa ldmmifa ldmplfa ldmvsfa ldmvcfa ldmhifa
syn keyword armasmOpcode	ldmlsfa ldmgefa ldmltfa ldmgtfa ldmlefa ldmalfa
syn keyword armasmOpcode	ldmea ldmeqea ldmneea ldmcsea ldmhsea ldmccea
syn keyword armasmOpcode	ldmloea ldmmiea ldmplea ldmvsea ldmvcea ldmhiea
syn keyword armasmOpcode	ldmlsea ldmgeea ldmltea ldmgtea ldmleea ldmalea

syn keyword armasmOpcode	pld

syn keyword armasmOpcode	str streq strne strcs strhs strcc strlo
syn keyword armasmOpcode	strmi strpl strvs strvc strhi strls
syn keyword armasmOpcode	strge strlt strgt strle stral
syn keyword armasmOpcode	strt streqt strnet strcst strhst strcct strlot
syn keyword armasmOpcode	strmit strplt strvst strvct strhit strlst
syn keyword armasmOpcode	strget strltt strgtt strlet stralt
syn keyword armasmOpcode	strb streqb strneb strcsb strhsb strccb strlob
syn keyword armasmOpcode	strmib strplb strvsb strvcb strhib strlsb
syn keyword armasmOpcode	strgeb strltb strgtb strleb stralb
syn keyword armasmOpcode	strbt streqbt strnebt strcsbt strhsbt strccbt
syn keyword armasmOpcode	strlobt strmibt strplbt strvsbt strvcbt strhibt
syn keyword armasmOpcode	strlsbt strgebt strltbt strgtbt strlebt stralbt
syn keyword armasmOpcode	strh streqh strneh strcsh strhsh strcch strloh
syn keyword armasmOpcode	strmih strplh strvsh strvch strhih strlsh
syn keyword armasmOpcode	strgeh strlth strgth strleh stralh
syn keyword armasmOpcode	strd streqd strned strcsd strhsd strccd strlod
syn keyword armasmOpcode	strmid strpld strvsd strvcd strhid strlsd
syn keyword armasmOpcode	strged strltd strgtd strled strald

syn keyword armasmOpcode	stmia stmeqia stmneia stmcsia stmhsia stmccia
syn keyword armasmOpcode	stmloia stmmiia stmplia stmvsia stmvcia stmhiia
syn keyword armasmOpcode	stmlsia stmgeia stmltia stmgtia stmleia stmalia
syn keyword armasmOpcode	stmib stmeqib stmneib stmcsib stmhsib stmccib
syn keyword armasmOpcode	stmloib stmmiib stmplib stmvsib stmvcib stmhiib
syn keyword armasmOpcode	stmlsib stmgeib stmltib stmgtib stmleib stmalib
syn keyword armasmOpcode	stmda stmeqda stmneda stmcsda stmhsda stmccda
syn keyword armasmOpcode	stmloda stmmida stmplda stmvsda stmvcda stmhida
syn keyword armasmOpcode	stmlsda stmgeda stmltda stmgtda stmleda stmalda
syn keyword armasmOpcode	stmdb stmeqdb stmnedb stmcsdb stmhsdb stmccdb
syn keyword armasmOpcode	stmlodb stmmidb stmpldb stmvsdb stmvcdb stmhidb
syn keyword armasmOpcode	stmlsdb stmgedb stmltdb stmgtdb stmledb stmaldb
syn keyword armasmOpcode	stmfd stmeqfd stmnefd stmcsfd stmhsfd stmccfd
syn keyword armasmOpcode	stmlofd stmmifd stmplfd stmvsfd stmvcfd stmhifd
syn keyword armasmOpcode	stmlsfd stmgefd stmltfd stmgtfd stmlefd stmalfd
syn keyword armasmOpcode	stmed stmeqed stmneed stmcsed stmhsed stmcced
syn keyword armasmOpcode	stmloed stmmied stmpled stmvsed stmvced stmhied
syn keyword armasmOpcode	stmlsed stmgeed stmlted stmgted stmleed stmaled
syn keyword armasmOpcode	stmfa stmeqfa stmnefa stmcsfa stmhsfa stmccfa
syn keyword armasmOpcode	stmlofa stmmifa stmplfa stmvsfa stmvcfa stmhifa
syn keyword armasmOpcode	stmlsfa stmgefa stmltfa stmgtfa stmlefa stmalfa
syn keyword armasmOpcode	stmea stmeqea stmneea stmcsea stmhsea stmccea
syn keyword armasmOpcode	stmloea stmmiea stmplea stmvsea stmvcea stmhiea
syn keyword armasmOpcode	stmlsea stmgeea stmltea stmgtea stmleea stmalea

syn keyword armasmOpcode	swp swpeq swpne swpcs swphs swpcc swplo
syn keyword armasmOpcode	swpmi swppl swpvs swpvc swphi swpls
syn keyword armasmOpcode	swpge swplt swpgt swple swpal

syn keyword armasmOpcode	swpb swpeqb swpneb swpcsb swphsb swpccb swplob 
syn keyword armasmOpcode	swpmib swpplb swpvsb swpvcb swphib swplsb 
syn keyword armasmOpcode	swpgeb swpltb swpgtb swpleb swpalb 

syn keyword armasmOpcode	cdp cdpeq cdpne cdpcs cdphs cdpcc cdplo
syn keyword armasmOpcode	cdpmi cdppl cdpvs cdpvc cdphi cdpls
syn keyword armasmOpcode	cdpge cdplt cdpgt cdple cdpal

syn keyword armasmOpcode	cdp2 cdp2eq cdp2ne cdp2cs cdp2hs cdp2cc cdp2lo
syn keyword armasmOpcode	cdp2mi cdp2pl cdp2vs cdp2vc cdp2hi cdp2ls
syn keyword armasmOpcode	cdp2ge cdp2lt cdp2gt cdp2le cdp2al

syn keyword armasmOpcode	mrc mrceq mrcne mrccs mrchs mrccc mrclo
syn keyword armasmOpcode	mrcmi mrcpl mrcvs mrcvc mrchi mrcls
syn keyword armasmOpcode	mrcge mrclt mrcgt mrcle mrcal

syn keyword armasmOpcode	mrc2 mrc2eq mrc2ne mrc2cs mrc2hs mrc2cc mrc2lo
syn keyword armasmOpcode	mrc2mi mrc2pl mrc2vs mrc2vc mrc2hi mrc2ls
syn keyword armasmOpcode	mrc2ge mrc2lt mrc2gt mrc2le mrc2al

syn keyword armasmOpcode	mrrc mrrceq mrrcne mrrccs mrrchs mrrccc mrrclo
syn keyword armasmOpcode	mrrcmi mrrcpl mrrcvs mrrcvc mrrchi mrrcls
syn keyword armasmOpcode	mrrcge mrrclt mrrcgt mrrcle mrrcal

syn keyword armasmOpcode	mcr mcreq mcrne mcrcs mcrhs mcrcc mcrlo
syn keyword armasmOpcode	mcrmi mcrpl mcrvs mcrvc mcrhi mcrls
syn keyword armasmOpcode	mcrge mcrlt mcrgt mcrle mcral

syn keyword armasmOpcode	mcr2 mcr2eq mcr2ne mcr2cs mcr2hs mcr2cc mcr2lo
syn keyword armasmOpcode	mcr2mi mcr2pl mcr2vs mcr2vc mcr2hi mcr2ls
syn keyword armasmOpcode	mcr2ge mcr2lt mcr2gt mcr2le mcr2al

syn keyword armasmOpcode	mcrr mcrreq mcrrne mcrrcs mcrrhs mcrrcc mcrrlo
syn keyword armasmOpcode	mcrrmi mcrrpl mcrrvs mcrrvc mcrrhi mcrrls
syn keyword armasmOpcode	mcrrge mcrrlt mcrrgt mcrrle mcrral

syn keyword armasmOpcode	ldc ldceq ldcne ldccs ldchs ldccc ldclo
syn keyword armasmOpcode	ldcmi ldcpl ldcvs ldcvc ldchi ldcls
syn keyword armasmOpcode	ldcge ldclt ldcgt ldcle ldcal

syn keyword armasmOpcode	ldc2 ldc2eq ldc2ne ldc2cs ldc2hs ldc2cc ldc2lo
syn keyword armasmOpcode	ldc2mi ldc2pl ldc2vs ldc2vc ldc2hi ldc2ls
syn keyword armasmOpcode	ldc2ge ldc2lt ldc2gt ldc2le ldc2al

syn keyword armasmOpcode	stc stceq stcne stccs stchs stccc stclo
syn keyword armasmOpcode	stcmi stcpl stcvs stcvc stchi stcls
syn keyword armasmOpcode	stcge stclt stcgt stcle stcal

syn keyword armasmOpcode	stc2 stc2eq stc2ne stc2cs stc2hs stc2cc stc2lo
syn keyword armasmOpcode	stc2mi stc2pl stc2vs stc2vc stc2hi stc2ls
syn keyword armasmOpcode	stc2ge stc2lt stc2gt stc2le stc2al

syn keyword armasmOpcode	swi swieq swine swics swihs swicc swilo
syn keyword armasmOpcode	swimi swipl swivs swivc swihi swils
syn keyword armasmOpcode	swige swilt swigt swile swial

syn keyword armasmOpcode	bkpt

syn keyword armasmOpcode	neg lsl lsr asr ror rrx push pop

syn keyword armasmOpcode	fmuls fmulseq fmulsne fmulscs fmulshs fmulscc
syn keyword armasmOpcode	fmulslo fmulsmi fmulspl fmulsvs fmulsvc fmulshi
syn keyword armasmOpcode	fmulsls fmulsge fmulslt fmulsgt fmulsle fmulsal
syn keyword armasmOpcode	fmuld fmuldeq fmuldne fmuldcs fmuldhs fmuldcc
syn keyword armasmOpcode	fmuldlo fmuldmi fmuldpl fmuldvs fmuldvc fmuldhi
syn keyword armasmOpcode	fmuldls fmuldge fmuldlt fmuldgt fmuldle fmuldal

syn keyword armasmOpcode	fnmuls fnmulseq fnmulsne fnmulscs fnmulshs
syn keyword armasmOpcode	fnmulscc fnmulslo fnmulsmi fnmulspl fnmulsvs
syn keyword armasmOpcode	fnmulsvc fnmulshi fnmulsls fnmulsge fnmulslt
syn keyword armasmOpcode	fnmulsgt fnmulsle fnmulsal fnmuld fnmuldeq
syn keyword armasmOpcode	fnmuldne fnmuldcs fnmuldhs fnmuldcc fnmuldlo
syn keyword armasmOpcode	fnmuldmi fnmuldpl fnmuldvs fnmuldvc fnmuldhi
syn keyword armasmOpcode	fnmuldls fnmuldge fnmuldlt fnmuldgt fnmuldle
syn keyword armasmOpcode	fnmuldal

syn keyword armasmOpcode	fmacs fmacseq fmacsne fmacscs fmacshs fmacscc
syn keyword armasmOpcode	fmacslo fmacsmi fmacspl fmacsvs fmacsvc fmacshi
syn keyword armasmOpcode	fmacsls fmacsge fmacslt fmacsgt fmacsle fmacsal
syn keyword armasmOpcode	fmacd fmacdeq fmacdne fmacdcs fmacdhs fmacdcc
syn keyword armasmOpcode	fmacdlo fmacdmi fmacdpl fmacdvs fmacdvc fmacdhi
syn keyword armasmOpcode	fmacdls fmacdge fmacdlt fmacdgt fmacdle fmacdal

syn keyword armasmOpcode	fnmacs fnmacseq fnmacsne fnmacscs fnmacshs
syn keyword armasmOpcode	fnmacscc fnmacslo fnmacsmi fnmacspl fnmacsvs
syn keyword armasmOpcode	fnmacsvc fnmacshi fnmacsls fnmacsge fnmacslt
syn keyword armasmOpcode	fnmacsgt fnmacsle fnmacsal fnmacd fnmacdeq
syn keyword armasmOpcode	fnmacdne fnmacdcs fnmacdhs fnmacdcc fnmacdlo
syn keyword armasmOpcode	fnmacdmi fnmacdpl fnmacdvs fnmacdvc fnmacdhi
syn keyword armasmOpcode	fnmacdls fnmacdge fnmacdlt fnmacdgt fnmacdle
syn keyword armasmOpcode	fnmacdal

syn keyword armasmOpcode	fmscs fmscseq fmscsne fmscscs fmscshs fmscscc
syn keyword armasmOpcode	fmscslo fmscsmi fmscspl fmscsvs fmscsvc fmscshi
syn keyword armasmOpcode	fmscsls fmscsge fmscslt fmscsgt fmscsle fmscsal
syn keyword armasmOpcode	fmscd fmscdeq fmscdne fmscdcs fmscdhs fmscdcc
syn keyword armasmOpcode	fmscdlo fmscdmi fmscdpl fmscdvs fmscdvc fmscdhi
syn keyword armasmOpcode	fmscdls fmscdge fmscdlt fmscdgt fmscdle fmscdal

syn keyword armasmOpcode	fnmscs fnmscseq fnmscsne fnmscscs fnmscshs
syn keyword armasmOpcode	fnmscscc fnmscslo fnmscsmi fnmscspl fnmscsvs
syn keyword armasmOpcode	fnmscsvc fnmscshi fnmscsls fnmscsge fnmscslt
syn keyword armasmOpcode	fnmscsgt fnmscsle fnmscsal fnmscd fnmscdeq
syn keyword armasmOpcode	fnmscdne fnmscdcs fnmscdhs fnmscdcc fnmscdlo
syn keyword armasmOpcode	fnmscdmi fnmscdpl fnmscdvs fnmscdvc fnmscdhi
syn keyword armasmOpcode	fnmscdls fnmscdge fnmscdlt fnmscdgt fnmscdle
syn keyword armasmOpcode	fnmscdal

syn keyword armasmOpcode	fadds faddseq faddsne faddscs faddshs faddscc
syn keyword armasmOpcode	faddslo faddsmi faddspl faddsvs faddsvc faddshi
syn keyword armasmOpcode	faddsls faddsge faddslt faddsgt faddsle faddsal
syn keyword armasmOpcode	faddd fadddeq fadddne fadddcs fadddhs fadddcc
syn keyword armasmOpcode	fadddlo fadddmi fadddpl fadddvs fadddvc fadddhi
syn keyword armasmOpcode	fadddls fadddge fadddlt fadddgt fadddle fadddal

syn keyword armasmOpcode	fsubs fsubseq fsubsne fsubscs fsubshs fsubscc
syn keyword armasmOpcode	fsubslo fsubsmi fsubspl fsubsvs fsubsvc fsubshi
syn keyword armasmOpcode	fsubsls fsubsge fsubslt fsubsgt fsubsle fsubsal
syn keyword armasmOpcode	fsubd fsubdeq fsubdne fsubdcs fsubdhs fsubdcc
syn keyword armasmOpcode	fsubdlo fsubdmi fsubdpl fsubdvs fsubdvc fsubdhi
syn keyword armasmOpcode	fsubdls fsubdge fsubdlt fsubdgt fsubdle fsubdal

syn keyword armasmOpcode	fdivs fdivseq fdivsne fdivscs fdivshs fdivscc
syn keyword armasmOpcode	fdivslo fdivsmi fdivspl fdivsvs fdivsvc fdivshi
syn keyword armasmOpcode	fdivsls fdivsge fdivslt fdivsgt fdivsle fdivsal
syn keyword armasmOpcode	fdivd fdivdeq fdivdne fdivdcs fdivdhs fdivdcc
syn keyword armasmOpcode	fdivdlo fdivdmi fdivdpl fdivdvs fdivdvc fdivdhi
syn keyword armasmOpcode	fdivdls fdivdge fdivdlt fdivdgt fdivdle fdivdal

syn keyword armasmOpcode	fcpys fcpyseq fcpysne fcpyscs fcpyshs fcpyscc
syn keyword armasmOpcode	fcpyslo fcpysmi fcpyspl fcpysvs fcpysvc fcpyshi
syn keyword armasmOpcode	fcpysls fcpysge fcpyslt fcpysgt fcpysle fcpysal
syn keyword armasmOpcode	fcpyd fcpydeq fcpydne fcpydcs fcpydhs fcpydcc
syn keyword armasmOpcode	fcpydlo fcpydmi fcpydpl fcpydvs fcpydvc fcpydhi
syn keyword armasmOpcode	fcpydls fcpydge fcpydlt fcpydgt fcpydle fcpydal

syn keyword armasmOpcode	fabss fabsseq fabssne fabsscs fabsshs fabsscc
syn keyword armasmOpcode	fabsslo fabssmi fabsspl fabssvs fabssvc fabsshi
syn keyword armasmOpcode	fabssls fabssge fabsslt fabssgt fabssle fabssal
syn keyword armasmOpcode	fabsd fabsdeq fabsdne fabsdcs fabsdhs fabsdcc
syn keyword armasmOpcode	fabsdlo fabsdmi fabsdpl fabsdvs fabsdvc fabsdhi
syn keyword armasmOpcode	fabsdls fabsdge fabsdlt fabsdgt fabsdle fabsdal

syn keyword armasmOpcode	fnegs fnegseq fnegsne fnegscs fnegshs fnegscc
syn keyword armasmOpcode	fnegslo fnegsmi fnegspl fnegsvs fnegsvc fnegshi
syn keyword armasmOpcode	fnegsls fnegsge fnegslt fnegsgt fnegsle fnegsal
syn keyword armasmOpcode	fnegd fnegdeq fnegdne fnegdcs fnegdhs fnegdcc
syn keyword armasmOpcode	fnegdlo fnegdmi fnegdpl fnegdvs fnegdvc fnegdhi
syn keyword armasmOpcode	fnegdls fnegdge fnegdlt fnegdgt fnegdle fnegdal

syn keyword armasmOpcode	fsqrts fsqrtseq fsqrtsne fsqrtscs fsqrtshs
syn keyword armasmOpcode	fsqrtscc fsqrtslo fsqrtsmi fsqrtspl fsqrtsvs
syn keyword armasmOpcode	fsqrtsvc fsqrtshi fsqrtsls fsqrtsge fsqrtslt
syn keyword armasmOpcode	fsqrtsgt fsqrtsle fsqrtsal fsqrtd fsqrtdeq
syn keyword armasmOpcode	fsqrtdne fsqrtdcs fsqrtdhs fsqrtdcc fsqrtdlo
syn keyword armasmOpcode	fsqrtdmi fsqrtdpl fsqrtdvs fsqrtdvc fsqrtdhi
syn keyword armasmOpcode	fsqrtdls fsqrtdge fsqrtdlt fsqrtdgt fsqrtdle
syn keyword armasmOpcode	fsqrtdal

syn keyword armasmOpcode	fcmps fcmpseq fcmpsne fcmpscs fcmpshs fcmpscc
syn keyword armasmOpcode	fcmpslo fcmpsmi fcmpspl fcmpsvs fcmpsvc fcmpshi
syn keyword armasmOpcode	fcmpsls fcmpsge fcmpslt fcmpsgt fcmpsle fcmpsal
syn keyword armasmOpcode	fcmpd fcmpdeq fcmpdne fcmpdcs fcmpdhs fcmpdcc
syn keyword armasmOpcode	fcmpdlo fcmpdmi fcmpdpl fcmpdvs fcmpdvc fcmpdhi
syn keyword armasmOpcode	fcmpdls fcmpdge fcmpdlt fcmpdgt fcmpdle fcmpdal

syn keyword armasmOpcode	fcmpes fcmpeseq fcmpesne fcmpescs fcmpeshs
syn keyword armasmOpcode	fcmpescc fcmpeslo fcmpesmi fcmpespl fcmpesvs
syn keyword armasmOpcode	fcmpesvc fcmpeshi fcmpesls fcmpesge fcmpeslt
syn keyword armasmOpcode	fcmpesgt fcmpesle fcmpesal fcmped fcmpedeq
syn keyword armasmOpcode	fcmpedne fcmpedcs fcmpedhs fcmpedcc fcmpedlo
syn keyword armasmOpcode	fcmpedmi fcmpedpl fcmpedvs fcmpedvc fcmpedhi
syn keyword armasmOpcode	fcmpedls fcmpedge fcmpedlt fcmpedgt fcmpedle
syn keyword armasmOpcode	fcmpedal

syn keyword armasmOpcode	fcmpzs fcmpzseq fcmpzsne fcmpzscs fcmpzshs
syn keyword armasmOpcode	fcmpzscc fcmpzslo fcmpzsmi fcmpzspl fcmpzsvs
syn keyword armasmOpcode	fcmpzsvc fcmpzshi fcmpzsls fcmpzsge fcmpzslt
syn keyword armasmOpcode	fcmpzsgt fcmpzsle fcmpzsal fcmpzd fcmpzdeq
syn keyword armasmOpcode	fcmpzdne fcmpzdcs fcmpzdhs fcmpzdcc fcmpzdlo
syn keyword armasmOpcode	fcmpzdmi fcmpzdpl fcmpzdvs fcmpzdvc fcmpzdhi
syn keyword armasmOpcode	fcmpzdls fcmpzdge fcmpzdlt fcmpzdgt fcmpzdle
syn keyword armasmOpcode	fcmpzdal

syn keyword armasmOpcode	fcmpezs fcmpezseq fcmpezsne fcmpezscs fcmpezshs
syn keyword armasmOpcode	fcmpezscc fcmpezslo fcmpezsmi fcmpezspl
syn keyword armasmOpcode	fcmpezsvs fcmpezsvc fcmpezshi fcmpezsls
syn keyword armasmOpcode	fcmpezsge fcmpezslt fcmpezsgt fcmpezsle
syn keyword armasmOpcode	fcmpezsal fcmpezd fcmpezdeq fcmpezdne fcmpezdcs
syn keyword armasmOpcode	fcmpezdhs fcmpezdcc fcmpezdlo fcmpezdmi
syn keyword armasmOpcode	fcmpezdpl fcmpezdvs fcmpezdvc fcmpezdhi
syn keyword armasmOpcode	fcmpezdls fcmpezdge fcmpezdlt fcmpezdgt
syn keyword armasmOpcode	fcmpezdle fcmpezdal

syn keyword armasmOpcode	fcvtds fcvtdseq fcvtdsne fcvtdscs fcvtdshs
syn keyword armasmOpcode	fcvtdscc fcvtdslo fcvtdsmi fcvtdspl fcvtdsvs
syn keyword armasmOpcode	fcvtdsvc fcvtdshi fcvtdsls fcvtdsge fcvtdslt
syn keyword armasmOpcode	fcvtdsgt fcvtdsle fcvtdsal

syn keyword armasmOpcode	fcvtsd fcvtsdeq fcvtsdne fcvtsdcs fcvtsdhs
syn keyword armasmOpcode	fcvtsdcc fcvtsdlo fcvtsdmi fcvtsdpl fcvtsdvs
syn keyword armasmOpcode	fcvtsdvc fcvtsdhi fcvtsdls fcvtsdge fcvtsdlt
syn keyword armasmOpcode	fcvtsdgt fcvtsdle fcvtsdal

syn keyword armasmOpcode	fuitos fuitoseq fuitosne fuitoscs fuitoshs
syn keyword armasmOpcode	fuitoscc fuitoslo fuitosmi fuitospl fuitosvs
syn keyword armasmOpcode	fuitosvc fuitoshi fuitosls fuitosge fuitoslt
syn keyword armasmOpcode	fuitosgt fuitosle fuitosal
syn keyword armasmOpcode	fuitod fuitodeq fuitodne fuitodcs fuitodhs
syn keyword armasmOpcode	fuitodcc fuitodlo fuitodmi fuitodpl fuitodvs
syn keyword armasmOpcode	fuitodvc fuitodhi fuitodls fuitodge fuitodlt
syn keyword armasmOpcode	fuitodgt fuitodle fuitodal

syn keyword armasmOpcode	fsitos fsitoseq fsitosne fsitoscs fsitoshs
syn keyword armasmOpcode	fsitoscc fsitoslo fsitosmi fsitospl fsitosvs
syn keyword armasmOpcode	fsitosvc fsitoshi fsitosls fsitosge fsitoslt
syn keyword armasmOpcode	fsitosgt fsitosle fsitosal
syn keyword armasmOpcode	fsitod fsitodeq fsitodne fsitodcs fsitodhs
syn keyword armasmOpcode	fsitodcc fsitodlo fsitodmi fsitodpl fsitodvs
syn keyword armasmOpcode	fsitodvc fsitodhi fsitodls fsitodge fsitodlt
syn keyword armasmOpcode	fsitodgt fsitodle fsitodal

syn keyword armasmOpcode	ftouis ftouiseq ftouisne ftouiscs ftouishs
syn keyword armasmOpcode	ftouiscc ftouislo ftouismi ftouispl ftouisvs
syn keyword armasmOpcode	ftouisvc ftouishi ftouisls ftouisge ftouislt
syn keyword armasmOpcode	ftouisgt ftouisle ftouisal
syn keyword armasmOpcode	ftouid ftouideq ftouidne ftouidcs ftouidhs
syn keyword armasmOpcode	ftouidcc ftouidlo ftouidmi ftouidpl ftouidvs
syn keyword armasmOpcode	ftouidvc ftouidhi ftouidls ftouidge ftouidlt
syn keyword armasmOpcode	ftouidgt ftouidle ftouidal

syn keyword armasmOpcode	ftouizs ftouizseq ftouizsne ftouizscs ftouizshs
syn keyword armasmOpcode	ftouizscc ftouizslo ftouizsmi ftouizspl
syn keyword armasmOpcode	ftouizsvs ftouizsvc ftouizshi ftouizsls
syn keyword armasmOpcode	ftouizsge ftouizslt ftouizsgt ftouizsle
syn keyword armasmOpcode	ftouizsal
syn keyword armasmOpcode	ftouizd ftouizdeq ftouizdne ftouizdcs ftouizdhs
syn keyword armasmOpcode	ftouizdcc ftouizdlo ftouizdmi ftouizdpl
syn keyword armasmOpcode	ftouizdvs ftouizdvc ftouizdhi ftouizdls
syn keyword armasmOpcode	ftouizdge ftouizdlt ftouizdgt ftouizdle
syn keyword armasmOpcode	ftouizdal

syn keyword armasmOpcode	ftosis ftosiseq ftosisne ftosiscs ftosishs
syn keyword armasmOpcode	ftosiscc ftosislo ftosismi ftosispl ftosisvs
syn keyword armasmOpcode	ftosisvc ftosishi ftosisls ftosisge ftosislt
syn keyword armasmOpcode	ftosisgt ftosisle ftosisal
syn keyword armasmOpcode	ftosid ftosideq ftosidne ftosidcs ftosidhs
syn keyword armasmOpcode	ftosidcc ftosidlo ftosidmi ftosidpl ftosidvs
syn keyword armasmOpcode	ftosidvc ftosidhi ftosidls ftosidge ftosidlt
syn keyword armasmOpcode	ftosidgt ftosidle ftosidal

syn keyword armasmOpcode	ftosizs ftosizseq ftosizsne ftosizscs ftosizshs
syn keyword armasmOpcode	ftosizscc ftosizslo ftosizsmi ftosizspl
syn keyword armasmOpcode	ftosizsvs ftosizsvc ftosizshi ftosizsls
syn keyword armasmOpcode	ftosizsge ftosizslt ftosizsgt ftosizsle
syn keyword armasmOpcode	ftosizsal
syn keyword armasmOpcode	ftosizd ftosizdeq ftosizdne ftosizdcs ftosizdhs
syn keyword armasmOpcode	ftosizdcc ftosizdlo ftosizdmi ftosizdpl
syn keyword armasmOpcode	ftosizdvs ftosizdvc ftosizdhi ftosizdls
syn keyword armasmOpcode	ftosizdge ftosizdlt ftosizdgt ftosizdle
syn keyword armasmOpcode	ftosizdal

syn keyword armasmOpcode	fsts fstseq fstsne fstscs fstshs fstscc fstslo
syn keyword armasmOpcode	fstsmi fstspl fstsvs fstsvc fstshi fstsls
syn keyword armasmOpcode	fstsge fstslt fstsgt fstsle fstsal
syn keyword armasmOpcode	fstd fstdeq fstdne fstdcs fstdhs fstdcc fstdlo
syn keyword armasmOpcode	fstdmi fstdpl fstdvs fstdvc fstdhi fstdls
syn keyword armasmOpcode	fstdge fstdlt fstdgt fstdle fstdal

syn keyword armasmOpcode	fstmias fstmiaseq fstmiasne fstmiascs fstmiashs
syn keyword armasmOpcode	fstmiascc fstmiaslo fstmiasmi fstmiaspl
syn keyword armasmOpcode	fstmiasvs fstmiasvc fstmiashi fstmiasls
syn keyword armasmOpcode	fstmiasge fstmiaslt fstmiasgt fstmiasle
syn keyword armasmOpcode	fstmiasal
syn keyword armasmOpcode	fstmiad fstmiadeq fstmiadne fstmiadcs fstmiadhs
syn keyword armasmOpcode	fstmiadcc fstmiadlo fstmiadmi fstmiadpl
syn keyword armasmOpcode	fstmiadvs fstmiadvc fstmiadhi fstmiadls
syn keyword armasmOpcode	fstmiadge fstmiadlt fstmiadgt fstmiadle
syn keyword armasmOpcode	fstmiadal
syn keyword armasmOpcode	fstmiax fstmiaxeq fstmiaxne fstmiaxcs fstmiaxhs
syn keyword armasmOpcode	fstmiaxcc fstmiaxlo fstmiaxmi fstmiaxpl
syn keyword armasmOpcode	fstmiaxvs fstmiaxvc fstmiaxhi fstmiaxls
syn keyword armasmOpcode	fstmiaxge fstmiaxlt fstmiaxgt fstmiaxle
syn keyword armasmOpcode	fstmiaxal

syn keyword armasmOpcode	fstmdbs fstmdbseq fstmdbsne fstmdbscs fstmdbshs
syn keyword armasmOpcode	fstmdbscc fstmdbslo fstmdbsmi fstmdbspl
syn keyword armasmOpcode	fstmdbsvs fstmdbsvc fstmdbshi fstmdbsls
syn keyword armasmOpcode	fstmdbsge fstmdbslt fstmdbsgt fstmdbsle
syn keyword armasmOpcode	fstmdbsal
syn keyword armasmOpcode	fstmdbd fstmdbdeq fstmdbdne fstmdbdcs fstmdbdhs
syn keyword armasmOpcode	fstmdbdcc fstmdbdlo fstmdbdmi fstmdbdpl
syn keyword armasmOpcode	fstmdbdvs fstmdbdvc fstmdbdhi fstmdbdls
syn keyword armasmOpcode	fstmdbdge fstmdbdlt fstmdbdgt fstmdbdle
syn keyword armasmOpcode	fstmdbdal
syn keyword armasmOpcode	fstmdbx fstmdbxeq fstmdbxne fstmdbxcs fstmdbxhs
syn keyword armasmOpcode	fstmdbxcc fstmdbxlo fstmdbxmi fstmdbxpl
syn keyword armasmOpcode	fstmdbxvs fstmdbxvc fstmdbxhi fstmdbxls
syn keyword armasmOpcode	fstmdbxge fstmdbxlt fstmdbxgt fstmdbxle
syn keyword armasmOpcode	fstmdbxal

syn keyword armasmOpcode	flds fldseq fldsne fldscs fldshs fldscc fldslo
syn keyword armasmOpcode	fldsmi fldspl fldsvs fldsvc fldshi fldsls
syn keyword armasmOpcode	fldsge fldslt fldsgt fldsle fldsal
syn keyword armasmOpcode	fldd flddeq flddne flddcs flddhs flddcc flddlo
syn keyword armasmOpcode	flddmi flddpl flddvs flddvc flddhi flddls
syn keyword armasmOpcode	flddge flddlt flddgt flddle flddal

syn keyword armasmOpcode	fldmias fldmiaseq fldmiasne fldmiascs fldmiashs
syn keyword armasmOpcode	fldmiascc fldmiaslo fldmiasmi fldmiaspl
syn keyword armasmOpcode	fldmiasvs fldmiasvc fldmiashi fldmiasls
syn keyword armasmOpcode	fldmiasge fldmiaslt fldmiasgt fldmiasle
syn keyword armasmOpcode	fldmiasal
syn keyword armasmOpcode	fldmiad fldmiadeq fldmiadne fldmiadcs fldmiadhs
syn keyword armasmOpcode	fldmiadcc fldmiadlo fldmiadmi fldmiadpl
syn keyword armasmOpcode	fldmiadvs fldmiadvc fldmiadhi fldmiadls
syn keyword armasmOpcode	fldmiadge fldmiadlt fldmiadgt fldmiadle
syn keyword armasmOpcode	fldmiadal
syn keyword armasmOpcode	fldmiax fldmiaxeq fldmiaxne fldmiaxcs fldmiaxhs
syn keyword armasmOpcode	fldmiaxcc fldmiaxlo fldmiaxmi fldmiaxpl
syn keyword armasmOpcode	fldmiaxvs fldmiaxvc fldmiaxhi fldmiaxls
syn keyword armasmOpcode	fldmiaxge fldmiaxlt fldmiaxgt fldmiaxle
syn keyword armasmOpcode	fldmiaxal

syn keyword armasmOpcode	fldmdbs fldmdbseq fldmdbsne fldmdbscs fldmdbshs
syn keyword armasmOpcode	fldmdbscc fldmdbslo fldmdbsmi fldmdbspl
syn keyword armasmOpcode	fldmdbsvs fldmdbsvc fldmdbshi fldmdbsls
syn keyword armasmOpcode	fldmdbsge fldmdbslt fldmdbsgt fldmdbsle
syn keyword armasmOpcode	fldmdbsal
syn keyword armasmOpcode	fldmdbd fldmdbdeq fldmdbdne fldmdbdcs fldmdbdhs
syn keyword armasmOpcode	fldmdbdcc fldmdbdlo fldmdbdmi fldmdbdpl
syn keyword armasmOpcode	fldmdbdvs fldmdbdvc fldmdbdhi fldmdbdls
syn keyword armasmOpcode	fldmdbdge fldmdbdlt fldmdbdgt fldmdbdle
syn keyword armasmOpcode	fldmdbdal
syn keyword armasmOpcode	fldmdbx fldmdbxeq fldmdbxne fldmdbxcs fldmdbxhs
syn keyword armasmOpcode	fldmdbxcc fldmdbxlo fldmdbxmi fldmdbxpl
syn keyword armasmOpcode	fldmdbxvs fldmdbxvc fldmdbxhi fldmdbxls
syn keyword armasmOpcode	fldmdbxge fldmdbxlt fldmdbxgt fldmdbxle
syn keyword armasmOpcode	fldmdbxal

syn keyword armasmOpcode	fmsr fmsreq fmsrne fmsrcs fmsrhs fmsrcc fmsrlo
syn keyword armasmOpcode	fmsrmi fmsrpl fmsrvs fmsrvc fmsrhi fmsrls
syn keyword armasmOpcode	fmsrge fmsrlt fmsrgt fmsrle fmsral

syn keyword armasmOpcode	fmrs fmrseq fmrsne fmrscs fmrshs fmrscc fmrslo
syn keyword armasmOpcode	fmrsmi fmrspl fmrsvs fmrsvc fmrshi fmrsls
syn keyword armasmOpcode	fmrsge fmrslt fmrsgt fmrsle fmrsal

syn keyword armasmOpcode	fmdlr fmdlreq fmdlrne fmdlrcs fmdlrhs fmdlrcc
syn keyword armasmOpcode	fmdlrlo fmdlrmi fmdlrpl fmdlrvs fmdlrvc fmdlrhi
syn keyword armasmOpcode	fmdlrls fmdlrge fmdlrlt fmdlrgt fmdlrle fmdlral

syn keyword armasmOpcode	fmrdl fmrdleq fmrdlne fmrdlcs fmrdlhs fmrdlcc
syn keyword armasmOpcode	fmrdllo fmrdlmi fmrdlpl fmrdlvs fmrdlvc fmrdlhi
syn keyword armasmOpcode	fmrdlls fmrdlge fmrdllt fmrdlgt fmrdlle fmrdlal

syn keyword armasmOpcode	fmdhr fmdhreq fmdhrne fmdhrcs fmdhrhs fmdhrcc
syn keyword armasmOpcode	fmdhrlo fmdhrmi fmdhrpl fmdhrvs fmdhrvc fmdhrhi
syn keyword armasmOpcode	fmdhrls fmdhrge fmdhrlt fmdhrgt fmdhrle fmdhral

syn keyword armasmOpcode	fmrdh fmrdheq fmrdhne fmrdhcs fmrdhhs fmrdhcc
syn keyword armasmOpcode	fmrdhlo fmrdhmi fmrdhpl fmrdhvs fmrdhvc fmrdhhi
syn keyword armasmOpcode	fmrdhls fmrdhge fmrdhlt fmrdhgt fmrdhle fmrdhal

syn keyword armasmOpcode	fmxr fmxreq fmxrne fmxrcs fmxrhs fmxrcc fmxrlo
syn keyword armasmOpcode	fmxrmi fmxrpl fmxrvs fmxrvc fmxrhi fmxrls
syn keyword armasmOpcode	fmxrge fmxrlt fmxrgt fmxrle fmxral

syn keyword armasmOpcode	fmrx fmrxeq fmrxne fmrxcs fmrxhs fmrxcc fmrxlo
syn keyword armasmOpcode	fmrxmi fmrxpl fmrxvs fmrxvc fmrxhi fmrxls
syn keyword armasmOpcode	fmrxge fmrxlt fmrxgt fmrxle fmrxal

syn keyword armasmOpcode	fmstat fmstateq fmstatne fmstatcs fmstaths
syn keyword armasmOpcode	fmstatcc fmstatlo fmstatmi fmstatpl fmstatvs
syn keyword armasmOpcode	fmstatvc fmstathi fmstatls fmstatge fmstatlt
syn keyword armasmOpcode	fmstatgt fmstatle fmstatal

syn keyword armasmOpcode	adr adreq adrne adrcs adrhs adrcc adrlo
syn keyword armasmOpcode	adrmi adrpl adrvs adrvc adrhi adrls
syn keyword armasmOpcode	adrge adrlt adrgt adrle adral
syn keyword armasmOpcode	adrl adreql adrnel adrcsl adrhsl adrccl adrlol
syn keyword armasmOpcode	adrmil adrpll adrvsl adrvcl adrhil adrlsl
syn keyword armasmOpcode	adrgel adrltl adrgtl adrlel adrall

syn keyword armasmOpcode        cpsie

syn keyword armasmDirective	ADDRESS ALIGN AREA ASSERT CN CODE16 CODE32 CP
syn keyword armasmDirective	DATA DCB DCD DCDO DCDU DCFD DCFDU DCFS DCFSU
syn keyword armasmDirective	DCI DCQ DCQU DCW DCWU DN ELSE END ENDFUNC ENDIF
syn keyword armasmDirective	ENDP ENTRY EQU EXPORT EXPORTAS EXTERN FIELD FN
syn keyword armasmDirective	FRAME FUNCTION GBLA GBLL GBLS GET GLOBAL IF
syn keyword armasmDirective	IMPORT INCBIN INCLUDE INFO KEEP LCLA LCLL LCLS
syn keyword armasmDirective	LTORG MACRO MAP MEND MEXIT NOFP OPT POP PROC
syn keyword armasmDirective	ENDM
syn keyword armasmDirective	PUSH REGISTER REMEMBER REQUIRE RESTORE RLIST RN
syn keyword armasmDirective	ROUT SAVE SETA SETL SETS SN SPACE STATE SUBT
syn keyword armasmDirective	TTL WEND WHILE
syn keyword armasmDirective	ASSOC CODE COMDEF COMMON NOINIT READONLY
syn keyword armasmDirective	READWRITE WEAK


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_armasm_syntax_inits")
  if version < 508
    let did_armasm_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink armasmTodo		Todo
  HiLink armasmComment		Comment
  HiLink armasmDirective	Statement
  HiLink armasmString		String
  HiLink armasmRegister		Structure
  HiLink armasmASCII		Character
  HiLink armasmBinary		Number
  HiLink armasmDecimal		Number
  HiLink armasmHexadecimal	Number
  HiLink armasmOctal		Number
  HiLink armasmBase3		Number
  HiLink armasmBase4		Number
  HiLink armasmBase5		Number
  HiLink armasmBase6		Number
  HiLink armasmBase7		Number
  HiLink armasmBase9		Number
  HiLink armasmFloat		Float
  HiLink armasmBoolean		Boolean
  HiLink armasmBuiltIn		Constant
  HiLink armasmIdentifier	Identifier

  "
  " The following look better (for me, at least) with the alternate mappings,
  " although the more "natural" way to highlight them is as follows:
  "
  HiLink armasmLabel		Label
  HiLink armasmOpcode		Keyword
  HiLink armasmOperator	Operator

  "HiLink armasmLabel		Identifier
  "HiLink armasmOpcode		Normal
  "HiLink armasmOperator		Special

  delcommand HiLink
endif

let b:current_syntax = "armasm"

" vim: ts=8
