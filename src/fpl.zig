const c = @cImport(@cInclude("final_platform_layer.h"));

pub const Settings = c.fplSettings;
pub const WindowSettings = c.fplWindowSettings;
pub const VideoSettings = c.fplVideoSettings;
pub const AudioSettings = c.fplAudioSettings;
pub const InputSettings = c.fplInputSettings;

pub const InitFlags = struct {
    pub const Type = @TagType(c.fplInitFlags);
    pub const None: Type = @enumToInt(c.fplInitFlags_None);
    pub const Console: Type = @enumToInt(c.fplInitFlags_Console);
    pub const Window: Type = @enumToInt(c.fplInitFlags_Window);
    pub const Video: Type = @enumToInt(c.fplInitFlags_Video);
    pub const Audio: Type = @enumToInt(c.fplInitFlags_Audio);
    pub const GameController: Type = @enumToInt(c.fplInitFlags_GameController);
    pub const All: Type = Console | Window | Video | Audio | GameController;
};

pub fn init(flags: InitFlags.Type, settings: ?*const Settings) !void {
    // We do a ptrCast here to avoid Zig safety check on @intToEnum.
    if (!c.fplPlatformInit(@ptrCast(*const c.fplInitFlags, &flags).*, settings))
        return error.FplInitFailed;
}

pub const release = c.fplPlatformRelease;
pub const windowUpdate = c.fplWindowUpdate;
pub const videoFlip = c.fplVideoFlip;
