#!/bin/bash
# incredably scuffed non cleaned up tape
# for generated google translated subs for random videos

# gen scan.srt from whisper with ffmpeg
rm /tmp/{scan.srt,out.srt}
ffmpeg -i "$1" -vn -af "whisper=model=/usr/share/whisper.cpp-model-large-v3-turbo-q5_0/ggml-large-v3-turbo-q5_0.bin\
:language=auto\
:queue=30\
:destination=/tmp/scan.srt\
:format=srt" -f null -

# print identified language and translate
head -n7 /tmp/scan.srt | trans -identify | tail -n 13
trans -b -i /tmp/scan.srt -o /tmp/out.srt

# offer playback and burning with finished data
figlet finished
echo -n "play back media? [Y/n]"
read P
if [ "$P" != "n" ]; then
	mpv "$1" --sub-file=/tmp/out.srt --loop-file=inf
fi
echo -n "burn to /tmp/output for reposting? [y/N]"
read B
if [ "$B" == "y" ]; then
	rm /tmp/output.*
	ffmpeg -i "$1" -vf "subtitles=/tmp/out.srt" \
			   /tmp/output.$(basename "$1" | sed 's/.*\.//')
fi
