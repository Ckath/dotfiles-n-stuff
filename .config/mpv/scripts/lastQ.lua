-- saves 'last Quited' filename to a !lastQ file in your current directory,
-- useful for keeping track of what episode you were at with a show
--
-- (c) Ckat 03-01-2018

function update_lastQ()
    f = io.open(mp.get_property("working-directory") .. "/!lastQ", "w")
    io.output(f)
    io.write(mp.get_property("filename"))
    io.close(f)

    mp.command("quit-watch-later")
end

mp.add_key_binding("Q", "lastQ", update_lastQ)
