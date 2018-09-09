# TV Machine
Ultimately I am going to have a dedicated small form-factor machine permanently setup on my TV.  While I'm still in the very early stages of this, and streaming services try very, very hard to make this as difficult as possible (and should, in general, go fuck themselves), I put some of the initial important information here.

## Audio Output
You will need some of the following if you have a simple laptop.
```bash
pacmd list-cards | grep output
```
Lists available audio output modes.

Then
```bash
pactl set-card-profile 0 output:hdmi-stereo
```
will switch the audio output to the default HDMI output.
```bash
pactl set-card-profile 0 output:analog-stereo
```
will switch back to internal speakers.
