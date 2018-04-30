// CMake generated file. Do Not Edit.

#pragma once

namespace pangolin {

void RegisterTestVideoFactory();
void RegisterImagesVideoFactory();
void RegisterImagesVideoOutputFactory();
void RegisterSplitVideoFactory();
void RegisterPvnVideoFactory();
void RegisterPangoVideoFactory();
void RegisterPangoVideoOutputFactory();
void RegisterDebayerVideoFactory();
void RegisterShiftVideoFactory();
void RegisterMirrorVideoFactory();
void RegisterUnpackVideoFactory();
void RegisterJoinVideoFactory();
void RegisterMergeVideoFactory();
void RegisterJsonVideoFactory();
void RegisterThreadVideoFactory();
void RegisterFirewireVideoFactory();
void RegisterV4lVideoFactory();
void RegisterFfmpegVideoFactory();
void RegisterFfmpegVideoOutputFactory();
void RegisterRealSenseVideoFactory();
void RegisterOpenNiVideoFactory();
void RegisterOpenNi2VideoFactory();
void RegisterUvcVideoFactory();

inline bool LoadBuiltInVideoDrivers()
{
    RegisterTestVideoFactory();
    RegisterImagesVideoFactory();
    RegisterImagesVideoOutputFactory();
    RegisterSplitVideoFactory();
    RegisterPvnVideoFactory();
    RegisterPangoVideoFactory();
    RegisterPangoVideoOutputFactory();
    RegisterDebayerVideoFactory();
    RegisterShiftVideoFactory();
    RegisterMirrorVideoFactory();
    RegisterUnpackVideoFactory();
    RegisterJoinVideoFactory();
    RegisterMergeVideoFactory();
    RegisterJsonVideoFactory();
    RegisterThreadVideoFactory();
    RegisterFirewireVideoFactory();
    RegisterV4lVideoFactory();
    RegisterFfmpegVideoFactory();
    RegisterFfmpegVideoOutputFactory();
    RegisterRealSenseVideoFactory();
    RegisterOpenNiVideoFactory();
    RegisterOpenNi2VideoFactory();
    RegisterUvcVideoFactory();
    return true;
}

} // pangolin
