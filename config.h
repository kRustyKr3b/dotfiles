/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
/* 0: sloppy systray follows selected monitor, >0: pin systray to moni */
static const unsigned int systrayspacing = 0;   /* systray spacing */
static const unsigned int systrayonleft = 0;	/*0:systray in the right corner, >0:systray on left of status text */
static const unsigned int systraypinning = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
//static const int usealtbar     = 1;          /* 1 means use non-dwm status bar */
//static const char *altbarclass = "Polybar";  /* Alternate bar class name */
static const char *fonts[]          = { "Iosevka Term :size=08", "Material Design Icons:size=09"};
static const char dmenufont[]       = "Iosevka Term :size=09";
static const char col_gray0[]       = "#000000";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#ffffff";
static const char col_purp[]        = "#6500a7";
static const char col_cyan[]        = "#005577";
static const char col_cyan1[]       = "#0075b7";
static const char col_cyan2[]       = "#01a6ff";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray0 },
	[SchemeSel]  = { col_gray0, col_gray3,  col_cyan2  },
};

static const char scratchpadname[] = "Чернобыль";
static const char *scratchpadcmd[] = { "alacritty", "-t", scratchpadname, NULL };

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Eclipse",  NULL,       NULL,       5,            0,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "O8",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }


/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *upvol[] = { "amixer", "-q", "sset", "Master", "5%+", NULL };
static const char *downvol[] = { "amixer", "-q", "sset", "Master", "5%-", NULL };
static const char *mute[] = { "amixer","-q", "-D", "pulse", "sset", "Master", "toggle", NULL };
static const char *upBRT[] = { "brightnessctl", "set", "+10%", NULL };
static const char *downBRT[] = { "brightnessctl", "set", "10%-", NULL };

static const char *termcmd[]  = { "alacritty", NULL };
static const char *termcmd1[]  = { "termite", NULL };
static const char *webcmd[]  = { "firefox", NULL };
static const char *lock[]  = { "betterlockscreen", "-l",  "-t", "BTFO", NULL };
static const char *ranger[]  = { "alacritty", "-e", "ranger", NULL };
static const char *mocp[]  = { "alacritty", "-e", "mocp", NULL };
static const char *jgmenu[]  = { "jgmenu", "&&", "rm","jgmenu-lockfile", NULL };
static const char *discord[]  = { "discord", NULL };
static const char *FX[]  = { "spacefm", NULL };
static const char *SC[]  = { "scrcpy", NULL };
static const char *VM[]  = { "virt-manager", NULL };
static const char *calc[]  = { "mate-calc", NULL };
static const char *lxAppearance[]  = { "lxappearance", NULL };
static const char *themix[]  = { "themix-gui", NULL };
static const char *PrtScr[]  = {"/home/shaolinrus/scripts/PrtScr.sh", NULL };
static const char *PrtScrA[]  = { "/home/shaolinrus/scripts/PrtScrA.sh", NULL };
static const char *PrtScrS[]  = { "/home/shaolinrus/scripts/PrtScrS.sh", NULL };
static const char *KILL[]  = { "xkill", NULL };
static const char *qbit[]  = { "qbittorrent", NULL };
static const char *AFT[]  = { "android-file-transfer", NULL };

static const char *CB[]  = { "codeblocks", NULL };
static const char *BL[]  = { "blender", NULL };
static const char *ID[]  = { "idea", NULL };
static const char *MY[]  = { "mysql-workbench", NULL };
static const char *QT[]  = { "qtcreator", NULL };

static const char *dmenuThemes[]  = { "/home/shaolinrus/scripts/dwm_theme_picker.sh", NULL };
static const char *dmenuEmojis[]  = { "/home/shaolinrus/scripts/dmenuunicode.sh", NULL };
static const char *displaySelect[]  = { "/home/shaolinrus/scripts/displayselect.sh", NULL };
static const char *dwmExit[]  = { "/home/shaolinrus/scripts/dwmExit.sh", NULL };
static const char *dmenuAudio[]  = { "/home/shaolinrus/scripts/audioctrl.sh", NULL };
static const char *TpCtl[]  = { "/home/shaolinrus/scripts/tpctrl.sh", NULL };
static const char *micMute[]  = { "/home/shaolinrus/scripts/mic.sh", NULL };
static const char *saveDots[]  = { "/home/shaolinrus/scripts/saveDots.sh", NULL };
static const char *dmenuSpid[]  = { "gksu", "-S", "/home/shaolinrus/scripts/spid.sh", "&&", "notify-send", "DONE",  NULL };

