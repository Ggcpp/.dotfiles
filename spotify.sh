echo username:
read username

echo password
read password

tee -a ./spotifyd/.config/spotifyd/spotifyd.conf << EOF
[global]

username = $username
password = $password

backend = "pulseaudio"
volume_controller = "alsa"

# device = "default:1"
device_name = "acer"

# The audio bitrate. 96, 160 or 320 kbit/s
bitrate = 320

# If set to true, audio data does NOT get cached.
no_audio_cache = true

# Volume on startup between 0 and 100
# NOTE: This variable's type will change in v0.4, to a number (instead of string)
initial_volume = "90"

# If set to true, enables volume normalisation between songs.
volume_normalisation = true

# The normalisation pregain that is applied for each song.
normalisation_pregain = -10

# After the music playback has ended, start playing similar songs based on the previous tracks.
autoplay = true

# The port `spotifyd` uses to announce its service over the network.
zeroconf_port = 1234
device_type = "computer"
EOF
