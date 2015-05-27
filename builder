os.loadAPI("/farmboss/bfapi")
os.loadAPI("/farmboss/basics")
os.loadAPI("/farmboss/slots")

args = { ... }

--args = basics.explode(args[1])



if args[3] then
  mode = args[1]
  width = tonumber(args[2])
  height = tonumber(args[3])
  bfapi.init(mode, width, height)
else
  print("Wrong arguments!")
  print("I need: modus width height")
  return false
end


print(mode.." "..width.." "..height)

function start(mode, width, height)
  if not mode or not width or not height then
    print("Wrong parameters!")
    return false
  end
  
  if mode == "dirt" then
    bfapi.destroyUp(true)
    bfapi.up(1, true)
    bfapi.forward(1, true, true)
    slots.useItemSlot(2,6)
    for w = 1, width do
      for h = 1, height do
        print("Schritt "..w.."/"..h)
        --assert(selectSlot(getSlotNr()),"Error")
        
        bfapi.destroy()
        bfapi.destroyUp(true)
        if not (w == 5 and h == 5) then
          slots.useItemSlot(2,6)
          bfapi.plant()
        else
          slots.mount(16)
          bfapi.plant()
          slots.useItemSlot(2,6)
          bfapi.up(1, true)
          bfapi.plantUp()
          bfapi.down()
          
          bfapi.putTorches(15, 2)
        end
        
        if h == height then
          bfapi.changeLine(w, true)
        else
          print("else...")
          bfapi.forward(1, true)
          
        end
      end
    end
    
  bfapi.goHome(width, height, true, true)
  end
end

start(mode, width, height)
