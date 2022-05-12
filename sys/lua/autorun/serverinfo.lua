local line = 1
local output = {}
local stats = stats

addhook("join","serverinfo_save")
function serverinfo_save(id)
local usgn = player(id,"usgn")
local steam = player(id,"steamid")
	for i = 1,3 do
	if stats(usgn,"rank") == i or stats(steam,"rank") == i then
		for s in io.lines('sys/serverinfo.txt') do
		  if line == 21 + (i - 1) * 9 then
			output[#output+1] = player(id,"name").."#"..player(id,"usgn")
		  else
			output[#output+1] = s
		  end
		  line = line + 1
		end
	end
local f = io.open('sys/serverinfo.txt','w')
f:write(table.concat(output, '\n'))
f:close()
end
end