static Key keys[] = {
	/* modifier             key							 function        argument */
	{ 0,0x1008ff13,			spawn,									{.v = upvol } },
    { 0,0x1008ff11,			spawn,									{.v = downvol } },
    { 0,0x1008ff12,			spawn,									{.v = mute } },
    { 0,0x1008ff02,			spawn,									{.v = upBRT } },
    { 0,0x1008ff03,			spawn,									{.v = downBRT } },
    { 0,0x1008ffb2,			spawn,									{.v = micMute } },
    { 0,0xff61,				spawn,									{.v = PrtScr } },
	{ 0,0xffc9,				togglescratch,							{.v = scratchpadcmd } },

	{ MODKEY,				        XK_Return,	spawn,				{.v = termcmd } },
	{ MODKEY|ControlMask,			XK_Return,	spawn,				{.v = termcmd1 } },
	{ MODKEY,                       XK_b,		spawn,				{.v = webcmd} },
	{ MODKEY,                       XK_d,		spawn,				{.v = dmenucmd } },
	{ MODKEY,                       XK_g,		spawn,				{.v = ranger } },
	{ MODKEY,                       XK_m,		spawn,				{.v = mocp } },
	{ MODKEY,                       XK_n,		spawn,				{.v = FX } },
	{ MODKEY,						0x5c,		spawn,				{.v = lxAppearance } },
	{ MODKEY,				        0xffab,		spawn,				{.v = calc } },
    { MODKEY,						0xff9c,		spawn,				{.v = CB } },
    { MODKEY,						0xff99,		spawn,				{.v = BL } },
    { MODKEY,						0xff9b,		spawn,				{.v = ID } },
    { MODKEY,						0xff96,		spawn,				{.v = MY } },
    { MODKEY,						0xff9d,		spawn,				{.v = QT } },
	
	{ MODKEY|ControlMask,           XK_l,	   	spawn,				{.v = lock } },
	{ MODKEY|ControlMask,           XK_d,	   	spawn,				{.v = discord } },
	{ MODKEY|ControlMask,           XK_q,	   	spawn,				{.v = qbit } },
	
	{ MODKEY|ShiftMask,				0x5c,	   	spawn,				{.v = themix } },
	{ MODKEY|ShiftMask,           0xff1b,	   	spawn,				{.v = KILL } },
	{ MODKEY|ShiftMask,				XK_d,	   	spawn,				{.v = jgmenu } },
	{ MODKEY|ShiftMask,				XK_e,	   	spawn,				{.v = dwmExit } },
	{ MODKEY|ShiftMask,				XK_m,	   	spawn,				{.v = VM } },
	{ MODKEY|ShiftMask,				XK_s,	   	spawn,				{.v = SC } },
	{ MODKEY|ShiftMask,				XK_a,	   	spawn,				{.v = AFT } },

	{ MODKEY|ControlMask|ShiftMask,	XK_A,	   	spawn,				{.v = PrtScrA } },
	{ MODKEY|ControlMask|ShiftMask,	XK_s,	   	spawn,				{.v = PrtScrS } },

	{ Mod1Mask|ControlMask,         XK_t,	   	spawn,          	{.v = dmenuThemes } },
	{ Mod1Mask|ControlMask,         XK_e,	   	spawn,          	{.v = dmenuEmojis } },
	{ Mod1Mask|ControlMask,         XK_m,	   	spawn,          	{.v = displaySelect } },
	{ Mod1Mask|ControlMask,         XK_a,	   	spawn,          	{.v = dmenuAudio } },
	{ Mod1Mask|ControlMask,         XK_s,	   	spawn,          	{.v = dmenuSpid } },
	{ Mod1Mask|ControlMask,         XK_x,	   	spawn,          	{.v = TpCtl } },
	{ Mod1Mask|ControlMask,         XK_q,	   	spawn,          	{.v = saveDots } },

	{ MODKEY,                       XK_j,      	focusstack,     	{.i = +1 } },
	{ MODKEY,                       XK_k,      	focusstack,     	{.i = -1 } },
	{ MODKEY,                       XK_i,      	incnmaster,     	{.i = +1 } },
	{ MODKEY,                       XK_p,      	incnmaster,     	{.i = -1 } },
	{ MODKEY,                       XK_h,      	setmfact,	   		{.f = -0.05} },
	{ MODKEY,                       XK_l,      	setmfact,	   		{.f = +0.05} },
	{ MODKEY,                       XK_Tab,    	view,           	{0} },
	{ MODKEY,                       XK_t,      	setlayout,      	{.v = &layouts[0]} },
	//{ MODKEY,                       XK_f,      	setlayout,      	{.v = &layouts[1]} },
	{ MODKEY,                       XK_space,  	setlayout,      	{0} },
	{ MODKEY,                       XK_0,      	view,           	{.ui = ~0 } },
	{ MODKEY,                       XK_comma,  	focusmon,       	{.i = -1 } },
	{ MODKEY,                       XK_period, 	focusmon,       	{.i = +1 } },
	{ MODKEY|ShiftMask,             XK_space,  	togglefloating, 	{0} },
	{ MODKEY|ShiftMask,             XK_c,      	killclient,     	{0} },
	{ MODKEY|ShiftMask,             XK_b,      	togglebar,      	{0} },
	{ MODKEY|ShiftMask,             XK_Return, 	zoom,		   		{0} },
	{ MODKEY|ShiftMask,             XK_n,      	setlayout,      	{.v = &layouts[2]} },
	{ MODKEY|ShiftMask,             XK_0,      	tag,            	{.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_comma,  	tagmon,         	{.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, 	tagmon,         	{.i = +1 } },
	TAGKEYS(                        XK_1,                      	0)
	TAGKEYS(                        XK_2,                      	1)
	TAGKEYS(                        XK_3,                      	2)
	TAGKEYS(                        XK_4,                      	3)
	TAGKEYS(                        XK_5,                      	4)
	TAGKEYS(                        XK_6,                      	5)
	TAGKEYS(                        XK_7,                      	6)
	TAGKEYS(                        XK_8,                      	7)
	TAGKEYS(                        XK_9,                      	8)
	//{ MODKEY|ShiftMask,             XK_q,      quit,          {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

