-- saves 'last Quited' filename to a !lastQ.m3u file in your current directory,
-- useful for keeping track of what episode you were at with a show
-- now also saves the rest of playlist for correct(er) replaying
--
-- (c) Ckat 03-01-2018

function update_lastQ()
	local f = io.open(mp.get_property("working-directory") .. "/!lastQ.m3u", "w")
	io.output(f)
	local pl = mp.get_property_native("playlist")

	-- if no playlist just save filename
	if not pl or #pl == 0 then
		io.write(mp.get_property("filename"))
		io.close(f)
		return
	end

	-- if playlist save all remaining files
	for i = mp.get_property_number("playlist-pos") + 1, #pl do
		if pl[i].filename then
			io.write(pl[i].filename .. "\n")
		end
	end
	io.close(f)

	mp.command("quit-watch-later")
end

mp.add_key_binding("Q", "lastQ", update_lastQ)
