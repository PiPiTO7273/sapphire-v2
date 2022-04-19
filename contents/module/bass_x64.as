
#ifndef __BASS__
#define global __BASS__
#uselib "contents/module/bass_x64.dll"

	#cfunc global BASS_GetVersion "BASS_GetVersion"
	#func global  BASS_Init "BASS_Init" int, int, int ,int, int
	#func global  BASS_Free onexit "BASS_Free"
	#cfunc global BASS_StreamCreateFile "BASS_StreamCreateFile" int, sptr, int,int, int,int, int
	#func global  BASS_StreamFree "BASS_StreamFree" int
	#func global BASS_ChannelFree "BASS_ChannelFree" int
	#func global  BASS_ChannelPlay "BASS_ChannelPlay" int, int
	#func global  BASS_FXSetParameters "BASS_FXSetParameters" int, var
	#cfunc global BASS_ChannelSetFX "BASS_ChannelSetFX" int, int, int
	#func global BASS_FXReset "BASS_FXReset" int
	#func global BASS_ChannelRemoveFX "BASS_ChannelRemoveFX" int,int
	#func global BASS_SetConfig "BASS_SetConfig" sptr,sptr
	#func global BASS_GetInfo "BASS_GetInfo" sptr

	#cfunc global BASS_ErrorGetCode "BASS_ErrorGetCode"

	#func global BASS_GetCPU "BASS_GetCPU"
	#func global BASS_Pause "BASS_Pause"
	#func global BASS_Start "BASS_Start"
	#cfunc global BASS_GetVolume "BASS_GetVolume"
	#func global BASS_SetVolume "BASS_SetVolume" int
	#func global BASS_PluginLoad "BASS_PluginLoad" sptr,sptr

	#cfunc global BASS_SampleLoad "BASS_SampleLoad" int, sptr, int, int, int, int, int
	#cfunc global BASS_SampleGetChannel "BASS_SampleGetChannel" int, int
	#func global BASS_SampleStop "BASS_SampleStop" int
	#func global BASS_SampleFree "BASS_SampleFree" int
	#func global BASS_ChannelPause "BASS_ChannelPause" int
	#func global BASS_ChannelStop "BASS_ChannelStop" int
	#func global BASS_ChannelSetAttribute "BASS_ChannelSetAttribute" sptr,sptr,sptr
	#func global BASS_ChannelGetLength "BASS_ChannelGetLength" sptr,sptr
	#cfunc global BASS_ChannelBytes2Seconds "BASS_ChannelBytes2Seconds" sptr, sptr
	#func global BASS_ChannelIsActive "BASS_ChannelIsActive" int
	#cfunc global BASS_ChannelGetPosition "BASS_ChannelGetPosition" sptr,sptr
	#func global BASS_ChannelSetPosition "BASS_ChannelSetPosition" sptr,sptr,sptr,sptr
	#cfunc global BASS_ChannelSeconds2Bytes "BASS_ChannelSeconds2Bytes" sptr,double
	#func global BASS_ChannelGetData "BASS_ChannelGetData" sptr,sptr,sptr

	#define global BASS_SAMPLE_8BITS		1		// 8 bit
	#define global BASS_SAMPLE_FLOAT		256		// 32 bit floating-point
	#define global BASS_SAMPLE_MONO			2		// mono
	#define global BASS_SAMPLE_LOOP			4		// looped
	#define global BASS_SAMPLE_3D			8		// 3D func globaltionality
	#define global BASS_SAMPLE_SOFTWARE		16		// not using hardware mixing
	#define global BASS_SAMPLE_MUTEMAX		32		// mute at max distance (3D only)
	#define global BASS_SAMPLE_VAM			64		// DX7 voice allocation & management
	#define global BASS_SAMPLE_FX			128		// old implementation of DX8 effects
	#define global BASS_SAMPLE_OVER_VOL		0x10000	// override lowest volume
	#define global BASS_SAMPLE_OVER_POS		0x20000	// override longest playing
	#define global BASS_SAMPLE_OVER_DIST		0x30000	// override furthest from listener (3D only)

	// BASS_ChannelSetFX effect types
	#define global BASS_FX_DX8_CHORUS			0
	#define global BASS_FX_DX8_COMPRESSOR		1
	#define global BASS_FX_DX8_DISTORTION		2
	#define global BASS_FX_DX8_ECHO				3
	#define global BASS_FX_DX8_FLANGER			4
	#define global BASS_FX_DX8_GARGLE			5
	#define global BASS_FX_DX8_I3DL2REVERB		6
	#define global BASS_FX_DX8_PARAMEQ			7
	#define global BASS_FX_DX8_REVERB			8
	#define global BASS_FX_VOLUME				9

	#define global BASS_DX8_PHASE_NEG_180		0
	#define global BASS_DX8_PHASE_NEG_90			1
	#define global BASS_DX8_PHASE_ZERO			2
	#define global BASS_DX8_PHASE_90			3
	#define global BASS_DX8_PHASE_180			4

	// BASS_ChannelIsActive return values
	#define global BASS_ACTIVE_STOPPED			0
	#define global BASS_ACTIVE_PLAYING			1
	#define global BASS_ACTIVE_STALLED			2
	#define global BASS_ACTIVE_PAUSED			3
	#define global BASS_ACTIVE_PAUSED_DEVICE		4

	//Channel Attributes
	#define global BASS_ATTRIB_FREQ				1
	#define global BASS_ATTRIB_VOL				2
	#define global BASS_ATTRIB_PAN				3
	#define global BASS_ATTRIB_EAXMIX			4
	#define global BASS_ATTRIB_NOBUFFER			5
	#define global BASS_ATTRIB_VBR				6
	#define global BASS_ATTRIB_CPU				7
	#define global BASS_ATTRIB_SRC				8
	#define global BASS_ATTRIB_NET_RESUME		9
	#define global BASS_ATTRIB_SCANINFO			10
	#define global BASS_ATTRIB_NORAMP			11
	#define global BASS_ATTRIB_BITRATE			12
	#define global BASS_ATTRIB_BUFFER			13
	#define global BASS_ATTRIB_GRANULE			14
	#define global BASS_ATTRIB_MUSIC_AMPLIFY		0x100
	#define global BASS_ATTRIB_MUSIC_PANSEP		0x101
	#define global BASS_ATTRIB_MUSIC_PSCALER		0x102
	#define global BASS_ATTRIB_MUSIC_BPM			0x103
	#define global BASS_ATTRIB_MUSIC_SPEED		0x104
	#define global BASS_ATTRIB_MUSIC_VOL_GLOBAL	0x105
	#define global BASS_ATTRIB_MUSIC_ACTIVE		0x106
	#define global BASS_ATTRIB_MUSIC_VOL_CHAN		0x200
	#define global BASS_ATTRIB_MUSIC_VOL_INST		0x300

	#define global BASS_DATA_FFT4096	0x80000004	// 4096 FFT
	#define global BASS_DATA_FFT8192	0x80000005	// 8192 FFT
	#define global BASS_DATA_FFT16384	0x80000006	// 16384 FFT

	// BASS_SetConfig options
	#define BASS_CONFIG_BUFFER			0
	#define BASS_CONFIG_UPDATEPERIOD	1
	#define BASS_CONFIG_GVOL_SAMPLE		4
	#define BASS_CONFIG_GVOL_STREAM		5
	#define BASS_CONFIG_GVOL_MUSIC		6
	#define BASS_CONFIG_CURVE_VOL		7
	#define BASS_CONFIG_CURVE_PAN		8
	#define BASS_CONFIG_FLOATDSP		9
	#define BASS_CONFIG_3DALGORITHM		10
	#define BASS_CONFIG_NET_TIMEOUT		11
	#define BASS_CONFIG_NET_BUFFER		12
	#define BASS_CONFIG_PAUSE_NOPLAY	13
	#define BASS_CONFIG_NET_PREBUF		15
	#define BASS_CONFIG_NET_PASSIVE		18
	#define BASS_CONFIG_REC_BUFFER		19
	#define BASS_CONFIG_NET_PLAYLIST	21
	#define BASS_CONFIG_MUSIC_VIRTUAL	22
	#define BASS_CONFIG_VERIFY			23
	#define BASS_CONFIG_UPDATETHREADS	24
	#define BASS_CONFIG_DEV_BUFFER		27
	#define BASS_CONFIG_REC_LOOPBACK	28
	#define BASS_CONFIG_VISTA_TRUEPOS	30
	#define BASS_CONFIG_IOS_SESSION		34
	#define BASS_CONFIG_IOS_MIXAUDIO	34
	#define BASS_CONFIG_DEV_DEFAULT		36
	#define BASS_CONFIG_NET_READTIMEOUT	37
	#define BASS_CONFIG_VISTA_SPEAKERS	38
	#define BASS_CONFIG_IOS_SPEAKER		39
	#define BASS_CONFIG_MF_DISABLE		40
	#define BASS_CONFIG_HANDLES			41
	#define BASS_CONFIG_UNICODE			42
	#define BASS_CONFIG_SRC				43
	#define BASS_CONFIG_SRC_SAMPLE		44
	#define BASS_CONFIG_ASYNCFILE_BUFFER 45
	#define BASS_CONFIG_OGG_PRESCAN		47
	#define BASS_CONFIG_MF_VIDEO		48
	#define BASS_CONFIG_AIRPLAY			49
	#define BASS_CONFIG_DEV_NONSTOP		50
	#define BASS_CONFIG_IOS_NOCATEGORY	51
	#define BASS_CONFIG_VERIFY_NET		52
	#define BASS_CONFIG_DEV_PERIOD		53
	#define BASS_CONFIG_FLOAT			54
	#define BASS_CONFIG_NET_SEEK		56
	#define BASS_CONFIG_AM_DISABLE		58
	#define BASS_CONFIG_NET_PLAYLIST_DEPTH	59
	#define BASS_CONFIG_NET_PREBUF_WAIT	60
	#define BASS_CONFIG_ANDROID_SESSIONID	62
	#define BASS_CONFIG_WASAPI_PERSIST	65
	#define BASS_CONFIG_REC_WASAPI		66
	#define BASS_CONFIG_ANDROID_AAUDIO	67
	#define BASS_CONFIG_SAMPLE_ONEHANDLE	69
	#define BASS_CONFIG_DEV_TIMEOUT		70
	#define BASS_CONFIG_NET_META		71
	#define BASS_CONFIG_NET_RESTRATE	72

	// BASS_SetConfigPtr options
	#define BASS_CONFIG_NET_AGENT		16
	#define BASS_CONFIG_NET_PROXY		17
	#define BASS_CONFIG_IOS_NOTIFY		46
	#define BASS_CONFIG_LIBSSL			64

	#define BASS_CONFIG_THREAD			0x40000000 // flag: thread-specific setting

	// BASS_CONFIG_IOS_SESSION flags
	#define BASS_IOS_SESSION_MIX		1
	#define BASS_IOS_SESSION_DUCK		2
	#define BASS_IOS_SESSION_AMBIENT	4
	#define BASS_IOS_SESSION_SPEAKER	8
	#define BASS_IOS_SESSION_DISABLE	16

	// BASS_Init flags
	#define BASS_DEVICE_8BITS		1		// unused
	#define BASS_DEVICE_MONO		2		// mono
	#define BASS_DEVICE_3D			4		// unused
	#define BASS_DEVICE_16BITS		8		// limit output to 16-bit
	#define BASS_DEVICE_REINIT		128		// reinitialize
	#define BASS_DEVICE_LATENCY		0x100	// unused
	#define BASS_DEVICE_CPSPEAKERS	0x400	// unused
	#define BASS_DEVICE_SPEAKERS	0x800	// force enabling of speaker assignment
	#define BASS_DEVICE_NOSPEAKER	0x1000	// ignore speaker arrangement
	#define BASS_DEVICE_DMIX		0x2000	// use ALSA "dmix" plugin
	#define BASS_DEVICE_FREQ		0x4000	// set device sample rate
	#define BASS_DEVICE_STEREO		0x8000	// limit output to stereo
	#define BASS_DEVICE_HOG			0x10000	// hog/exclusive mode
	#define BASS_DEVICE_AUDIOTRACK	0x20000	// use AudioTrack output
	#define BASS_DEVICE_DSOUND		0x40000	// use DirectSound output
	#define BASS_DEVICE_SOFTWARE	0x80000	// disable hardware/fastpath output

	// DirectSound interfaces (for use with BASS_GetDSoundObject)
	#define BASS_OBJECT_DS		1	// IDirectSound
	#define BASS_OBJECT_DS3DL	2	// IDirectSound3DListener

	#module

		#defcfunc d2f double d
			t = d
			return ((d<0)<<31) | (lpeek(t,4)-0x38000000<<3) * (d!0) | (lpeek(t)>>29&7)

		#defcfunc f2d int p1
			temp = 0.0
			lpoke temp, 4, (p1 & 0x80000000) | (((p1 & 0x7fffffff) >> 3) + ((p1 & 0x7fffffff) ! 0) * 0x38000000)
			lpoke temp, 0, p1 << 29
			return temp

	#global

#endif