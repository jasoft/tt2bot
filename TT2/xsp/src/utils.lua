
function sixNumToRGB(str_num, OutLine)
    local str_num_six
    if string.len(str_num) == 6 then
        str_num_six = str_num
    else
        str_num_six = string.sub(str_num, 1, 7)
    end

    local RGB = {}
    RGB.r = tonumber(string.sub(str_num_six, 1, 2), 16)
    RGB.g = tonumber(string.sub(str_num_six, 3, 4), 16)
    RGB.b = tonumber(string.sub(str_num_six, 5, 6), 16)

    if OutLine then
        RGB.a = OutLine
    end

    return RGB
end

function isSimilarColor(c1,c2,degree)
	local c1hex=("%0.6X"):format(c1)
    local c2hex=("%0.6X"):format(c2)
    
    c1rgb=sixNumToRGB(c1hex)
    c2rgb=sixNumToRGB(c2hex)
    rdiff=math.abs(c1rgb.r-c2rgb.r)
    gdiff=math.abs(c1rgb.g-c2rgb.g)
    bdiff=math.abs(c1rgb.b-c2rgb.b)
	
    if (((rdiff/256*100+degree)<=100) and ((gdiff/256*100+degree)<=100) and ((bdiff/256*100+degree)<=100)) then
        return true
    else
        return false
    end
end

function isPointSimilarColor(point,color,degree)
	c=getColor(point[1],point[2])
	return isSimilarColor(c,color,degree)
end

function print_r ( t )  
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print("")
end

function split (inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

table.print=print_r
string.split=split